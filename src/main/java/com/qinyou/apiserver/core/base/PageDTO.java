package com.qinyou.apiserver.core.base;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

/**
 * 数据库分页查询结果 数据封装
 */
@Getter
@Setter
@AllArgsConstructor
@ApiModel("分页查询结果")
public class PageDTO<T> implements Serializable {

    private static final long serialVersionUID = 4544997973824241218L;

    @ApiModelProperty(value = "当前第几页")
    private Long current;

    @ApiModelProperty(value = "每页大小")
    private Long pageSize;

    @ApiModelProperty(value = "数据总条数")
    private Long total;

    @ApiModelProperty(value = "总页数")
    private Long pages;

    @ApiModelProperty(value = "数据记录")
    List<T> records;
}
