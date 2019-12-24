package com.qinyou.apiserver.core.base;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * 查询参数，只有筛选条件
 */
@Getter
@Setter
@ApiModel("查询条件")
public class FindDTO implements Serializable {
    private static final long serialVersionUID = 7174726422958857650L;
    @ApiModelProperty(value = "查询参数, key格式例子 search_EQ_id")
    public Map<String,String> filter;

    @ApiModelProperty(value = "排序参数")
    List<OrderDTO> orders;
}
