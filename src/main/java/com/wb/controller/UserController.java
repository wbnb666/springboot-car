package com.wb.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.wb.domain.User;
import com.wb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public void login(String username, String password, String mold, String remember, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        QueryWrapper<User> wrapper = new QueryWrapper();
        wrapper.eq("username",username);
        wrapper.eq("password",password);
        wrapper.eq("type",Integer.parseInt(mold));
        User user = userService.getOne(wrapper);
        if(user!=null){
            if("1".equals(remember)){
                Cookie cookies_u = new Cookie("username",username);
                Cookie cookies_pwd = new Cookie("password",password);
                Cookie cookies_rem = new Cookie("remember","1");
                cookies_u.setMaxAge(60*60*24);//存一天
                cookies_pwd.setMaxAge(60*60*24);//存一天
                cookies_rem.setMaxAge(60*60*24);//存一天
                cookies_u.setPath("/");
                cookies_pwd.setPath("/");
                cookies_rem.setPath("/");
                response.addCookie(cookies_u);
                response.addCookie(cookies_pwd);
                response.addCookie(cookies_rem);
            }
            else {
                Cookie[] cookies = request.getCookies();
                if(cookies!=null){
                    for (Cookie cookie : cookies) {
                        String name = cookie.getName();
                        if("username".equals(name)||"password".equals(name) ||"remember".equals(name)){
                            cookie.setMaxAge(0);
                            cookie.setPath("/");
                            response.addCookie(cookie);
                        }
                    }
                }
            }
            request.getSession().setAttribute("user",user);
            response.sendRedirect("/pages/home.jsp");
            return;
        }else {
           request.setAttribute("login_msg","用户名或密码错误！");
           request.getRequestDispatcher("/pages/login.jsp").forward(request,response);
           return;
        }
    }


    @RequestMapping("/logout")
    public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.getSession().setAttribute("user",null);
        response.sendRedirect("/pages/login.jsp");
    }

    @RequestMapping("/register")
    public void register
            (String username,
             String password,
             String mold,
             String key,
             String verification,
             HttpServletRequest request,
             HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        String checkcode = (String) session.getAttribute("checkcode");

        if(!"88888888".equals(key)&&"1".equals(mold)){
            request.setAttribute("register_msg", "密钥错误");
            request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
            return;
        }
        if (!checkcode.equalsIgnoreCase(verification)){
            request.setAttribute("register_msg", "验证码错误");
            request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
            return;
        }

        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq(username != null, "username", username);
        User user = userService.getOne(wrapper);
        if (user != null) {
            request.setAttribute("register_msg", "用户名已存在");
            request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
            return;
        }
        userService.save(new User(username, password,Integer.parseInt(mold)));
        request.setAttribute("login_msg", "注册成功！请登录");
        request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
        return;
    }

    @RequestMapping("/getUsrInfo")
    public User getUsrInfo(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        return user;
    }

    @RequestMapping("/updateUserInfo")
    public void updateUserInfo(String name,String sex, String phone, String hobby,
                               HttpServletRequest request,HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        UpdateWrapper<User> wrapper = new UpdateWrapper<>();
        wrapper.eq("id",user.getId());
        if("1".equals(sex)){
            wrapper.set("sex","男");
            user.setSex("男");//改Session信息进行同步
        }else {
            wrapper.set("sex","女");
            user.setSex("女");//改Session信息进行同步
        }
        wrapper.set("name",name);
        wrapper.set("phone",phone);
        wrapper.set("hobby",hobby);
        userService.update(wrapper);

        //改Session信息进行同步
        user.setName(name);
        user.setPhone(phone);
        user.setHobby(hobby);
        request.getSession().setAttribute("user",user);
        Cookie cookie = new Cookie("update_msg","修改成功！");
        cookie.setPath("/");
        cookie.setMaxAge(2);
        response.addCookie(cookie);
        response.sendRedirect("/pages/personal.html");
    }

    @RequestMapping("/updatePwd")
    public String updatePwd(@RequestBody Map map, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");//获取当前User对象

        String prepassword = (String) map.get("prePass");
        String newpassword = (String) map.get("pass");
        String againtpassword = (String) map.get("checkPass");
        String verification = (String) map.get("checkCode");

        if(!user.getPassword().equals(prepassword)){
            System.out.println("修改密码时，原密码输入错误无法修改！");
            return "ErrorPrePass";
        }

        String checkcode = (String) request.getSession().getAttribute("checkcode");
        if (!checkcode.equalsIgnoreCase(verification)){
            System.out.println("修改密码时，验证码输入错误无法修改！");
            return "ErrorCheckCode";
        }


        UpdateWrapper<User> wrapper = new UpdateWrapper<>();
        wrapper.eq("id",user.getId());
        wrapper.set("password",newpassword);
        boolean update = userService.update(wrapper);
        return "success";

    }
}
