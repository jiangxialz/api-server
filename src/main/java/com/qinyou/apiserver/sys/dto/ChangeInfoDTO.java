package com.qinyou.apiserver.sys.dto;

import com.qinyou.apiserver.core.validator.Email;
import com.qinyou.apiserver.core.validator.Phone;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;


@Data
@ApiModel(description = "修改用户信息 请求参数")
public class ChangeInfoDTO {
    @ApiModelProperty(value = "昵称/姓名")
    private String nickname;

    @ApiModelProperty(value = "手机")
    @NotBlank(message = "{phoneBlank}")
    @Phone(message = "{phonePattern}")
    private String phone;

    @ApiModelProperty(value = "邮箱")
    @NotBlank(message = "{emailBlank}")
    @Email(message = "{emailPattern}")
    private String email;

    @ApiModelProperty(value = "介绍信息")
    private String intro;

    @ApiModelProperty(value = "头像")
    @NotBlank(message = "{avatarBlank}")
    private String avatar;
}
