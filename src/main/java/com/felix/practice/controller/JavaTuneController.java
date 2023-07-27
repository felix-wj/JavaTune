package com.felix.practice.controller;

import org.springframework.web.bind.annotation.RequestMapping;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "Java调优练习接口模块")
@RequestMapping
public class JavaTuneController {
    private volatile boolean flag = false;
    @Operation(summary = "堆栈信息", description = "创造一个死循环，kill -3 打印堆栈信息")
    public void stackInfo() {
        flag = !flag;
        while(flag){
            System.out.println("hello world");
        }
    }
    
}
