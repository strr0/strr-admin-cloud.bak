package com.strr.config;

import feign.RequestInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * OpenFeign配置
 */
@Configuration
public class OpenFeignConfig {
    /**
     * token拦截器
     */
    @Bean
    public RequestInterceptor oauth2AccessTokenInterceptor() {
        return new CustomOAuth2AccessTokenInterceptor();
    }
}
