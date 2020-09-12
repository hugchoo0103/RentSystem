<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="http://localhost:9090/favicon.ico"/>

    <style>
        body{
            background-image: url("http://r.photo.store.qq.com/psc?/V11MuXGR3g4CxP/gWShryPLAbNNMut8n7qrsOCdCFy1ETAohkKvRzhCfSWRfvDz7MXOWObR7wqh7JidrjQCQLvsMM44tHSCpCDuwsdH.7w5.SLqShNo8AAeaTc!/r");
            background-size: 100%;
            background-repeat: no-repeat;
        }
        .container {
            width:100%;
            height:auto;
            margin-top: 20px;
            background: rgba(255,255,240, 0.75);
            position: relative;                    /* 玻璃样式 */
            padding-left: 70px;
            padding-right: 70px;
            padding-top: 50px;
            padding-bottom: 50px;
            border-bottom: 1px solid;
            border-bottom-color: #ccc;
            border-bottom-color: rgba(255, 255, 255, 0.2);
            background-color: rgba(255, 255, 255, 0.75);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }
        .navbar-background:hover{
            background: gray;
            color: #ffffff;
        }
        .center-in-center {
            position: absolute;
            top: 50%;
            left: 50%;
        }
        .login-button {
            width: 70px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 14px; /* 字体大小 */
            font-family: 华文细黑;
        }
        .login-button:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
    <a class="navbar-brand" href="#">Rent System</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse" style="margin-left: 100px;">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link navbar-background" href="#">&nbsp&nbsp 主页 &nbsp&nbsp</a>
            </li>
        </ul>
        <form class="form-inline mt-2 mt-md-0" >
            <a href="${pageContext.request.contextPath}/admin/gologin">
                <button class="login-button" type="button">LOGIN</button>
            </a>
        </form>
    </div>
</nav>
<div class="container">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="text-align:center;">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
        </ol>
        <div class="carousel-inner" >
            <div class="carousel-item active">
                <img src="../webapp/image/steep_desktop.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item active">
                <img src="../webapp/image/steep_sc_6_in.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item active">
                <img src="../webapp/image/steep_desktop.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item active">
                <img src="../webapp/image/steep_sc_6_in.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item active">
                <img src="../webapp/image/steep_desktop.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item active">
                <img src="../webapp/image/steep_sc_6_in.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>


</body>
</html>
