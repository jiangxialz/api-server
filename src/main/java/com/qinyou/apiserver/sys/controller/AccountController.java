package com.qinyou.apiserver.sys.controller;

import cn.hutool.core.lang.Validator;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.qinyou.apiserver.core.aop.SysLog;
import com.qinyou.apiserver.core.base.PageDTO;
import com.qinyou.apiserver.core.base.PageFindDTO;
import com.qinyou.apiserver.core.result.RequestException;
import com.qinyou.apiserver.core.result.ResponseEnum;
import com.qinyou.apiserver.core.result.ResponseResult;
import com.qinyou.apiserver.core.security.JwtClaim;
import com.qinyou.apiserver.core.utils.WebUtils;
import com.qinyou.apiserver.sys.dto.*;
import com.qinyou.apiserver.sys.entity.Log;
import com.qinyou.apiserver.sys.service.IAccountService;
import com.qinyou.apiserver.sys.service.ILogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.xml.ws.Response;
import java.util.HashMap;
import java.util.Map;

@Api(tags = "账号认证")
@Slf4j
@RestController
@RequestMapping("/account")
public class AccountController {

    @Autowired
    IAccountService accountService;
    @Autowired
    ILogService logService;

    // token 持续时间，单位小时, 用于前台本地保存时间
    @Value("${app.jwt.expire-idle}")
    Integer expireIdle;

    @ApiOperation("用户登录")
    @SysLog(type = "0")
    @PostMapping(value = "/login")
    public ResponseResult<Map<String,Object>> getToken(@RequestBody @Validated LoginDTO loginDTO) {
        String token = accountService.login(loginDTO.getUsername(),loginDTO.getPassword());
        Map<String,Object> ret = new HashMap<>();
        ret.put("token","Bearer "+token);
        ret.put("expireIdle",expireIdle);
        return WebUtils.ok(ResponseEnum.LOGIN_SUCCESS,ret);
    }

    @ApiOperation("获得用户信息、用户角色权限")
    @ApiImplicitParam(name = "Authorization", required = true, paramType ="header",value = "身份认证Token")
    @SysLog()
    @GetMapping("/user-info")
    public ResponseResult<UserInfoDTO> getUserInfo(@JwtClaim String username){
        UserInfoDTO userInfoDTO = accountService.getUserInfo(username);
        return WebUtils.ok(userInfoDTO);
    }

    @ApiOperation("修改用户信息")
    @ApiImplicitParam(name = "Authorization", required = true, paramType ="header",value = "身份认证Token")
    @SysLog(type = "0")
    @PostMapping("/update-user-info")
    public ResponseResult<UserInfoDTO> updateUserInfo(@JwtClaim String username, @RequestBody UserInfoDTO2 userInfoDTO2){
        accountService.updateUserInfo(username,userInfoDTO2);
        return WebUtils.ok(ResponseEnum.UPDATE_USERINFO_SUCCESS);
    }

    @ApiOperation("通过邮箱发送验证码, 用于重置账号密码")
    @SysLog()
    @GetMapping(value = "/send-email-code/{email}")
    public ResponseResult sendVerificationCodeByEmail(@PathVariable String email){
         if(!Validator.isEmail(email)){
             throw RequestException.fail(ResponseEnum.BAD_PARAM);
         }
         accountService.sendMailCode(email);
         return WebUtils.ok(ResponseEnum.SEND_CODE_SUCCESS);
    }

    @ApiOperation("通过邮箱发送验证码, 用于重置账号密码")
    @SysLog()
    @GetMapping(value = "/send-phone-code/{phone}")
    public ResponseResult sendVerificationCodeByPhone(@PathVariable String phone){
        if(!Validator.isMobile(phone) && !"15238002477".equals(phone)){
            throw RequestException.fail(ResponseEnum.BAD_PARAM);
        }
        accountService.sendPhoneCode(phone);
        return WebUtils.ok(ResponseEnum.SEND_CODE_SUCCESS);
    }


    @ApiOperation("通过验证码重置账号密码")
    @SysLog(type = "0")
    @PostMapping(value = "/reset-password")
    public ResponseResult resetPwd(@RequestBody @Validated ResetPwdDTO resetPwdDTO){
        accountService.resetPwd(resetPwdDTO);
        return WebUtils.ok(ResponseEnum.RESET_PWD_SUCCESS);
    }


    @ApiOperation("用户修改密码")
    @ApiImplicitParam(name = "Authorization", required = true, paramType ="header",value = "身份认证Token")
    @SysLog(type = "0")
    @PostMapping(value = "/change-password")
    public ResponseResult changePwd(@JwtClaim String username,@RequestBody @Validated ChangePwdDTO changePwdDTO){
        accountService.changePwd(username,changePwdDTO);
        return WebUtils.ok(ResponseEnum.CHANGE_PWD_SUCCESS);
    }

    @ApiOperation("查询用户日志,带分页")
    @ApiImplicitParam(name = "Authorization", required = true, paramType ="header",value = "身份认证Token")
    @PostMapping("/list-log")
    public ResponseResult<PageDTO<Log>> list(@JwtClaim String username, @RequestBody PageFindDTO pageFindDto) {
        QueryWrapper<Log> queryWrapper = WebUtils.buildSearchQueryWrapper(pageFindDto);
        queryWrapper.select("id","username","ip","uri","action_name","create_time");
        queryWrapper.eq("username",username);
        queryWrapper.eq("type","0"); // 0 代表用户可见，给用户看的日志
        queryWrapper.orderByDesc("create_time");

        IPage<Log> page = WebUtils.buildSearchPage(pageFindDto);
        PageDTO<Log> pageDTO = WebUtils.buildResultPage(logService.page(page, queryWrapper));

        return WebUtils.ok(pageDTO);
    }

}
