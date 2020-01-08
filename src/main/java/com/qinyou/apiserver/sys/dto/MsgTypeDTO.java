package com.qinyou.apiserver.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Set;

@ApiModel(description = "MsgType 实体 DTO, 请求参数")
@Data
public class MsgTypeDTO {
    @ApiModelProperty(value = "类型编码")
    private String id;

    @ApiModelProperty(value = "推送方式")
    private String pushMode;

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "LOGO图标")
    private String logo;

    @ApiModelProperty(value = "状态ON/OFF")
    private String state;

    @ApiModelProperty(value = "消息模板")
    private String template;

    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "过期天数（多少天过期）")
    private Integer expiry;

    @ApiModelProperty(value = "存活天数 （多少天自动删除）")
    private Integer dead;

    @ApiModelProperty(value = "用户编码或角色编码，多个逗号分隔,user:xx,role:xx")
    private Set<String> audience;
}
