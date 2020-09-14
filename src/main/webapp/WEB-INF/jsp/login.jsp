<%--
  Created by IntelliJ IDEA.
  User: ljy
  Date: 2020/9/12
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link href="/css/navbar-top.css" rel="stylesheet">
    <link rel="shortcut icon" href="http://localhost:9090/favicon.ico"/>
    <link rel="stylesheet" href="../../css/floating-labels.css">
    <style type="text/css">
        body{
            background-image: url(http://cdn.hommk.com/pcgame/ubi2015/img/game/main/steep_sc_6_in.jpg);
            background-size: 100%;
            background-repeat: no-repeat;
        }
        .container {
            width: 600px;
            height: 600px;
            margin-top: 100px;
            background: rgba(255,255,240, 0.75);
            position: relative;                    /* 玻璃样式 */
            padding-left: 120px;
            padding-right: 120px;
            padding-top: 70px;
            border-bottom: 1px solid;
            border-bottom-color: #ccc;
            border-bottom-color: rgba(255, 255, 255, 0.2);
            background-color: rgba(255, 255, 255, 0.75);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }
        h1 {
            font-family: Dubai;
        }
        .center-in-center {
            position: absolute;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            -moz-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            -o-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }
        .login-button {
            width: 270px; /* 宽度 */
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
        .login-button:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;
        }
        .back-button {
            width: 270px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background:#FFFFF0; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline:white; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: #696969; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }
        .back-button:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #F0F8FF;
        }
    </style>
    <script type="text/javascript">
        var regNumber = new RegExp("^[0-9]*$"); //正则表达式：纯数字
        function myFunction() {
            document.getElementById("error").innerHTML="";
        }
        $(function () {
            $("#button").click(function () {
                if (document.loginform.loginId.value==""||document.loginform.loginId.value==null)
                {
                    window.alert("管理员账户不能为空！");
                    return false;
                }
                else if (document.loginform.password.value==""||document.loginform.password.value==null)
                {
                    window.alert("密码不能为空！");
                    return false;
                }
                else{
                    if (document.loginform.loginId.value.length!=7||!regNumber.test(document.loginform.loginId.value.length)){
                        window.alert("请输入7位数字的管理员账户！");
                        return false;
                    }
                    else if (document.loginform.password.value.length>16||document.loginform.password.value.length<6){
                        window.alert("请输入6~16位密码！");
                        return false;
                    }
                    $("#loginform").submit();
                }

            })
        })
    </script>
</head>
<body>
<div class="container">
    <form class="form-signin" action="${pageContext.request.contextPath}/login/login" method="post" id="loginform" name="loginform">
        <div class="text-center mb-4">
            <h1 class="h1 mb-3 font-weight-normal">房屋租赁管理系统</h1>
            <br>
        </div>
        <div class="form-label-group">
            <label for="inputID">Admin ID</label>
            <input type="text" id="inputID" name="loginId" class="form-control" placeholder="请输入管理员账户" oninput="myFunction()" required autofocus>
        </div>
        <br/>
        <div class="form-label-group">
            <label for="inputPassword">Password</label>
            <input type="password" id="inputPassword" name="password" class="form-control" placeholder="请输入账户密码" oninput="myFunction()" required>
        </div>
        <br />
        <center>
            <span id="error" style="color: gray;">${error}</span>
        </center>
        <br />
        <center>
            <button id="button" class="login-button" type="submit">Sign in</button>
            <%--            <button onclick="window.location.href='${pageContext.request.contextPath}/index.jsp'" class="back-button" type="button" style="margin-top:20px;"  id="returnIndex" >Back</button>--%>
        </center>
        <p class="mt-5 mb-3 text-muted text-center">&copy;房屋租赁管理系统</p>
    </form>
</div>
</body>
</html>

