package com.wb.config;

import com.wb.controller.interceptor.loginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    private loginInterceptor loginInterceptor;


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor).addPathPatterns("/**")
                .excludePathPatterns(
                        "/check",
                        "/pages/home.jsp","/pages/search.html","/pages/cardetail.html",
                        "/user/login", "/user/register",
                        "/cars/getAll","/cars/getSearch","/cars/getOne",
                        "/favor/addFavor",
                        "/pages/login.jsp", "/pages/register.jsp",
                        "/js/**", "/img/**", "/css/**","/element-ui/**"
                );
    }
}
