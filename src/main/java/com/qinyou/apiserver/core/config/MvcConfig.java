package com.qinyou.apiserver.core.config;


import com.qinyou.apiserver.core.security.JwtArgumentResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

/**
 * mvc 配置
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

    @Value("${app.upload.access-path}")
    String uploadAccessPath;
    @Value("${app.upload.upload-folder}")
    String uploadFileFolder;
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 文件上传后 静态文件访问路径
        registry.addResourceHandler(uploadAccessPath).addResourceLocations("file:"+uploadFileFolder);
    }
}
