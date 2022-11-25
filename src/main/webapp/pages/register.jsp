<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2022/10/7
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" style="height: 100%">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    body{
        background: url("../img/regist.png") center center no-repeat;
        background-size: cover;
        /*background-attachment: fixed;*/
    }
    .register_msg{
        border: white 0px solid;
        border-radius: 5px;
        background-color: rgba(75, 81, 95, 0.5);
        width: 35%;
        height: 72%;
        position: absolute;
        top: 100px;
        left: 850px;
        box-shadow: 7px 7px 17px rgba(52, 56, 66, 0.5);
    }

    #username{
        width: 200px;
        margin-left: 18px;
        border-radius: 5px;
        border-style: hidden;
        height: 25px;
        background-color: rgba(112, 128, 144, 0.7);
        padding-left: 10px;
    }
    #password{
        width: 200px;
        margin-left: 27px;
        border-radius: 5px;
        border-style: hidden;
        height: 25px;
        background-color: rgba(112, 128, 144, 0.7);
        padding-left: 10px;
    }
    #keyinput{
        width: 200px;
        margin-left: 27px;
        border-radius: 5px;
        border-style: hidden;
        height: 25px;
        background-color: rgba(112, 128, 144, 0.7);
        padding-left: 10px;
    }
    #verification{
        /*border: red 1px solid;*/
        width: 80px;
        margin-left: 10px;
        border-radius: 5px;
        border-style: hidden;
        height: 25px;
        background-color: rgba(112, 128, 144, 0.7);
        padding-left: 10px;
    }
    #submit{
        text-align: center;
        margin-top: 0px;
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
</style>
<body style="height: 100% ;width: 100%" >
<div id="car">
    <div class="register_msg">
        <h1 style="margin-top: 10px;text-align: center;color: #d3dce6">REGISTER</h1><br>
        <div style="color: red;text-align: center;font-size: 17px ;">${register_msg}</div><br>
<%--        <div id="moldtip" style="color: red;font-size: 17px;text-align: center;display: none">您是客户还是管理员呢？</div>--%>
        <FORM id="form" action="/user/register" method="post">
            <div style="color: red;margin-left: 190px;font-size: 13px;display: none" id="usernametip">用户名为字母开头加6-12位数</div>
            <p style="padding-left: 60px;color: #d3dce6;font-size: 20px">Username:<input type="text" id="username" name="username" value="${register_username}"></p>
            <div style="color: red;text-align: center;font-size: 13px;display: none" id="usernameerror">用户名格式有误</div>
            <br><div style="color: red;margin-left: 190px;font-size: 13px;display: none" id="passwordtip">密码为6-12为位数</div>
            <p style="height: 40px;padding-left: 60px;color: #d3dce6;font-size: 20px">
                Password:</font><input type="password" id="password" name="password" value="${register_password}">
            </p>
            <div style="color: red;text-align: center;font-size: 13px;display: none" id="passworderror">密码格式有误</div><br>

            <div style="padding-left: 60px;color: #d3dce6;font-size: 20px">
                <span style="position:absolute;top: 240px;">
                    Verification: <input type="text" id="verification" name="verification">
                </span>

                <img id="codeImg" style="margin-top:0px;margin-left: 239px;padding-top: 20px" src="/check">
                <a href="#" style="color: #8cc5ff;font-size: 3px" id="nolook">看不清</a>
            </div>

            <br><br>

            <p style="padding-left: 60px;color: #d3dce6;font-size: 20px">
                <lable for="customer">Customer&nbsp</lable>
                <input type="radio" checked id="customer" name="mold" onclick="hideinput()" value="0">&nbsp&nbsp&nbsp&nbsp
                <lable for="administrator">Administrator&nbsp</lable>
                <input type="radio" id="administrator" name="mold" onclick="openinput()" value="1">
            </p>

            <div style="top: 370px;position: absolute;;margin-left: 100px;display: none" id="keyword">
              <span style="font-size: 20px;color: #d3dce6">Key:</span><input type="text" id="keyinput" name="key">
            </div>
            <div id="submit" style="padding-top: 100px">
                <input type="submit" value="Register" class="button">
                <input type="reset" value="Reset" class="button" id="reset"><br>
              <br>  <p> <a href="http://localhost/pages/login.jsp" style="color:white;">已有账号?</a></p>
            </div>
        </FORM>
    </div>

