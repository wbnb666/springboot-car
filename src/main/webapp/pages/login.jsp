<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" style="height: 100%">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
</head>
<style>
  a{
    text-decoration: none;
  }
  body{
    margin: 0px;
    padding: 0px;
  }
  .top{
    border: black 0px solid ;
    width: 100%;
    height: 6%;
    background-color: black;

  }

  .login_msg{
    border: white 0px solid;
    border-radius: 5px;
    background-color: rgba(75, 81, 95, 0.5);
    width: 30%;
    height: 65%;
    position: absolute;
    top: 100px;
    left: 950px;
    box-shadow: 7px 7px 17px rgba(52, 56, 66, 0.5);
  }
  #username{
    width: 200px;
    margin-left: 15px;
    border-radius: 5px;
    border-style: hidden;
    height: 25px;
    background-color: rgba(112, 128, 144, 0.7);
    padding-left: 10px;
  }
  #password{
    width: 200px;
    margin-left: 23px;
    border-radius: 5px;
    border-style: hidden;
    height: 25px;
    background-color: rgba(112, 128, 144, 0.7);
    padding-left: 10px;
  }

  #remember{
    margin-left: 15px;
    border-radius: 5px;
    border-style: hidden;
    background-color: rgba(112, 128, 144, 0.7);
    padding-left: 10px;
    height: 20px;
    width: 20px;
  }

  .policy{
    margin-left: 0px;
    border-radius: 5px;
    border-style: hidden;
    background-color: rgba(112, 128, 144, 0.7);
    padding-left: 10px;
    height: 20px;
    width: 20px;
  }
  .button{
    border-color: cornsilk;
    background-color: rgba(112, 128, 144, 0.4);
    color: aliceblue;
    width: 100px;
    height: 31px;
    font-size: 16px;
    border-radius: 5px;
  }
  #submit{
    text-align: center;
    margin-top: 30px;
  }
  .copyright{
    border: black 0px solid ;
    width: 100%;
    height: 7%;
    background-color: black;
    text-align: center;
    /*padding-bottom: -28px;*/
  }
</style>
<body style="height: 100%;background-color: black">
<div id="car" style="height: 100%;width: 100%">
  <div class="top">
    <a href="home.jsp" style="text-decoration: none;color: white">
<span style="font-weight: bolder;color:  white;font-size: 25px;margin-left: 100px">
    Car purchase recommendation

</span></a>
  </div>

  <div style="height: 94%">
    <img src="../img/login.png" style="width: 100%;height: 89%">
    <div class="login_msg">
      <h1 style="text-align: center;color: #d3dce6">LOGIN IN</h1>
      <div id="passwordtip" style="color: red;font-size: 17px;text-align: center;display: none">密码还没填噢!</div>
      <div id="policytip" style="color: red;font-size: 17px;text-align: center;display: none">还未确认该平台政策！</div>
      <div id="moldtip" style="color: red;font-size: 17px;text-align: center;display: none">您是客户还是管理员呢？</div>

      <div style="color: red;text-align: center;font-size: 17px" id="loginmsg">${login_msg}</div>
      <form id="form" method="post" action="/user/login">
        <p style="padding-left: 60px;color: #d3dce6;font-size: 20px">Username:<input type="text" id="username" name="username" ></p>
        <p style="padding-left: 60px;color: #d3dce6;font-size: 20px">Password:<input type="password" id="password" name="password" ></p>
        <p style="padding-left: 60px;color: #d3dce6;font-size: 20px">Remember:<input type="checkbox" id="remember" name="remember" value="1"></p>
        <p style="padding-left: 60px;color: #d3dce6;font-size: 20px">
          <lable for="customer">Customer</lable>
          <input type="radio" id="customer" name="mold" value="0" checked>&nbsp&nbsp&nbsp&nbsp
          <lable for="administrator">Administrator</lable>
          <input type="radio" id="administrator" name="mold" value="1">
        </p>
        <div id="submit">

          <p style="color: #d3dce6;padding-left: 60px"> <input type="checkbox" value="1" class="policy" id="policy">
            同意该购车推荐<a href="" style="color:#f0f9eb">
              《用户协议》</a>  <a href="" style="color:#f0f9eb">
              《隐私政策》</a><a href="" style="color:#f0f9eb">
              《该平台协议及隐私政策》</a>
          </p>
          <input type="submit" value="Login in" class="button">
          <input type="reset" value="Reset" class="button" id="reset"><br>
          <p> <a href="http://localhost/pages/register.jsp" style="color:white;">没有账号?</a></p>
        </div>
      </form>
    </div>
    <div style="background-color: white">
    <span style="padding-left: 630px;font-size: 13px; color: #aaaaaa ;">客服电话:xxx-xxx-xxx 工作时间:9:30-18:30</span><br>

  </div>
    <div class="copyright">
      <span style="font-size: 13px;color: #aaaaaa">广药股份有限公司</span><br>
      <span style="font-size: 13px;color: #aaaaaa">版权所有Copyright 2022-2022&copy;, All Rights Reserved XXXXXXXXXX</span>
    </div>
  </div>
