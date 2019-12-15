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
@ApiModel(description = "修改密码 ChangePwdDTO, 接收参数")
public class ChangePwdDTO {

    @ApiModelProperty(value = "新密码",required = true)
    @NotBlank(message = "原始密码")
    private String oldPwd;

    @ApiModelProperty(value = "新密码",required = true)
    @NotBlank(message = "新密码")
    private String newPwd;
}
