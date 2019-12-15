package com.qinyou.apiserver.sys.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.qinyou.apiserver.core.result.RequestException;
import com.qinyou.apiserver.core.result.ResponseEnum;
import com.qinyou.apiserver.core.security.JwtUtil;
import com.qinyou.apiserver.core.utils.DateUtils;
import com.qinyou.apiserver.core.utils.MailUtils;
import com.qinyou.apiserver.core.utils.SmsUtils;
import com.qinyou.apiserver.core.utils.WebUtils;
import com.qinyou.apiserver.sys.dto.ChangePwdDTO;
import com.qinyou.apiserver.sys.dto.ResetPwdDTO;
import com.qinyou.apiserver.sys.dto.UserInfoDTO;
import com.qinyou.apiserver.sys.dto.UserInfoDTO2;
import com.qinyou.apiserver.sys.entity.User;
import com.qinyou.apiserver.sys.entity.VerificationCode;
import com.qinyou.apiserver.sys.mapper.UserMapper;
import com.qinyou.apiserver.sys.service.IAccountService;
import com.qinyou.apiserver.sys.service.IUserService;
import com.qinyou.apiserver.sys.service.IVerificationCodeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Service
@Slf4j
public class AccountServiceImpl implements IAccountService {
    // 验证码最长有效期
    @Value("${app.safe-code.max-duration}")
    Integer maxDuration;
    // 重置密码 验证码邮件主题
    @Value("${app.safe-code.email-subject}")
    String  emailSubject;
    // 同账号 同目的 邮件发送最小频率，单位分钟, 限制账号高频率发邮件
    @Value("${app.safe-code.min-rate}")
    Integer minRate = 1;
    // 同账号短信验证码 每天最大发送数量
    @Value("${app.safe-code.phone-max-number}")
    Integer maxNumber;

    @Autowired
    UserMapper userMapper;
    @Autowired
    IUserService userService;
    @Autowired
    IVerificationCodeService verificationCodeService;
    @Autowired
    AuthenticationManager authenticationManager;
    @Qualifier("jwtUserDetailsService")
    @Autowired
    UserDetailsService userDetailsService;
    @Autowired
    JwtUtil jwtUtil;
    @Autowired
    MailUtils mailUtils;
    @Autowired
    SmsUtils smsUtils;
    @Autowired
    PasswordEncoder passwordEncoder;


