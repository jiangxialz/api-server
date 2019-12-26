package com.qinyou.apiserver.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
@ApiModel(description = "DataDict 实体DTO, 请求参数")
public class DataDictDTO {
    @ApiModelProperty(value = "名称",required = true)
    @NotBlank(message = "{nameBlank}")
    private String name;

    @ApiModelProperty(value = "编码",required = true)
    @NotBlank(message = "{codeBlank}")
    private String code;

    @ApiModelProperty(value = "状态,ON/OFF",allowableValues = "ON,OFF",required = true)
    @NotBlank(message = "{stateBlank}")
    private String state;

    @ApiModelProperty(value = "父级id")
    private String pid;

    @ApiModelProperty(value = "排序号")
    private Integer sort;
}
