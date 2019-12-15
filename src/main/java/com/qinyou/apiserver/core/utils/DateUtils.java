package com.qinyou.apiserver.core.utils;

import lombok.extern.slf4j.Slf4j;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Slf4j
public class DateUtils {
    static final  DateTimeFormatter  DEFAULT_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    /**
     * 格式化
     * @param localDateTime
     * @return
     */
    public static String formatDateTime(LocalDateTime localDateTime){
        String date = localDateTime.format(DEFAULT_FORMATTER);
        log.debug("date: {}",date);
        return date;
    }
}
