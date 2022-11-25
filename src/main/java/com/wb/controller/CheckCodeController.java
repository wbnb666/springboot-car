package com.wb.controller;


import com.wb.util.CheckCodeUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

@RestController
public class CheckCodeController {

    @RequestMapping("/check")
    public void checkcode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        ServletOutputStream os = response.getOutputStream();

        String checkcode = CheckCodeUtil.outputVerifyImage(100, 50, os, 4);//创建照片

        session.setAttribute("checkcode",checkcode);

    }
}
