<%@ page import="com.wb.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" style="height: 100%">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>

    <meta charset="UTF-8">
    <title>首页</title>
</head>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    body{
        background-size: 100%;
    }

    .transition-box {
        boder:1px solid red;
        margin-bottom: 10px;
        width: 1200px;
        height: 480px;
        border-radius: 4px;
        background-color: white;
        padding: 40px 20px;
        box-sizing: border-box;
        margin-right: 20px;
        position: absolute;
        top:-641px;
        width: 1300px;
        margin-left: 70px;
        height: 600px;

    }

    .botton{
        /*background-color: #67c23a;*/
        border: 0px solid ;
        background-color: rgba(	220, 220, 220,0.0);
        border: #f0f9eb 0px solid;
        color: white;
        font-weight: bolder;
        font-size: 20px;
        position: absolute;
        top:-721px;
        left: 170px;
        width: 80px;
        height: 80px;
        border-bottom-width: 4px;
        border-bottom-color: rgba(	220, 220, 220,0.0) ;
        z-index: 3;
    }

    .botton:hover {
        border-bottom-width: 6px;
        border-bottom-color: #66b1ff ;
    }

    .search button{
        /*background-color: white;*/
        /*opacity: 0.1;*/
      background-color: rgba(255,255,255,0);

        border-left: 0px solid rgb(255,255,255);
        border-top: 0px solid rgb(255,255,255);
        border-right: 0px solid rgb(255,255,255);
        border-bottom: 0px solid rgb(255,255,255);

    }


    .search  i{
        /*background-color: white;*/
        /*opacity: 0.1;*/
        background-color: rgba(255,255,255,0);

    }

    .search button:hover {

        /*background-color: black;*/
        border-bottom-width: 7px;
        border-bottom-color: #66b1ff ;

    }




    .line{
        border: 0.5px rgba(255,255,255,0.1) solid;
        width: 1295px;
        background-color: white;
        position: absolute;
        top: -642px;
        left: 70px;
    }

    .bannerimg{
        width: 100%;
        height: 100%;
    }

    .introducetop{
        boder:0px black,solid;
        width: 100%;
        height: 280px;
        background-color: white;
        text-align: center;
        position: absolute;
        top: 790px;
        padding-top: 70px;
        overflow: hidden;
    }

    .introduceone{
        boder:0px black,solid;
        width: 97%;
        height: 390px;
        background-color: white;
        background-color: rgba(192,192,192,0.5);

        overflow: hidden;
        position: absolute;
        top: 1190px;
        left: 25px;
    }

    .introducetwo{
        boder:0px black,solid;
        width: 97%;
        height: 390px;
        background-color: white;
        background-color: rgba(192,192,192,0.5);

        overflow: hidden;
        position: absolute;
        top: 1640px;
        left: 25px;
    }
    #pictureone:hover{
        animation: move .5s linear forwards;
    }

    #picturetwo:hover {
        animation: move .5s linear forwards;
    }



    @keyframes move {
        0% {
            transform: scale(1);
        }

        100% {
            transform: scale(1.1);
        }
    }

    .favorites{
        border: 0px black solid;
        width: 97%;
        height: 520px;
        background-color: white;
        position: absolute;
        top: 2150px;
        left: 25px;
        overflow: hidden;
    }

    .tip{
        border: 0px black solid;
        width: 100%;
        height: 500px;
        background-color: gainsboro;
        position: absolute;
        top: 2750px;
        text-align: center;
        overflow: hidden;
    }

    .copyright{
        border: 0px black solid;
        width: 100%;
        height: 200px;
        background-color: black;
        position: absolute;
        top: 3200px;
        /*text-align: center;*/
        overflow: hidden;
    }
    .blue{

        border-bottom-width: 6px!important;

        border-bottom-color: #66b1ff !important;
    }

</style>

