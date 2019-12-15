package com.qinyou.apiserver.core.base;

import com.baomidou.mybatisplus.core.metadata.OrderItem;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.Map;

/**
 * 查询参数，只有筛选条件
 */
@Getter
@Setter
@ApiModel("查询参数 dto")
public class FindDTO {

    @ApiModelProperty(value = "查询参数")
    public Map<String,String> filter;

    @ApiModelProperty(value = "排序参数")
    List<OrderDTO> orders;
}
