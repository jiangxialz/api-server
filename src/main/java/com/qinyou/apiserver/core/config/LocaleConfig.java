package com.qinyou.apiserver.core.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * 国际化资源文件配置
 * @author chuang
 */
@Configuration
@Slf4j
public class LocaleConfig {

    // 根据请求头使用语言
    @Bean(name = "localeResolver")
    public CustomeLocaleResolver localeResolver() {
        CustomeLocaleResolver localeResolver = new CustomeLocaleResolver();
        localeResolver.setDefaultLocale(Locale.SIMPLIFIED_CHINESE);
        return localeResolver;
    }
}


@Slf4j
class CustomeLocaleResolver extends AcceptHeaderLocaleResolver {
    private Locale myLocal;

    @Override
    public Locale resolveLocale(HttpServletRequest request) {
        log.debug("Get Request Locale: {}", request.getLocale());
        return myLocal == null ? request.getLocale() : myLocal;
    }

    @Override
    public void setLocale(HttpServletRequest request, HttpServletResponse response, Locale locale) {
        myLocal = locale;
    }
}