<body style="height: 100%">
<div id="homepage"  style="height: 100%;">


    <div style="height: 100%;">

        <div>
            <template style="width: 100%;position: absolute;z-index: 1">

                <el-carousel interval="3000"  height="752px" style="margin-left: 0px;width: 100%;width: 100%" ref="carousel" @click.native="linkto" :router="true">
                    <el-carousel-item v-for="(item,index) in imgwrap" v-bind:key="item.url" style="height: 100%;width: 100%">
                        <img :src="item.url" class="bannerimg" style="cursor: pointer;height: 100%" v-if="index==0" @click="searchById(16)" />
                        <img :src="item.url" class="bannerimg" style="cursor: pointer;height: 100%" v-if="index==1" @click="searchById(17)" />
                        <img :src="item.url" class="bannerimg" style="cursor: pointer;height: 100%" v-if="index==2" @click="searchById(23)" />
                        <img :src="item.url" class="bannerimg" style="cursor: pointer;height: 100%" v-if="index==3" @click="searchById(14)" />
                        <img :src="item.url" class="bannerimg" style="cursor: pointer;height: 100%" v-if="index==4" @click="searchById(25)" />
                        <img :src="item.url" class="bannerimg" style="cursor: pointer;height: 100%" v-if="index==5" @click="searchById(15)" />

                    </el-carousel-item>
                </el-carousel>
            </template>

                        <div style="z-index: 2 ;position: absolute">

                            <%--全部车型--%>
                            <template >
                                <div style="height: 100px">
                                    <button id="btn1" class="botton"  @click="showall" style="cursor: pointer;">全部车型</button>
                                    <div class="line"></div>
                                    <transition name="el-zoom-in-top">
                                        <div v-show="allcar"  class="transition-box" style="position: absolute;z-index: 2;">
                                            全部车型
                                            <el-pagination
                                                    @size-change="handleSizeChange"
                                                    @current-change="handleCurrentChange"
                                                    :current-page="currentPage"
                                                    :page-size="pageSize"
                                                    layout="total, prev, pager, next"
                                                    :total="totalCount">
                                            </el-pagination>


                                            <span v-for="onephoto in carurl">
<%--                                            <a href="/pages/cardetail.html?id="+{{onephoto.carid}}>--%>
                                                <img style="cursor: pointer;margin-top:70px;margin-left: 57px;width: 240px;height: 180px" :src="onephoto.overall" @click="searchById(onephoto.carid)">
