package com.qinyou.apiserver.core.base;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;


/**
 * 查询参数，带分页 以及 过滤筛选参数
 */
@Getter
@Setter
@ApiModel("分页查询条件")
public class PageFindDTO extends FindDTO implements Serializable {
    private static final long serialVersionUID = -8941653578410845887L;

    @ApiModelProperty(value = "当前页", example = "1")
    public Long current  = 1L;

    @ApiModelProperty(value = "每页大小",example = "30")
    public Long pageSize = 30L;
}