</div>
</body>

<script src="../js/vue.js"></script>
<script src="../element-ui/lib/index.js"></script>
<link rel="stylesheet" href="../element-ui/lib/theme-chalk/index.css">
<script src="../js/axios-0.18.0.js"></script>

<script>
  var cookies = document.cookie.split(';');
  function getCookie(mkey) {
    for (var i = 0; i < cookies.length; i++) {
      var kv = cookies[i].split('=');
      if (kv[0].trim() === mkey) {
        return kv[1].trim();
      }
    }
    return '';
  }

  //获取cookie回显
  window.onload = function () {
    var username = getCookie("username");
    var password = getCookie("password");
    var remember = getCookie("remember");
    if (remember === '1') {
      document.getElementById("username").value=username;
      document.getElementById("password").value=password;
      document.getElementById("remember").checked=true;
      form.render();//重新渲染才能显示出来

    }
  }

  new Vue({
    el:"#car",
    data(){
      return{
        activeIndex: '1',
        activeIndex2: '1'
      }
    },
    methods:{
      handleSelect(key, keyPath) {
        console.log(key, keyPath);
      }
    }
  })

  var username=document.getElementById("username");
  username.onblur=function () {
    document.getElementById("passwordtip").style.display="none";
    document.getElementById("policytip").style.display="none";
    document.getElementById("moldtip").style.display="none";
  }

  var password=document.getElementById("password");
  password.onblur=function (){
    document.getElementById("passwordtip").style.display="none";
    document.getElementById("policytip").style.display="none";
    document.getElementById("moldtip").style.display="none";
  }

  var customer=document.getElementById("customer");
  customer.onclick=function (){
    document.getElementById("moldtip").style.display="none";
  }
  var administrator=document.getElementById("administrator");
  administrator.onclick=function (){
    document.getElementById("moldtip").style.display="none";
  }

  var policy=document.getElementById("policy");
  policy.onclick=function (){
    document.getElementById("policytip").style.display="none";
  }

  document.getElementById("reset").onclick=function () {
    document.getElementById("passwordtip").style.display="none";
    document.getElementById("policytip").style.display="none";
    document.getElementById("moldtip").style.display="none";
    document.getElementById("loginmsg").style.display="none";
  }

  var form=document.getElementById("form");
  form.onsubmit=function () {
    if(document.getElementById("username").value.trim().length==0)
      return false;
    if(document.getElementById("password").value.trim().length==0){
       document.getElementById("passwordtip").style.display="";
       return  false;
    }

    if(document.getElementById("policy").checked==false){
      document.getElementById("policytip").style.display="";
      return false
    }
    if(document.getElementById("customer").checked==false&&document.getElementById("administrator").checked==false){
      document.getElementById("moldtip").style.display="";
      return false;
    }
    return true;
  }
</script>
</html>