<%--                                            </a>--%>
                                        </span>


                                            <br><br>

                                            <span style="font-family: 华文楷体;font-size: larger" v-for="(onecar,index) in tableData">
                                   <span v-if="index==0">
                                       <span style="position:  absolute;left: 70px">{{onecar.carname}}</span>
                                   </span>
                                                <span v-if="index==1">
                                       <span style="position:  absolute;left: 370px">{{onecar.carname}}</span>
                                   </span>

                                                                 <span v-if="index==2">
                                       <span style="position:  absolute;left: 670px">{{onecar.carname}}</span>
                                   </span>

                                                                          <span v-if="index==3">
                                       <span style="position:  absolute;left: 968px">{{onecar.carname}}</span>
                                   </span>

                                   </span>

                                            </span>

                                            <br><br>

                                            <span style="font-family: 华文楷体;font-size: large" v-for="(onecar,index) in tableData">
                                        <span v-if="index==0">
                                                <span style="position: absolute;left: 70px">售价{{onecar.price}}￥</span>
                                   </span>
                                                     <span v-if="index==1">
                                                <span style="position: absolute;left: 370px">售价{{onecar.price}}￥</span>
                                   </span>

                                                                        <span v-if="index==2">
                                                <span style="position: absolute;left: 670px">售价{{onecar.price}}￥</span>
                                   </span>
                                                                                            <span v-if="index==3">
                                                <span style="position: absolute;left: 968px">售价{{onecar.price}}￥</span>
                                   </span>
                                    </span>

                                        </div>


                                    </transition>
                                </div>
                            </template>

                            <%--跑车--%>
                            <template>
                                <div style="height: 100px">
                                    <button id="btn2" class="botton" style="cursor: pointer;left: 400px" @click="showsportscar" >跑车</button>
                                    <transition style="boder:1px solid red;position: fixed;height: 100px;" name="el-zoom-in-top">

                                        <div v-show="sportscar" class="transition-box" style="background-color: white;width: 1300px;margin-left: 70px;height: 600px">
                                            跑车
                                            <el-pagination
                                                    @size-change="handleSizeChange"
                                                    @current-change="handleCurrentChange"
                                                    :current-page="currentPage"
                                                    :page-size="pageSize"
                                                    layout="total, prev, pager, next"
                                                    :total="totalCount">
                                            </el-pagination>
                                            <span v-for="onephoto in carurl">
                                        <img style="cursor: pointer;margin-top:70px;margin-left: 57px;width: 240px;height: 180px" :src="onephoto.overall" @click="searchById(onephoto.carid)">
                                    </span>


                                            <br><br>

                                            <span style="font-family: 华文楷体;font-size: larger" v-for="(onecar,index) in tableData">
                                   <span v-if="index==0">
                                       <span style="position:  absolute;left: 70px">{{onecar.carname}}</span>
                                   </span>
                                                <span v-if="index==1">
                                       <span style="position:  absolute;left: 370px">{{onecar.carname}}</span>
                                   </span>

                                                                 <span v-if="index==2">
                                       <span style="position:  absolute;left: 670px">{{onecar.carname}}</span>
                                   </span>

                                                                          <span v-if="index==3">
                                       <span style="position:  absolute;left: 968px">{{onecar.carname}}</span>
                                   </span>

                                   </span>

                                            </span>

                                            <br><br>

                                            <span style="font-family: 华文楷体;font-size: large" v-for="(onecar,index) in tableData">
                                        <span v-if="index==0">
                                                <span style="position: absolute;left: 70px">售价{{onecar.price}}￥</span>
                                   </span>
                                                     <span v-if="index==1">
                                                <span style="position: absolute;left: 370px">售价{{onecar.price}}￥</span>
                                   </span>

                                                                        <span v-if="index==2">
                                                <span style="position: absolute;left: 670px">售价{{onecar.price}}￥</span>
                                   </span>
                                                                                            <span v-if="index==3">
                                                <span style="position: absolute;left: 968px">售价{{onecar.price}}￥</span>
                                   </span>
                                    </span>

                                        </div>

                                    </transition>
                                </div>
                            </template>

                            <%--suv--%>
                            <template>
                                <div style="height: 100px">
                                    <button id="btn3" class="botton" style="cursor: pointer;left: 520px" @click="showsuv" >SUV</button>
                                    <transition style="boder:1px solid red;position: fixed;height: 100px;" name="el-zoom-in-top">

                                        <div v-show="suv" class="transition-box" style="background-color: white;position: fixed;top:111px;width: 1300px;margin-left: 70px;height: 600px">
                                            SUV
                                            <el-pagination
                                                    @size-change="handleSizeChange"
                                                    @current-change="handleCurrentChange"
                                                    :current-page="currentPage"
                                                    :page-size="pageSize"
                                                    layout="total, prev, pager, next"
                                                    :total="totalCount">
                                            </el-pagination>
                                            <span v-for="onephoto in carurl">
                                       <img style="cursor: pointer;margin-top:70px;margin-left: 57px;width: 240px;height: 180px" :src="onephoto.overall" @click="searchById(onephoto.carid)">
                                    </span>
                                            <br><br>

                                            <span style="font-family: 华文楷体;font-size: larger" v-for="(onecar,index) in tableData">
                                   <span v-if="index==0">
                                       <span style="position:  absolute;left: 70px">{{onecar.carname}}</span>
                                   </span>
                                                <span v-if="index==1">
                                       <span style="position:  absolute;left: 370px">{{onecar.carname}}</span>
                                   </span>

                                                                 <span v-if="index==2">
                                       <span style="position:  absolute;left: 670px">{{onecar.carname}}</span>
                                   </span>

                                                                          <span v-if="index==3">
                                       <span style="position:  absolute;left: 968px">{{onecar.carname}}</span>
                                   </span>

                                   </span>

                                            </span>

                                            <br><br>

                                            <span style="font-family: 华文楷体;font-size: large" v-for="(onecar,index) in tableData">
                                        <span v-if="index==0">
                                                <span style="position: absolute;left: 70px">售价{{onecar.price}}￥</span>
                                   </span>
                                                     <span v-if="index==1">
                                                <span style="position: absolute;left: 370px">售价{{onecar.price}}￥</span>
                                   </span>

                                                                        <span v-if="index==2">
                                                <span style="position: absolute;left: 670px">售价{{onecar.price}}￥</span>
                                   </span>
                                                                                            <span v-if="index==3">
                                                <span style="position: absolute;left: 968px">售价{{onecar.price}}￥</span>
                                   </span>
                                    </span>
                                        </div>
                                    </transition>

                                </div>
                            </template>

                            <%--轿车--%>
                            <template>
                                <div style="height: 100px">
                                    <button id="btn4" class="botton"  style="cursor: pointer;left: 300px;" @click="showlimousine" >轿车</button>
                                    <transition name="el-zoom-in-top">
                                        <div v-show="limousine"   class="transition-box" >
                                            轿车
                                            <el-pagination
                                                    @size-change="handleSizeChange"
                                                    @current-change="handleCurrentChange"
                                                    :current-page="currentPage"
                                                    :page-size="pageSize"
                                                    layout="total, prev, pager, next"
                                                    :total="totalCount">
                                            </el-pagination>
                                            <span v-for="onephoto in carurl">
                                                <img style="cursor: pointer;margin-top:70px;margin-left: 57px;width: 240px;height: 180px" :src="onephoto.overall" @click="searchById(onephoto.carid)">
                                            </span>
                                            <br><br>

                                            <span style="font-family: 华文楷体;font-size: larger" v-for="(onecar,index) in tableData">
                                   <span v-if="index==0">
                                       <span style="position:  absolute;left: 70px">{{onecar.carname}}</span>
                                   </span>
                                                <span v-if="index==1">
                                       <span style="position:  absolute;left: 370px">{{onecar.carname}}</span>
                                   </span>

                                                                 <span v-if="index==2">
                                       <span style="position:  absolute;left: 670px">{{onecar.carname}}</span>
                                   </span>

                                                                          <span v-if="index==3">
                                       <span style="position:  absolute;left: 968px">{{onecar.carname}}</span>
                                   </span>

                                   </span>

                                            </span>

                                            <br><br>

                                            <span style="font-family: 华文楷体;font-size: large" v-for="(onecar,index) in tableData">
                                        <span v-if="index==0">
                                                <span style="position: absolute;left: 70px">售价{{onecar.price}}￥</span>
                                   </span>
                                                     <span v-if="index==1">
                                                <span style="position: absolute;left: 370px">售价{{onecar.price}}￥</span>
                                   </span>

                                                                        <span v-if="index==2">
                                                <span style="position: absolute;left: 670px">售价{{onecar.price}}￥</span>
                                   </span>
                                                                                            <span v-if="index==3">
                                                <span style="position: absolute;left: 968px">售价{{onecar.price}}￥</span>
                                   </span>
                                    </span>
                                        </div>
                                    </transition>
                                </div>
                            </template>

                            <%--搜索框--%>
                            <template>
                                <div style="height: 100px">

                                <div class="search">
                                    <el-button id="btn5" type="primary" icon="el-icon-search"
                                               style="background-color: rgba(255,255,255,0); position: absolute ;;left:900px;top:-710px;padding-bottom:22px;font-size: 25px;width: 70px;height: 70px;" @click="searchcar">
                                    </el-button>
                                </div>


                                    <transition name="el-zoom-in-top">
                                        <div v-show="search" style="" class="transition-box" >
                                            <%--<form action="/cars/getAll" method="post" style="text-align: center;padding-top: 220px">
                                                <input type="text" name="search" style="border: none;width: 670px;height: 50px; outline:none;"  placeholder="搜索" >
                                                <input type="submit" value="GET" style="background-color:rgba(220, 220, 220,0.0);border: none">
                                            </form>--%>
                                                <el-form style="text-align: center;padding-top: 220px" :inline="true" :model="formInline" class="demo-form-inline">
                                                    <el-form-item>
                                                        <el-input  style="width: 500px;" v-model="car.search" placeholder="关键词"></el-input>
                                                    </el-form-item>
                                                    <el-form-item>
                                                        <el-button type="info" @click="getSearchTo">查询</el-button>
                                                    </el-form-item>
                                                </el-form>
                                            <div style="border: 1px;width: 710px;height: 1px;background-color: black;margin-left: 275px"></div>
                                        </div>
                                    </transition>

                                </div>
                            </template>

                            <%--客户信息--%>
                            <template>
                                <div style="height: 100px">

                                   <a href="personal.html" style="text-decoration: none"> <el-button type="primary" icon="el-icon-user-solid"
                                               style="background-color:rgba(220, 220, 220,0.0);border: 0px; position: absolute ;left:1000px;top:-705px;font-size: 25px;">
                                    </el-button></a>
                                </div>
                            </template>


                            <template>
                                <div style="height: 100px">

                                <a href="carshow.html" style="text-decoration: none">    <el-button type="primary" icon="el-icon-s-goods"
                                               style="background-color:rgba(220, 220, 220,0.0);border: 0px; position: absolute ;left:1100px;top:-705px;font-size: 25px;" @click="faviorites">
                                    </el-button></a>

                                </div>
                            </template>

