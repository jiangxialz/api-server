package com.qinyou.apiserver.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
@ApiModel(description = "Role 实体 DTO, 请求参数")
public class RoleDTO {
    @ApiModelProperty(value = "编码")
    @NotBlank(message = "{codeBlank}")
    private String id;

    @ApiModelProperty(value = "名称")
    @NotBlank(message = "{nameBlank}")
    private String name;

    @ApiModelProperty(value = "说明信息")
    private String intro;

    @ApiModelProperty(value = "状态ON/OFF")
    @NotBlank(message = "{stateBlank}")
    private String state;
}
