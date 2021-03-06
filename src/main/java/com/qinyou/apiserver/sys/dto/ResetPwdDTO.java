package com.qinyou.apiserver.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * 重置密码 dto
 */
@Getter
@Setter
@ApiModel(description = "通过验证码 修改密码 请求参数")
public class ResetPwdDTO {

    @ApiModelProperty(value = "账户(邮箱或电话）",required = true)
    @NotBlank(message = "{resetPwd.account}")
    private String account;

    @ApiModelProperty(value = "验证码",required = true)
    @NotBlank(message = "{resetPwd.code}")
    private String code;

    @ApiModelProperty(value = "新密码",required = true)
    @NotBlank(message = "{newPwdBlank}")
    private String password;
}
