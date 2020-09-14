
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加房主</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="http://localhost:9090/favicon.ico"/>
    <style>
        body{
            background-image: url(http://cdn.hommk.com/pcgame/ubi2015/img/game/main/steep_sc_6_in.jpg);
            background-size: 100%;
            background-repeat: no-repeat;
        }
        .container {
            width: 550px;
            height: 600px;
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
    <script>
        var regNumber = new RegExp("^[0-9]*$"); //正则表达式：纯数字
        var regNumber2 = new RegExp("^(0\\.(?!0+$)\\d{1,4}|^[1-9][0-9]{0,4}(\\.\\d{0,1})?)$"); //
        var maxBalance=100000;
        var minBalance=0;
        function myFunction() {
            document.getElementById("error").innerHTML="";
        }
        $(function () {
            $("#button").click(function () {
                if (document.hirePersonform.userName.value==""||document.hirePersonform.userName.value==null)
                {
                    window.alert("房主姓名不能为空！");
                    return false;
                }
                else if (document.hirePersonform.phone.value==""||document.hirePersonform.phone.value==null)
                {
                    window.alert("房主手机号不能为空！");
                    return false;
                }
                else{
                    if (document.hirePersonform.userName.value.length>20||document.hirePersonform.userName.value.length<3){
                        window.alert("请输入3-20个字符的房主姓名！");
                        return false;
                    }
                    else if (document.hirePersonform.phone.value.length!==11||!regNumber.test(document.hirePersonform.phone.value)){
                        window.alert("请输入11位手机号！");
                        return false;
                    }

                    $("#hirePersonform").submit();
                }
            })
        })
    </script>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/house/allHouseLimit?startIndex=1">Rent System</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse" style="margin-left: 100px;">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item navbar-background">
                <a class="nav-link" href="${pageContext.request.contextPath}/hirePerson/allHirePersonLimit?startIndex=1">
                    <svg class="bi bi-house-door" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"/>
                        <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                    </svg>&nbsp返回&nbsp&nbsp</a>
            </li>
        </ul>
        <form class="form-inline mt-2 mt-md-0">
            <a href="${pageContext.request.contextPath}/login/logout">
                <button class="btn btn-outline-success my-2 my-sm-0" type="button">Logout</button>
            </a>
        </form>
    </div>
</nav>
<div class="container">
    <div class="text-center mb-4">
        <h1 class="h1 font-weight-normal" style="font-family: 华文细黑"><small>ADD hirePerson</small></h1>
    </div>
    <form action="${pageContext.request.contextPath}/hirePerson/addHirePerson" method="post" name="hirePersonform" id="hirePersonform">
        <div class="form-group">
            <label>房主姓名</label>
            <input type="text" class="form-control" name="userName" placeholder="请输入房主姓名" oninput="myFunction()" required>
        </div>
        <div class="form-group">
            <label>房主手机号</label>
            <input type="text" class="form-control" name="phone" placeholder="请输入11位手机号" oninput="myFunction()" required>
        </div>
        <div class="form-group">
            <label>房主性别</label>
                <select class="form-control choose_id" name="sex">
                    <option id="0" style="display: none;">--请选择当前空闲状态--</option>
                    <option id="1" value="male" selected>男</option>
                    <option id="2" value="female">女</option>
                </select>
        </div>
        <div class="form-group">
            <label>email</label>
            <input type="text" class="form-control" name="hirePersonBalance" placeholder="请输入邮箱地址" oninput="myFunction()" >
        </div>
        <br/>
        <center>
            <button id="button" type="submit" class="btn add-button" onclick="addHirePerson()">添加</button>
        </center>
        <center>
            <span id="error" style="color: darkred">${hirePersonerror}</span>
        </center>
    </form>

</div>
</body>
</html>
