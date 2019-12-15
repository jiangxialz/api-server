package com.qinyou.apiserver.core.config;


import com.qinyou.apiserver.core.security.JwtArgumentResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

/**
 *
 */
@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Autowired
    JwtArgumentResolver jwtArgumentResolver;

    // 自定义参数解析
    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        // header Authorization 解析
        argumentResolvers.add(jwtArgumentResolver);
    }
}
