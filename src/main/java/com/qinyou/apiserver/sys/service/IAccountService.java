package com.qinyou.apiserver.sys.service;

import com.qinyou.apiserver.sys.dto.ChangeInfoDTO;
import com.qinyou.apiserver.sys.dto.ChangePwdDTO;
import com.qinyou.apiserver.sys.dto.ResetPwdDTO;
import com.qinyou.apiserver.sys.dto.UserInfoDTO;


public interface IAccountService {


    /**
     * 用户登录
     *
     * @param username 用户名
     * @param password 密码
     * @return 操作结果
     */
    String login(String username, String password);



    /**
     * 通过用户名 获取用户信息
     * @param username
     * @return
     */
    UserInfoDTO getUserInfo(String username);


    /**
     * 修改用户个人信息
     * @param username
     * @param changeInfoDTO
     */
    void updateUserInfo(String username, ChangeInfoDTO changeInfoDTO);


    /**
     * 通过邮件发送验证码（同步发送）
     * @param email
     */
    void sendMailCode(String email);


    /**
     * 通过手机号发送验证码
     * @param phone
     */
    void sendPhoneCode(String phone);


    /**
     * 通过验证码重置账号验证码
     * @param resetPwdDTO
     */
    void resetPwd(ResetPwdDTO resetPwdDTO);

    /**
     * 用户修改密码
     * @param username
     * @param changePwdDTO
     */
    void changePwd(String username, ChangePwdDTO changePwdDTO);
}
