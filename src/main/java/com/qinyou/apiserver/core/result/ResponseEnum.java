package com.qinyou.apiserver.core.result;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
 * @author Licoy
 * @version 2018/4/18/10:54
 */
@NoArgsConstructor
@AllArgsConstructor
public enum ResponseEnum {
    // 常用操作
    LOGIN_SUCCESS(1000,"登录成功"),
    ADD_SUCCESS(1001,"添加成功"),
    UPDATE_SUCCESS(1002,"修改成功"),
    DELETE_SUCCESS(1003,"删除成功"),
    TOGGLE_SUCCESS(1004,"切换成功"),
    RESET_PWD_SUCCESS(1005,"重置密码成功"),
    SEND_CODE_SUCCESS(1006,"发送验证码成功"),
    UPDATE_USERINFO_SUCCESS(1007,"更新用户信息成功"),
    CHANGE_PWD_SUCCESS(1008,"修改密码成功"),


    EXCEPTION_MSG(2000,"服务器飘了，管理员去拿刀修理了~"),
    BAD_SQL(2001,"Sql 执行异常"),
    BAD_USERNAME(2002,"账号信息不存在"),
    BAD_PASSWORD(2003,"账号密码错误"),
    ACCOUNT_LOCKED(2004,"账号被锁定"),
    NOT_SING_IN(2005,"用户未登录或认证失败"),
    ACCESS_DENIED(2006,"无权限禁止访问"),

    BAD_PARAM(2007,"参数格式不正确"),
    ADD_FAIL(2008,"添加失败"),
    UPDATE_FAIL(2009,"修改失败"),
    DELETE_FAIL(2010,"修改失败"),
    TOGGLE_FAIL(2011,"切换失败"),
    RESET_PWD_FAIL(2012,"重置密码失败"),
    SEND_CODE_FAIL(2013,"发送验证码失败"),
    CODE_INVALID(2014, "无效验证码"),
    ACCOUNT_NOT_EXIST(2015,"账户信息不存在"),
    EMAIL_NOT_FOUND(2016,"邮箱账号不存在"),
    PHONE_NOT_FOUND(2017,"手机账号不存在"),
    UPLOAD_FAIL(2018,"文件上传失败"),
    UPDATE_USERINFO_FAIL(2019,"更新用户信息失败"),
    CHANGE_PWD_FAIL(2020,"修改密码失败");

    public Integer code;
    public String msg;
}
