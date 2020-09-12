<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: huge
  Date: 2020/5/20
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加舞蹈室</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="http://localhost:9090/favicon.ico"/>
    <style>
        body{
            background-image: url("http://r.photo.store.qq.com/psc?/V11MuXGR3g4CxP/gWShryPLAbNNMut8n7qrsOCdCFy1ETAohkKvRzhCfSWRfvDz7MXOWObR7wqh7JidrjQCQLvsMM44tHSCpCDuwsdH.7w5.SLqShNo8AAeaTc!/r");
            background-size: 100%;
            background-repeat: no-repeat;
        }
        .container {
            width: 700px;
            height: 650px;
            margin-top: 50px;
            background: rgba(255,255,240, 0.75);
            position: relative;                    /* 玻璃样式 */
            padding-left: 100px;
            padding-right: 100px;
            padding-top: 40px;
            border-bottom: 1px solid;
            border-bottom-color: #ccc;
            border-bottom-color: rgba(255, 255, 255, 0.2);
            background-color: rgba(255, 255, 255, 0.75);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }
        .modify-text:hover{
            background: gray;
            color: white;
        }
        .modify-text{
            color: black;
        }
        .button-background{
            background: rgba(255,255,240, 0.75);

        }
        .default-button {
            width: 60px; /* 宽度 */
            height: 30px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background:#FFFFF0; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline:white; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: #696969; /* 字体颜色 */
            font-size: 14px; /* 字体大小 */
        }
        .default-button:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #F0F8FF;
        }
        .add-button {
            width: 150px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }
        .add-button:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;
        }
        td
        {font-family:'华文细黑';font-size:15px;color:#626262;}
        .navbar-background:hover{
            background: gray;
            color: #ffffff;
        }
    </style>
    <script type="text/javascript">
        function rankSelect(){
            var houseType = $('.choose_rank option:selected').attr("value");
            var select = document.getElementById("rentPrices");
            if (houseType=="P"){
                for (var i=0;i<select.options.length;i++){

                    if (select.options[i].value==50){
                        select.options[i].selected=true;
                        break;
                    }
                }
            }
            else if(houseType=="M"){
                for (var i=0;i<select.options.length;i++){

                    if (select.options[i].value==100){
                        select.options[i].selected=true;
                        break;
                    }
                }
            }
            else {
                for (var i=0;i<select.options.length;i++){

                    if (select.options[i].value==200){
                        select.options[i].selected=true;
                        break;
                    }
                }
            }
            return true;
        }

        function rentSelect(){
            var rentPrice = $('.choose_rent option:selected').attr("value");
            var select = document.getElementById("houseTypes");
            if (rentPrice=="50"){
                for (var i=0;i<select.options.length;i++){

                    if (select.options[i].value=="P"){
                        select.options[i].selected=true;
                        break;
                    }
                }
            }
            else if(rentPrice=="100"){
                for (var i=0;i<select.options.length;i++){

                    if (select.options[i].value=="M"){
                        select.options[i].selected=true;
                        break;
                    }
                }
            }
            else {
                for (var i=0;i<select.options.length;i++){

                    if (select.options[i].value=="S"){
                        select.options[i].selected=true;
                        break;
                    }
                }
            }
            return true;
        }
        function myFunction() {
            document.getElementById("error").innerHTML="";
        }
        $(function () {
            $("#button").click(function () {
                if (document.house.houseId.value==""||document.house.houseId.value==null)
                {
                    window.alert("房屋号不能为空！");
                    return false;
                }
                else{
                    if (document.house.houseId.value.length>10||document.house.houseId.value.length<2){
                        window.alert("请输入正确的房屋号！");
                        return false;
                    }
                    else if (document.house.houseRemark.value.length>40){
                        window.alert("请勿输入过长的介绍内容！");
                        return false;
                    }
                    $("#house").submit();    //提交ID为adminform的表单
                }

            })
        })
    </script>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/main">X-Dance Studio</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse" style="margin-left: 100px;">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item navbar-background">
                <a class="nav-link" href="${pageContext.request.contextPath}/house/allHouseLimit?startIndex=1">
                    <svg class="bi bi-house-door" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"/>
                        <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                    </svg>&nbsp返回&nbsp&nbsp</a>
            </li>
        </ul>
        <form class="form-inline mt-2 mt-md-0">
            <a href="${pageContext.request.contextPath}/logout">
                <button class="btn btn-outline-success my-2 my-sm-0" type="button">Logout</button>
            </a>
        </form>
    </div>
</nav>
<div class="container">
    <div class="text-center mb-4">
        <h1 class="h1 font-weight-normal" style="font-family: 华文细黑"><small>ADD HOUSE</small></h1>
    </div>

    <form action="${pageContext.request.contextPath}/house/addHouse" method="post" id="house" name="house">
        <div class="form-group">
            <label>房屋号</label>
            <input type="text" class="form-control" name="houseId" placeholder="请输入房屋号" oninput="myFunction()" required>
        </div>
        <div class="form-group">
            <label>房屋类别</label>
            <select class="form-control choose_rank" name="houseType" id="houseTypes" required onchange="rankSelect()" >
                <option value="P" selected>公寓</option>
                <option value="M">别墅</option>
            </select>
        </div>
        <div class="form-group">
            <label>租金</label>
            <input class="form-control " name="rentPrice" id="rentPrices" required placeholder="请输入租金" >
        </div>
        <div class="form-group">
            <label>房屋状态</label>
            <select class="form-control choose_id" name="houseStatus">
                <option id="0" style="display: none;">--请选择当前空闲状态--</option>
                <option id="1" value="0" selected>空闲</option>
                <option id="2" value="1">已出租</option>
            </select>
        </div>
        <div class="form-group">
            <label>详细介绍</label>
            <input type="text" class="form-control" name="houseRemark" placeholder="请输入房屋详细信息">
        </div>
        <br>

        <center>
            <button id="button" type="submit" class="btn add-button">添加</button>
        </center>
        <center>
            <span id="error" style="color: darkred">${houseerror}</span>
        </center>
    </form>

</div>
</body>
</html>
