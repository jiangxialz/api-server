package com.qinyou.apiserver;

import cn.hutool.core.date.DateUtil;
import com.qinyou.apiserver.core.security.JwtUtil;
import com.qinyou.apiserver.core.utils.DateUtils;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import sun.util.resources.LocaleData;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.TemporalField;
import java.util.Date;

@Slf4j
public class JwtUtilTest {

    @Test
    public void test() throws InterruptedException {
        DateUtils.formatDateTime(LocalDateTime.now().withHour(0).withMinute(0).withSecond(0));
        System.out.println(  DateUtil.format(DateUtil.beginOfDay(new Date()),"yyyy-MM-dd HH:mm:ss"));
    }


    @Test
    public void test2(){
       String x =   "search_EQ_action_name";
       x = x.replaceAll("search_","");
       System.out.println(x);
       String a = x.substring(0,x.indexOf("_"));
       System.out.println(a);

       String b = x.substring(x.indexOf("_")+1);
        System.out.println(b);
    }

}
