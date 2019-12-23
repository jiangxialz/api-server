package com.qinyou.apiserver.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * 修改密码 dto
 */
@Getter
@Setter
@ApiModel(description = "原始密码修改密码 请求参数")
public class ChangePwdDTO {

    @ApiModelProperty(value = "原始密码",required = true)
    @NotBlank(message = "{changePwd.oldPwdBlank}")
    private String oldPwd;

    @ApiModelProperty(value = "新密码",required = true)
    @NotBlank(message = "{newPwdBlank}")
    private String newPwd;
}
