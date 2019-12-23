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
    @NotBlank(message = "{codeBlank}")
    private String id;

    @ApiModelProperty(value = "名称",required = true)
    @NotBlank(message = "{nameBlank}")
    private String name;

    @ApiModelProperty(value = "状态ON开启OFF禁用",required = true,allowableValues = "ON,OFF")
    @NotBlank(message = "{stateBlank}")
    private String state;

    @ApiModelProperty(value = "类型，menu菜单，btn按钮",required = true,allowableValues = "menu,btn")
    @NotBlank(message = "{typeBlank}")
    private String type;

    @ApiModelProperty(value = "排序号",required = true)
    @NotNull(message = "{sortBlank}")
    private Integer sort;

    @ApiModelProperty(value = "备注")
    private String remark;
}
