package com.qinyou.apiserver.core.result;


import lombok.*;

import java.io.Serializable;

@EqualsAndHashCode(callSuper = true)
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RequestException extends RuntimeException implements Serializable {
    private Integer code;
    private String msg;
    private Exception e;

    public RequestException(ResponseEnum statusEnum, Exception e) {
        this.code = statusEnum.code;
        this.msg = statusEnum.msg;
        this.e = e;
    }


    public RequestException(ResponseEnum statusEnum) {
        this.code = statusEnum.code;
        this.msg = statusEnum.msg;
    }

    public static RequestException fail(ResponseEnum responseEnum){
        return RequestException.builder()
                .code(responseEnum.code).msg(responseEnum.msg)
                .build();
    }

    public static RequestException fail(ResponseEnum responseEnum, Exception e){
        return RequestException.builder()
                .code(responseEnum.code).msg(responseEnum.msg)
                .e(e).build();
    }
}
