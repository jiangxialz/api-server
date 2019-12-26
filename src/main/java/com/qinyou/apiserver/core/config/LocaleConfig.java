package com.qinyou.apiserver.core.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
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

    // 自定义 messageResource
    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasenames("classpath:i18n/validate","classpath:i18n/message");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }

    // 自定义 validator 使用数据源
    @Bean
    public LocalValidatorFactoryBean getValidator() {
        LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
        bean.setValidationMessageSource(messageSource());
        return bean;
    }

    // 根据请求头解析语言
    @Bean(name = "localeResolver")
    public CustomLocaleResolver localeResolver() {
        CustomLocaleResolver localeResolver = new CustomLocaleResolver();
        localeResolver.setDefaultLocale(Locale.SIMPLIFIED_CHINESE);
        return localeResolver;
    }
}


@Slf4j
class CustomLocaleResolver extends AcceptHeaderLocaleResolver {
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

