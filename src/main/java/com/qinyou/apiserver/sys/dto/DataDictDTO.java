package com.qinyou.apiserver.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
@ApiModel(description = "DataDictDTO 字典DTO, 接收参数")
public class DataDictDTO {
    @ApiModelProperty(value = "类型，group组，item组值",allowableValues = "group,item",required = true)
    @NotBlank(message = "类型不能为空")
    private String type;

    @ApiModelProperty(value = "名称",required = true)
    @NotBlank(message = "名称不能为空")
    private String name;

    @ApiModelProperty(value = "编码",required = true)
    @NotBlank(message = "编码不能为空")
    private String code;

    @ApiModelProperty(value = "状态,ON/OFF",allowableValues = "ON,OFF",required = true)
    @NotBlank(message = "状态不能为空")
    private String state;

    @ApiModelProperty(value = "组编码")
    private String groupCode;
}
