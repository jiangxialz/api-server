package com.qinyou.apiserver.sys.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qinyou.apiserver.core.result.RequestException;
import com.qinyou.apiserver.core.result.ResponseEnum;
import com.qinyou.apiserver.core.utils.WebUtils;
import com.qinyou.apiserver.sys.dto.UserDTO;
import com.qinyou.apiserver.sys.entity.User;
import com.qinyou.apiserver.sys.entity.UserRole;
import com.qinyou.apiserver.sys.mapper.UserMapper;
import com.qinyou.apiserver.sys.service.IUserRoleService;
import com.qinyou.apiserver.sys.service.IUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * <p>
 * 系统用户表 服务实现类
 * </p>
 *
 * @author chuang
 * @since 2019-10-19
 */
@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Value("${app.user-default-password}")
    String userDefaultPwd;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    IUserRoleService userRoleService;

    @Override
    public void add(UserDTO userDTO) {
        // 验证手机号邮箱是否存在
        if(StrUtil.isNotBlank(userDTO.getPhone()) && checkExist(null,userDTO.getPhone(),null)){
            throw RequestException.fail(ResponseEnum.PHONE_EXIST);
        }
        if(StrUtil.isNotBlank(userDTO.getEmail()) && checkExist(null,null,userDTO.getEmail())){
            throw RequestException.fail(ResponseEnum.EMAIL_EXIST);
        }
        User user = new User();
        BeanUtils.copyProperties(userDTO,user);
        user.setPassword(passwordEncoder.encode(userDefaultPwd))
                .setCreater(WebUtils.getSecurityUsername())
                .setCreateTime(LocalDateTime.now());
        this.save(user);
    }

    @Override
    public void update(String id, UserDTO userDTO) {
        User user = this.getById(id);
        if(user==null){
            throw RequestException.fail(ResponseEnum.UPDATE_FAIL);
        }
        // 验证手机号邮箱是否存在
        if(StrUtil.isNotBlank(userDTO.getPhone()) && checkExist(user.getId(),userDTO.getPhone(),null)){
            throw RequestException.fail(ResponseEnum.PHONE_EXIST);
        }
        if(StrUtil.isNotBlank(userDTO.getEmail()) && checkExist(user.getId(),null,userDTO.getEmail())){
            throw RequestException.fail(ResponseEnum.EMAIL_EXIST);
        }

        BeanUtils.copyProperties(userDTO,user,"id");
        user.setUpdateTime(LocalDateTime.now()).setUpdater(WebUtils.getSecurityUsername());
        this.updateById(user);
    }


    @Transactional
    @Override
    public void remove(String id) {
        User user = this.getById(id);
        if(user==null){
            throw RequestException.fail(ResponseEnum.DELETE_FAIL);
        }
        this.removeById(id);
        userRoleService.remove(new QueryWrapper<UserRole>().eq("user_id",id));
    }

    @Override
    public void toggleState(String id) {
        User user = this.getById(id);
        if(user==null){
            throw RequestException.fail(ResponseEnum.TOGGLE_FAIL);
        }
        String state = "0".equals(user.getState()) ? "1":"0";
        this.update(
                new UpdateWrapper<User>().set("state",state)
                        .set("updater", WebUtils.getSecurityUsername())
                        .set("update_time",LocalDateTime.now())
                        .eq("id",id)
        );
    }

    /**
     * 重置密码
     * @param id
     */
    @Override
    public void resetPwd(String id) {
        User user = this.getById(id);
        if(user==null){
            throw RequestException.fail(ResponseEnum.RESET_PWD_FAIL);
        }
        user.setPassword(passwordEncoder.encode(userDefaultPwd))
                .setUpdater(WebUtils.getSecurityUsername())
                .setUpdateTime(LocalDateTime.now());
        this.updateById(user);
    }


    /**
     * 手机号或邮箱否存在, 可排除自身
     * @param username 可为null
     * @param phone
     * @param email
     * @return
     */
    @Override
    public boolean checkExist(String username,String phone, String email){
        if((phone == null && email==null) || (phone !=null && email!=null )){
            // phone 、email 参数不同时存在 且 不同时 为null
            throw new IllegalArgumentException();
        }
        QueryWrapper<User> query = new QueryWrapper<>();
        query.eq(phone!=null, "phone",phone);
        query.eq(email!=null, "email",email);
        User user = this.getOne(query);
        if(user==null){
            return  false;
        }
        if(user.getId().equals(username)){
            return false;
        }
        return true;
    }


}