<%--                            登录/退出--%>
                            <template>


                                <div style="height: 100px">
                                    <%
                                        User user = (User) request.getSession().getAttribute("user");
                                        if(user==null){
                                    %>
                                    <a href="login.jsp" style="background-color:rgba(220, 220, 220,0.0);
                               border: 0px;
                               width: 50px;
                               position: absolute ;
                               left:1208px;
                               top:-695px;
                               text-decoration: none;
                               font-size:20px ;
                               color: white" >登录</a>
                                    <%
                                        }else {
                                    %>
                                    <a href="/user/logout" style="background-color:rgba(220, 220, 220,0.0);
                               border: 0px;
                               width: 50px;
                               position: absolute ;
                               left:1208px;
                               top:-695px;
                               text-decoration: none;
                               font-size:20px ;
                               color: white" >退出</a>
                                    <%
                                        }
                                    %>
                                </div>
                            </template>
                          </div>


        </div>


    </div>


    <div class="introducetop">
       <span style="font-weight: bolder;font-size: 18px"> 人马一体·创享驾趣<br>
        EFFORTLESS JOYFUL DRIVING<br></span>
        酣畅淋漓的驾乘乐趣,源于是一见倾心的悸动,源于日久生情的安心,源于人车之间,如同骑手与爱马般的神悟默契·心有灵犀…<br><br>
        无论是,从0开始,全面革新造车核心技术的 SKYACTIV TECHNOLOGY创驰蓝天技术,<br><br>
        亦或是,一瞥惊鸿,充溢生命美学,令人不禁迸发驾驭激情的KODO DESIGN魂动设计,<br><br>
        我们,始终坚持如一,在追求人马一体·创享驾趣的路上,策马扬鞭,创新进取

    </div>

    <div class="introduceone">

        <img id="pictureone" src="../img/18temp.png" style="height: 100%;width: 691PX; cursor: pointer;" @click="searchById(18)">
        <span style="font-weight: bolder;font-size: 18px;position: absolute;left: 950px;top: 50px"> 静止到冲刺，足够放肆<br>
        EFFORTLESS JOYFUL DRIVING<br></span>
        <span style="position:absolute;left: 750px;top:120px">
        驾趣游刃有余，动力持续突破，这就是BMW 1系运动轿车玩转街头的秘籍<br><br>
        新一代B系列涡轮增压发动机，提供至高280牛米的动力输出，配合高效环保的能耗表现，<br><br>
        带来澎湃驾趣。配备电子换挡杆的7速双离合变速箱令换挡快速精确，更小的体积和重量显著降低车辆油耗<br><br>
        </span>
        <botton style="cursor: pointer;border: 1px solid black;position: absolute;width: 120px;height: 28px;top:300px;left:750px;text-align: center;background-color: white;padding-top: 5px;font-weight: inherit" @click="searchById('18')">了解更多</botton>

    </div>

    <div class="introducetwo">

        <span style="font-weight: bolder;font-size: 18px;position: absolute;left: 170px;top: 50px">
            建模的匠艺<br>
        Craftsmanship in modeling<br>
        </span>
        <span style="position:absolute;left: 30px;top:150px">
        用「设计」的力量，为汽车注入鲜活的生命。<br><br>
        汽车,不应仅是冰冷的金属模块,更应是富有「生命美学」的鲜活存在。<br><br>
            </span>
        <botton style="cursor: pointer;border: 1px solid black;position: absolute;width: 120px;height: 28px;top:300px;left:30px;text-align: center;background-color: white;padding-top: 5px;font-weight: inherit" @click="searchById('11')">了解更多</botton>
        <img  @click="searchById('11')" id="picturetwo" src="https://n.sinaimg.cn/sinakd20200502ac/782/w1024h558/20200502/f0de-isyparh2596141.png" style="cursor: pointer;position:absolute;height: 100%;width: 772PX;left: 700px">
    </div>

    <div class="favorites">
        <span style="position: absolute;font-size: 70px;left: 60px">Favorites Top 3</span>
        <img src="../img/25temp.png" height="90%" width="420px" style="cursor: pointer;position: absolute;top:130px;left: 60px" @click="searchById(25)">
        <img src="../img/27front.png" height="90%" width="420px" style="cursor: pointer;position: absolute;top:130px;left: 530px" @click="searchById(27)">
       <img src="../img/26fronttemp.png" height="90%" width="420px" style="cursor: pointer;position: absolute;top:130px;left: 1000px" @click="searchById(26)">

    </div>

    <div class="tip">
        <span style="font-size: 30px;font-weight: bolder;position: absolute; top: 150px;left: 610px">Fuel consumption </span><br>
        <img style="position: absolute;left: 650px;top:200px" src="https://www.bugatti.com/fileadmin/_processed_/sei/p1/se-image-7826e24a7bbf7ceaee70a9b11eaa9b53.webp">
    </div>

    <div class="copyright">
        <span style="position: absolute ;top: 20px;left:600px;color: grey;font-size: 20px">Car Purchase Recommendation</span>
        <font color="grey" style="position: absolute;left:500px;top:80px"> 版权所有Copyright 2022-2022&copy;, All Rights Reserved XXXXXXXXXX</font>
        <el-button icon="el-icon-phone" style="background-color:rgba(220, 220, 220,0.0);border: 0px; position: absolute ;left:480px;top:120px;font-size: 14px;"><br>CONTACT</el-button>
        <el-button icon="el-icon-chat-dot-round" style="background-color:rgba(220, 220, 220,0.0);border: 0px; position: absolute ;left:620px;top:120px;font-size: 14px;"><br>CONTACT</el-button>
        <el-button icon="el-icon-s-promotion" style="background-color:rgba(220, 220, 220,0.0);border: 0px; position: absolute ;left:760px;top:120px;font-size: 14px;"><br>CONTACT</el-button>
        <el-button icon="el-icon-location-information" style="background-color:rgba(220, 220, 220,0.0);border: 0px; position: absolute ;left:900px;top:120px;font-size: 15px;"><br>Position</el-button>

    </div>

