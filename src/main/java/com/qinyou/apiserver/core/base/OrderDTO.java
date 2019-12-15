package com.qinyou.apiserver.core.base;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 排序参数
 */
@Getter
@Setter
@ApiModel("排序参数 dto")
public class OrderDTO {

    @ApiModelProperty(value = "排序字段")
    public String column;

    @ApiModelProperty(value = "排序方式")
    public String sort = "asc";
}
