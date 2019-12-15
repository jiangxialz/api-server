package com.qinyou.apiserver.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@ApiModel(description = "UserDTO 用户DTO, 接收参数")
@Data
public class UserDTO {

    @ApiModelProperty(value = "用户名")
    @NotBlank(message = "用户名不能为空")
    private String id;

    @ApiModelProperty(value = "状态，0正常，1禁用")
    @NotBlank(message = "状态不能为空")
    private String state;


    @ApiModelProperty(value = "昵称/姓名")
    private String nickname;

    @ApiModelProperty(value = "手机")
    private String phone;

    @ApiModelProperty(value = "邮箱")
    private String email;

    @ApiModelProperty(value = "介绍信息")
    private String intro;

    @ApiModelProperty(value = "头像")
    private String avatar;

    @ApiModelProperty(value = "角色集合，多个逗号分隔")
    String roles;
}