</div>
</body>
<script src="../js/vue.js"></script>
<script src="../element-ui/lib/index.js"></script>
<link rel="stylesheet" href="../element-ui/lib/theme-chalk/index.css">
<script src="../js/axios-0.18.0.js"></script>
<script>
    new Vue({
        el:"#car",
    })
    // 验证码更换
    document.getElementById("codeImg").onclick=function () {

        document.getElementById("codeImg").src = "/check?"+new Date().getMilliseconds();
    }
    document.getElementById("nolook").onclick=function () {

        document.getElementById("codeImg").src = "/check?"+new Date().getMilliseconds();
    }

    var username=document.getElementById("username")
    username.onfocus=function (){
        document.getElementById("passwordtip").style.display="none";
        document.getElementById("passworderror").style.display="none";
        // document.getElementById("usernametip").style.display="none";
        document.getElementById("usernameerror").style.display="none";
        // document.getElementById("moldtip").style.display="none";
        // document.getElementById("registermsg").style.display="none";

        document.getElementById("usernametip").style.display="";
    }

 function usernametest(){
     var reg=/^[A-Za-z]{1}\w{6,12}$/;
     if(document.getElementById("username").value.length!=0){
         var flag=reg.test(document.getElementById("username").value.trim());
         if(!flag){
             document.getElementById("usernameerror").style.display="";
             return false;
         }
         return true;
     }
     return  false;
 }

    function passwordtest(){
        var reg=/^\w{6,12}$/;
        if(document.getElementById("password").value.length!=0){
            var flag=reg.test(document.getElementById("password").value.trim());
            if(!flag){
                document.getElementById("passworderror").style.display="";
                return false;
            }
            return true;
        }
        return  false;
    }

 username.onblur=function (){
     document.getElementById("usernametip").style.display="none";
     usernametest();
 }



 var password=document.getElementById("password");
    password.onfocus=function (){
        document.getElementById("passwordtip").style.display="none";
        document.getElementById("passworderror").style.display="none";
        document.getElementById("usernametip").style.display="none";
        document.getElementById("usernameerror").style.display="none";
        // document.getElementById("moldtip").style.display="none";
        // document.getElementById("registermsg").style.display="none";

        document.getElementById("passwordtip").style.display="";
    }

    password.onblur=function (){
        document.getElementById("passwordtip").style.display="none";
        passwordtest();
    }

    document.getElementById("reset").onclick=function (){
        document.getElementById("passwordtip").style.display="none";
        document.getElementById("passworderror").style.display="none";
        document.getElementById("usernametip").style.display="none";
        document.getElementById("usernameerror").style.display="none";
        document.getElementById("moldtip").style.display="none";
        document.getElementById("registermsg").style.display="none";
        document.getElementById("username").value="";
        document.getElementById("password").value="";
    }

    // document.getElementById("customer").onclick=function (){
    //     document.getElementById("moldtip").style.display="none";
    // }

 function openinput(){
     console.log("nihao");
        document.getElementById("keyword").style.display="";
    }
function hideinput(){
    console.log("bb");
    document.getElementById("keyword").style.display="none";
}
       // document.getElementsById("administrator").onclick=function () {
       //    console.log("nihao");
       //     document.getElementsById("keyword").style.display = "";
       // }

    document.getElementById("form").onsubmit=function (){
        if(passwordtest()==false||usernametest()==false){
            return false;
        }
        if(document.getElementById("customer").checked==false&&document.getElementById("administrator").checked==false){
            document.getElementById("moldtip").style.display="";
            return false;
        }
        return true;
    }
    
</script>
</html>