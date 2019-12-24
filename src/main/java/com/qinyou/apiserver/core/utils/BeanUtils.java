package com.qinyou.apiserver.core.utils;

import org.springframework.context.MessageSource;

/**
 *  减少每次拿bean性能损耗
 */
public class BeanUtils {
    private static MessageSource messageSource = SpringUtils.getBean(MessageSource.class);
    public static MessageSource  getMessageSource(){
        return messageSource;
    }
}
