package com.qinyou.apiserver.sys.dto;

import com.qinyou.apiserver.core.validator.Email;
import com.qinyou.apiserver.core.validator.Phone;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@ApiModel(description = "User 实体 DTO, 请求参数")
@Data
public class UserDTO {

    @ApiModelProperty(value = "用户名")
    @NotBlank(message = "{usernameBlank}")
    private String id;

    @ApiModelProperty(value = "状态，0正常，1禁用")
    @NotBlank(message = "{stateBlank}")
    private String state;

    @ApiModelProperty(value = "昵称/姓名")
    private String nickname;

    @ApiModelProperty(value = "手机")
    @Phone(message = "{phonePattern}")
    private String phone;

    @ApiModelProperty(value = "邮箱")
    @Email(message = "{emailPattern}")
    private String email;

    @ApiModelProperty(value = "介绍信息")
    private String intro;

    @ApiModelProperty(value = "头像")
    private String avatar;
}
