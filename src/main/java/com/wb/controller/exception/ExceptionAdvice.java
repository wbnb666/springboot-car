package com.wb.controller.exception;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

@RestControllerAdvice
public class ExceptionAdvice {
    @ExceptionHandler(Exception.class)
    public ModelAndView doException(Exception e){
        e.printStackTrace();
        ModelAndView view = new ModelAndView();
        view.addObject("msg","对不起，服务器繁忙，请稍后再试。。。");

        view.setViewName("forward:/error.jsp");

        return view;
    }
}
