package com.qinyou.apiserver.core.config;

import com.qinyou.apiserver.core.security.JwtClaim;
import com.qinyou.apiserver.core.security.JwtUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.List;

/**
 * swagger 配置，dev 环境生效
 *
 * @author chuang
 */
@Profile("dev")
@Slf4j
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Bean
    public Docket createAccountAPI() {
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("1. 账号认证")
                .apiInfo(createApiInfo("账号认证", "账号认证、密码重置，用户信息等"))
                .ignoredParameterTypes(JwtClaim.class)
                .select()
                .paths(PathSelectors.ant("/account/**"))
                .build();
    }

    @Bean
    public Docket createSysAPI() {
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("2. 后台管理")
                .apiInfo(createApiInfo("后台配置", "权限管理、数据字典等"))
                .ignoredParameterTypes(JwtClaim.class)
                .globalOperationParameters(commonTokenParams())
                .select()
                .paths(PathSelectors.ant("/sys/**"))
                .build();
    }

    @Bean
    public Docket createSysRestApi3() {
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("3. 通用接口")
                .apiInfo(createApiInfo("通用接口", "文件上传等"))
                .ignoredParameterTypes(JwtClaim.class)
                .select()
                .paths(PathSelectors.ant("/file/**"))
                .build();
    }


    // 更多模块 api 扩展

    /**
     * 创建统一的 ApiInfo 信息
     *
     * @param title
     * @param description
     * @return
     */
    private ApiInfo createApiInfo(String title, String description) {
        String DEFAULT_CONTACTNAME = "qinyou";
        String DEFAULT_CONTACTURL = "https://github.com/qinyou";
        String DEFAULT_CONTACTEMAIL = "916432779@qq.com";
        ApiInfo apiInfo = new ApiInfoBuilder()
                .title(title)
                .description(description)
                //.version("v1")  通过 context path 判断 api 版本号
                .contact(new Contact(DEFAULT_CONTACTNAME, DEFAULT_CONTACTURL, DEFAULT_CONTACTEMAIL))
                .build();
        return apiInfo;
    }


    /**
     * 创建 token 公共参数
     *
     * @return
     */
    private List<Parameter> commonTokenParams() {
        ParameterBuilder parameterBuilder = new ParameterBuilder();
        parameterBuilder.name("Authorization").description("身份认证Token")
                .modelRef(new ModelRef("string"))
                .parameterType("header").required(true)
                .scalarExample(genTokenExample());
        List<Parameter> parameters = new ArrayList<>();
        parameters.add(parameterBuilder.build());
        return parameters;
    }

    /**
     * 生成token 例子 （自服务启动 100天后过期）
     *
     * @return
     */
    private String genTokenExample() {
        JwtUtil jwtUtil = new JwtUtil();
        jwtUtil.setSecret("123456");
        jwtUtil.setExpireIdle(2400);
        String token = jwtUtil.generate("admin");
        while (token.contains("_") || !jwtUtil.verify(token)) {
            token = jwtUtil.generate("admin");
        }
        return "Bearer " + token;
    }
}
