package com.qinyou.apiserver.core.result;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.context.i18n.LocaleContextHolder;

/**
 * 响应信息枚举类
 * @author chuang
 */
@NoArgsConstructor
@AllArgsConstructor
public enum ResponseEnum {
    // 常用操作
    LOGIN_SUCCESS(1000,"登录成功","Login success"),
    ADD_SUCCESS(1001,"添加成功","Add success"),
    UPDATE_SUCCESS(1002,"修改成功","Update success"),
    DELETE_SUCCESS(1003,"删除成功","Delete success"),
    TOGGLE_SUCCESS(1004,"切换成功","Toggle success"),
    RESET_PWD_SUCCESS(1005,"重置密码成功, 新密码: ","Reset password success, new password: "),
    SEND_CODE_SUCCESS(1006,"发送验证码成功","Send safe code success"),
    UPDATE_USERINFO_SUCCESS(1007,"更新用户信息成功","Update user info success"),
    CHANGE_PWD_SUCCESS(1008,"修改密码成功","Change password success"),

    EXCEPTION_MSG(2000,"服务器飘了，管理员去拿刀修理了~","Server error"),
    BAD_SQL(2001,"Sql 执行异常","Sql execute error"),
    BAD_USERNAME(2002,"账号信息不存在","account not exist"),
    BAD_PASSWORD(2003,"账号密码错误","password wrong"),
    ACCOUNT_LOCKED(2004,"账号被锁定","account locked"),
    NOT_SING_IN(2005,"用户未登录或认证失败","account not sign in"),
    ACCESS_DENIED(2006,"无权限禁止访问","Access denied"),
    BAD_PARAM(2007,"参数格式不正确","Params wrong"),
    ADD_FAIL(2008,"添加失败","Add fail"),
    UPDATE_FAIL(2009,"修改失败","Update fail"),
    DELETE_FAIL(2010,"删除失败","Delete fail"),
    TOGGLE_FAIL(2011,"切换失败","Toggle Fail"),
    RESET_PWD_FAIL(2012,"重置密码失败","Reset password fail"),
    SEND_CODE_FAIL(2013,"发送验证码失败","Send safe code fail"),
    CODE_INVALID(2014, "无效验证码","Safe code invalid"),
    ACCOUNT_NOT_EXIST(2015,"账户信息不存在","Account not exist"),
    EMAIL_NOT_FOUND(2016,"邮箱账号不存在","Email not found"),
    PHONE_NOT_FOUND(2017,"手机账号不存在","Phone not found"),
    UPLOAD_FAIL(2018,"文件上传失败","Upload fail"),
    UPDATE_USERINFO_FAIL(2019,"更新用户信息失败","Update user info fail"),
    CHANGE_PWD_FAIL(2020,"修改密码失败","Change password fail");

    private Integer code;

    // 多语言
    private String msg_zh_CN;
    private String msg_en_US;


    public Integer getCode(){
        return code;
    }
    public String getMsg(){
        switch (LocaleContextHolder.getLocale().toString()){
            case "zh_CN": return msg_zh_CN;
            case "en_US": return msg_en_US;
            default:return "Not Support Locale";
        }
    }
}