    @Override
    public String login(String username, String password) {
        // 身份认证，验证用户名密码
        UsernamePasswordAuthenticationToken upToken = new UsernamePasswordAuthenticationToken(username, password);
        Authentication authentication = authenticationManager.authenticate(upToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return jwtUtil.generate(username);
    }

    @Override
    public UserInfoDTO getUserInfo(String username) {
        UserInfoDTO userInfoDTO = new UserInfoDTO();
        User user = userService.getOne(new QueryWrapper<User>().eq("id",username));
        if(user==null){
            throw  new UsernameNotFoundException ("Username Not Found");
        }
        BeanUtils.copyProperties(user,userInfoDTO);
        userInfoDTO.setUsername(user.getId());
        userInfoDTO.setRoles(userMapper.getUserRoles(username));
        userInfoDTO.setResources(userMapper.getUserResources(username));

        if(log.isDebugEnabled()){
            log.debug("user info: {}", WebUtils.toJSONString(userInfoDTO));
        }
        return userInfoDTO;
    }

    @Override
    public void updateUserInfo(String username, UserInfoDTO2 userInfoDTO2) {
        User user = userService.getById(username);
        if(user==null){
            throw RequestException.fail(ResponseEnum.UPDATE_USERINFO_FAIL);
        }
        BeanUtils.copyProperties(userInfoDTO2,user);
        user.setUpdateTime(LocalDateTime.now()).setUpdater(WebUtils.getSecurityUsername());
        userService.updateById(user);
    }

    @Override
    public void sendMailCode(String email) {
        User user = userService.getOne(new QueryWrapper<>(new User().setEmail(email)));
        if(user==null){
            throw RequestException.fail(ResponseEnum.EMAIL_NOT_FOUND);
        }

        //  限制相同目的、高频率 同账号 多次发送邮件
        List<VerificationCode> verificationCodes = verificationCodeService.list(
                new QueryWrapper<VerificationCode>()
                        .ge("create_time",DateUtils.formatDateTime(LocalDateTime.now().minusDays(1)))
                        .eq("account",email)
                        .eq("purpose","0")
                .orderBy(true,false,"create_time")
        );
        if(verificationCodes.size() > 0 ){
            VerificationCode verificationCode = verificationCodes.get(0);
           if( Duration.between(verificationCode.getCreateTime(),LocalDateTime.now()).toMinutes() < minRate){
               log.debug("间隔小于{}分钟，发送邮件失败",minRate);
               throw RequestException.fail(ResponseEnum.SEND_CODE_FAIL);
           }
        }

        String code = RandomUtil.randomNumbers(6);
        boolean flag = mailUtils.sendTextMail(email, emailSubject,code);
        if(!flag){
            throw RequestException.fail(ResponseEnum.SEND_CODE_FAIL);
        }
        // 存库
        addVerificationCode(email,code);
    }

    @Override
    public void sendPhoneCode(String phone) {
        User user = userService.getOne(new QueryWrapper<>(new User().setPhone(phone)));
        if(user==null){
            throw RequestException.fail(ResponseEnum.PHONE_NOT_FOUND);
        }
        //  限制 同目的、同账号高频率 多次发送短信验证码
        String beginOfToday = DateUtil.format(DateUtil.beginOfDay(new Date()),"yyyyy-MM-dd");
        List<VerificationCode> verificationCodes = verificationCodeService.list(
                new QueryWrapper<VerificationCode>()
                        .ge("create_time",beginOfToday)
                        .eq("account",phone)
                        .eq("purpose","0")
                        .orderBy(true,false,"create_time")
        );
        if(verificationCodes.size() > maxNumber ){
            log.debug("发送短信验证码失败, {} 发送数量大于 {}");
            throw RequestException.fail(ResponseEnum.SEND_CODE_FAIL);
        }
        if(verificationCodes.size() > 0 ){
            VerificationCode verificationCode = verificationCodes.get(0);
            if( Duration.between(verificationCode.getCreateTime(),LocalDateTime.now()).toMinutes() < minRate){
                log.debug("间隔小于{}分钟，发送短信失败",minRate);
                throw RequestException.fail(ResponseEnum.SEND_CODE_FAIL);
            }
        }

        String code = RandomUtil.randomNumbers(6);
        boolean flag = smsUtils.send(phone,code);
        if(!flag){
            throw RequestException.fail(ResponseEnum.SEND_CODE_FAIL);
        }
        addVerificationCode(phone,code);
    }

    @Transactional
    @Override
    public void resetPwd(ResetPwdDTO resetPwdDTO) {
        List<VerificationCode> verificationCodes = verificationCodeService.list(
                new QueryWrapper<VerificationCode>()
                        .eq("code",resetPwdDTO.getCode())
                        .eq("account",resetPwdDTO.getAccount())
                        .eq("purpose","0")  // 0 代表用途重置密码
                        .eq("state","0")    // 0 代表 未使用
                        .ge("create_time", LocalDateTime.now().minusDays(1))
                        .orderBy(true,false,"create_time")
        );

        // 找不到数据
        if(verificationCodes.size() ==0){
            log.debug("1天内不存在验证码，account {} : code {} : purpose 0",resetPwdDTO.getAccount(),resetPwdDTO.getCode());
            throw  new RequestException(ResponseEnum.CODE_INVALID);
        }
        VerificationCode verificationCode = verificationCodes.get(0);

        // 过期
        if(Duration.between(verificationCode.getCreateTime(),LocalDateTime.now()).toMinutes() >= maxDuration){
            log.debug("验证码过期，account {} : code {} : purpose 0",resetPwdDTO.getAccount(),resetPwdDTO.getCode());
            throw  new RequestException(ResponseEnum.CODE_INVALID);
        }

        User user  = userService.getOne(
                new QueryWrapper<User>()
                        .eq("email",resetPwdDTO.getAccount())
                        .or()
                        .eq("phone",resetPwdDTO.getAccount())
        );
        if(user == null) {
            throw  new RequestException(ResponseEnum.ACCOUNT_NOT_EXIST);
        }
        user.setPassword(passwordEncoder.encode(resetPwdDTO.getPassword()))
                .setUpdateTime(LocalDateTime.now()).setUpdater(user.getId());
        userService.updateById(user);
        verificationCode.setState("1");
        verificationCodeService.updateById(verificationCode);
    }

    @Override
    public void changePwd(String username, ChangePwdDTO changePwdDTO) {
        User user = userService.getById(username);
        if(user==null){
            log.debug("用户{} 信息不存在");
            throw  RequestException.fail(ResponseEnum.CHANGE_PWD_FAIL);
        }
        if(!passwordEncoder.matches(changePwdDTO.getOldPwd(),user.getPassword())){
            log.debug("用户{} 密码 {} 错误",username,changePwdDTO.getOldPwd());
            throw  RequestException.fail(ResponseEnum.CHANGE_PWD_FAIL);
        }
        String hashPwd = passwordEncoder.encode(changePwdDTO.getNewPwd());
        userService.update(
                new UpdateWrapper<User>()
                        .set("password",hashPwd)
                        .eq("id",user.getId())
        );
    }


    /**
     * 发送验证码成功后，验证码存库
     * @param account
     * @param code
     */
    private void addVerificationCode(String account,String code){
        VerificationCode verificationCode = new VerificationCode()
                .setAccount(account)
                .setState("0")
                .setPurpose("0")
                .setCode(code)
                .setCreateTime(LocalDateTime.now());
        verificationCodeService.saveOrUpdate(verificationCode);
    }
}