</div>

</body>
<script src="../js/axios-0.18.0.js"></script>
<script src="../js/vue.js"></script>
<script src="../element-ui/lib/index.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.1/jquery.js"></script>
<link rel="stylesheet" href="../element-ui/lib/theme-chalk/index.css">


<script>

    let v = new Vue({
        el: "#homepage",
        data() {

            return {


                totalCount:0,
                //分页查询中：总页数
                pageSize:4,
                //分页查询中：当前分页页数
                currentPage: 1,

                car:{
                    models:'',
                    search:'',//包含车名 or 描述 or 车型
                    current:this.currentPage,
                    size:this.pageSize
                },
                tableData: [
                    {
                        id:"",
                        carname:"",
                        models:"",
                        description:"",
                        price:""
                    }
                ],
                carurl:[],

                allcar: false,
                currentPage4: 4,
                limousine:false,
                suv:false,
                sportscar:false,
                search:false,
                person:false,

                imgwrap:[
                    {url:"../img/16.png"},
                    {url:"../img/17.png"},
                    {url:"https://wallpapercave.com/wp/wp5034199.jpg"},
                    {url:"../img/14.png"},
                    {url:"../img/25reartemp.png"},
                    {url:"../img/15.png"}
                ]
            }
        },
        methods: {
            getSearchTo() {
                location.href='/pages/search.html?search='+encodeURI(this.car.search)
            },

            selectAll() {
                this.car.current=this.currentPage;
                this.car.size=this.pageSize;
                axios.post("/cars/getAll",this.car).then((resp)=> {
                    //设置表格数据
                    if(resp.data.flag==true){
                        let arr = resp.data.data;
                        console.log(resp.data);
                        this.tableData = arr[0].data.records;
                        this.currentPage = arr[0].data.current;
                        this.pageSize = arr[0].data.size;
                        this.totalCount = arr[0].data.total;
                        this.carurl = arr[1].data;

                    }else {
                        this.$message({
                            message: resp.data.msg,
                            type: 'info'
                        });
                    }
                })
            },
            //每页显示的条数
            handleSizeChange(val) {
                this.pageSize = val;
                this.selectAll();
            },
            //当前的页码
            handleCurrentChange(val) {
                this.currentPage = val;
                this.selectAll();
            },

            showlimousine() {
                this.currentPage = 1;
                this.pageSize = 4;
                this.car.models = '轿车';
                this.selectAll();
                this.limousine = !this.limousine;
                this.allcar = false;
                this.sportscar = false;
                this.suv = false;
                this.search = false;
                this.person = false;


      // border-bottom-width=7px;
                // border-bottom-color: #66b1ff ;
            },
            showsuv(){
                this.currentPage=1;
                this.pageSize=4;
                this.car.models='SUV'
                this.selectAll();
                this.limousine=false;
                this.allcar=false;
                this.sportscar=false;
                this.suv=!this.suv;
                this.search=false;
                this.person=false;

            },
            showsportscar(){
                this.currentPage=1;
                this.pageSize=4;
                this.car.models='跑车'
                this.selectAll();
                this.limousine=false;
                this.suv=false;
                this.allcar=false;
                this.sportscar=!this.sportscar;
                this.search=false;
                this.person=false;

            },
            showall(){
                this.currentPage=1;
                this.pageSize=4;
                this.car.models='';
                this.selectAll();
                this.limousine=false;
                this.suv=false;
                this.sportscar=false;
                this.allcar=!this.allcar;
                this.search=false;
                this.person=false;
            },
            searchcar(){
                this.search=!this.search;
                this.limousine=false;
                this.suv=false;
                this.sportscar=false;
                this.allcar=false;
                this.person=false;

            },
            searchById(id){
                console.log(id)
                location.href="/pages/cardetail.html?id="+id;
            }

        }
    })

    // var button=   document.getElementById("btn1");
    // var flag1=false;

   //
   // var f=(button.onclick=function (){
   //      if(flag1==false){
   //      button.style.borderBottomWidth=7+'px';
   //      button.style.borderBottomColor= '#66b1ff' ;
   //      flag1=true;
   //      }else {
   //          button.style.borderBottomWidth=0+'px';
   //          flag1=true;
   //      }
   //  })




    $("#btn1").click(function(){

        if($(this).hasClass("blue")){

            $(this).removeClass("blue");

        }else{
            $("#btn2").removeClass("blue");
            $("#btn3").removeClass("blue");
            $("#btn4").removeClass("blue");
            $("#btn5").removeClass("blue");
            $(this).addClass("blue");
        }

    });

    $("#btn2").click(function(){

        if($(this).hasClass("blue")){

            $(this).removeClass("blue");

        }else{
            $("#btn1").removeClass("blue");
            $("#btn3").removeClass("blue");
            $("#btn4").removeClass("blue");
            $("#btn5").removeClass("blue");
            $(this).addClass("blue");
        }
    });

    $("#btn3").click(function(){

        if($(this).hasClass("blue")){

            $(this).removeClass("blue");

        }else{
            $("#btn1").removeClass("blue");
            $("#btn2").removeClass("blue");
            $("#btn4").removeClass("blue");
            $("#btn5").removeClass("blue");
            $(this).addClass("blue");
        }
    });

    $("#btn4").click(function(){

        if($(this).hasClass("blue")){

            $(this).removeClass("blue");

        }else{
            $("#btn1").removeClass("blue");
            $("#btn2").removeClass("blue");
            $("#btn3").removeClass("blue");
            $("#btn5").removeClass("blue");
            $(this).addClass("blue");
        }
    });

    $("#btn5").click(function(){

        if($(this).hasClass("blue")){

            $(this).removeClass("blue");

        }else{
            $("#btn1").removeClass("blue");
            $("#btn2").removeClass("blue");
            $("#btn3").removeClass("blue");
            $("#btn4").removeClass("blue");
            $(this).addClass("blue");
        }
    });

</script>


</html>


