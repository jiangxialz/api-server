package com.qinyou.apiserver.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@ApiModel(description = "Resource 实体 DTO, 请求参数")
public class ResourceDTO {

    @ApiModelProperty(value = "资源编码",required = true)
    @NotBlank(message = "资源编码不能为空")
    private String id;

    @ApiModelProperty(value = "名称",required = true)
    @NotBlank(message = "资源名称不能为空")
    private String name;

    @ApiModelProperty(value = "状态ON开启OFF禁用",required = true,allowableValues = "ON,OFF")
    @NotBlank(message = "资源状态不能为空")
    private String state;

    @ApiModelProperty(value = "类型，menu菜单，btn按钮",required = true,allowableValues = "menu,btn")
    @NotBlank(message = "资源类型不能为空")
    private String type;

    @ApiModelProperty(value = "排序号",required = true)
    @NotNull(message = "排序号不能为空")
    private Integer sort;

    @ApiModelProperty(value = "备注")
    private String remark;
}
