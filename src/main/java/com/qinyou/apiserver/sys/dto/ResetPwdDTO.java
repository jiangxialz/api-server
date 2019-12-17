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
    @NotBlank(message = "账户不能为空")
    private String account;

    @ApiModelProperty(value = "验证码",required = true)
    @NotBlank(message = "验证码不能为空")
    private String code;

    @ApiModelProperty(value = "新密码",required = true)
    @NotBlank(message = "新密码不能为空")
    private String password;
}
