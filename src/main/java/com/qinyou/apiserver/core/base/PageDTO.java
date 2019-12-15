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
@AllArgsConstructor
@Getter
@Setter
@ApiModel("查询结果包装")
public class PageDTO<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "当前第几页")
    private Long current;   // 第几页

    @ApiModelProperty(value = "每页大小")
    private Long pageSize; // 每页大小

    @ApiModelProperty(value = "数据总条数")
    private Long total;    // 记录总行数

    @ApiModelProperty(value = "总页数")
    private Long pages;    // 页数

    @ApiModelProperty(value = "数据记录")
    List<T> records;       // 数据记录
}
