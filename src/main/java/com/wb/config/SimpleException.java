package com.wb.config;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import java.util.Properties;

//@Configuration
//public class SimpleException {
//
//    public SimpleMappingExceptionResolver simpleMappingExceptionResolver()throws NullPointerException{
//        SimpleMappingExceptionResolver resolver = new SimpleMappingExceptionResolver();
//        Properties mappings = new Properties();
//        mappings.setProperty("ArithmeticException","error");
//        mappings.setProperty("NullPointerException","error");
//        resolver.setExceptionMappings(mappings);
//        resolver.setDefaultErrorView("error");
//        return resolver;
//    }
//}
