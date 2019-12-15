package com.qinyou.apiserver.core.result;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

@Data
@Builder
@ApiModel(value = "请求结果响应体")
public class ResponseResult<T> implements Serializable {
    @ApiModelProperty(value = "状态")
    private boolean status;

    @ApiModelProperty(value = "状态码")
    private Integer code;

    @ApiModelProperty(value = "消息文本")
    private String msg;

    @ApiModelProperty(value = "数据体")
    private T data;

    @ApiModelProperty(value = "时间戳")
    private final long timestamps = System.currentTimeMillis();
    private static final long serialVersionUID = 8992436576262574064L;
}
