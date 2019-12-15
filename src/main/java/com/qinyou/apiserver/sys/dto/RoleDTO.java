package com.qinyou.apiserver.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
@ApiModel(description = "RoleDTO 角色DTO, 接收参数")
public class RoleDTO {
    @ApiModelProperty(value = "编码")
    @NotBlank(message = "角色编码不能为空")
    private String id;

    @ApiModelProperty(value = "名称")
    @NotBlank(message = "角色名称不能为空")
    private String name;

    @ApiModelProperty(value = "说明信息")
    private String intro;

    @ApiModelProperty(value = "状态ON/OFF")
    @NotBlank(message = "角色状态不能为空")
    private String state;
}
