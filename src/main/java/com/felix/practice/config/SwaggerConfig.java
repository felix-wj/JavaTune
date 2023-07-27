package com.felix.practice.config;

import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Contact;
import io.swagger.v3.oas.annotations.info.Info;

@Configuration
@OpenAPIDefinition(info = @Info(title = "Java调优练习 API", version = "v0.0.1", description = "练习Java调优的测试代码",contact = @Contact(name = "Felix")))
public class SwaggerConfig {


}
