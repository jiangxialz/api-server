package com.qinyou.apiserver.core.result;

import lombok.*;

import java.io.Serializable;


/**
 * 自定义 runtime 异常
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class RequestException extends RuntimeException implements Serializable {
    private Integer code;
    private String msg;
    private Exception e;

    public RequestException(ResponseEnum statusEnum, Exception e) {
        this.code = statusEnum.getCode();
        this.msg = statusEnum.getMsg();
        this.e = e;
    }

    public RequestException(ResponseEnum statusEnum) {
        this.code = statusEnum.getCode();
        this.msg = statusEnum.getMsg();
    }

    public static RequestException fail(ResponseEnum responseEnum) {
        return RequestException.builder()
                .code(responseEnum.getCode()).msg(responseEnum.getMsg())
                .build();
    }

    public static RequestException fail(ResponseEnum responseEnum, Object[] msgArgs) {
        return RequestException.builder()
                .code(responseEnum.getCode()).msg(responseEnum.getMsg(msgArgs))
                .build();
    }

    public static RequestException fail(ResponseEnum responseEnum, Exception e) {
        return RequestException.builder()
                .code(responseEnum.getCode()).msg(responseEnum.getMsg())
                .e(e).build();
    }
}
