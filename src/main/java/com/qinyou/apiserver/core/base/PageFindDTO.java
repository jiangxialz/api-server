package com.qinyou.apiserver.core.base;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;


/**
 * 查询参数，带分页 以及 过滤筛选参数
 */
@Getter
@Setter
@ApiModel("查询参数 dto")
public class PageFindDTO extends FindDTO {

    @ApiModelProperty(value = "当前页", example = "1")
    public Long current  = 1L;

    @ApiModelProperty(value = "每页大小",example = "30")
    public Long pageSize = 30L;
}
