<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: huge
  Date: 2020/9/11
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加租赁信息</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcdn.net/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
          rel="stylesheet">
    <link href="https://cdn.bootcdn.net/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css"
          rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/moment.js/2.25.3/moment.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/moment.js/2.25.3/locale/zh-hk.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/moment-timezone/0.5.31/moment-timezone-with-data.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/tempusdominus-bootstrap-4/5.1.2/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/moment-timezone/0.5.31/moment-timezone.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/microshop-settlement-server/resources/datetimepicker-master/jquery.datetimepicker.css" />
    <script src="/microshop-settlement-server/resources/datetimepicker-master/jquery.js"></script>
    <script src="/microshop-settlement-server/resources/datetimepicker-master/build/jquery.datetimepicker.full.min.js"></script>
    <style>
        body {
            background-image: url("https://www.ubisoft.com.cn/images/gamezone/steep/SKI_SNOW_FREERIDE.jpg");
            background-size: 100%;
            background-repeat: no-repeat;
        }

        .container {
            width: 550px;
            height: 600px;
            margin-top: 50px;
            background: rgba(255, 255, 240, 0.75);
            position: relative; /* 玻璃样式 */
            padding-left: 100px;
            padding-right: 100px;
            padding-top: 40px;
            border-bottom: 1px solid;
            border-bottom-color: #ccc;
            border-bottom-color: rgba(255, 255, 255, 0.2);
            background-color: rgba(255, 255, 255, 0.75);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        .modify-text:hover {
            background: gray;
            color: white;
        }

        .modify-text {
            color: black;
        }

        .button-background {
            background: rgba(255, 255, 240, 0.75);

        }

        .default-button {
            width: 60px; /* 宽度 */
            height: 30px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #FFFFF0; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: white; /* 不显示轮廓线 */
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

        td {
            font-family: '华文细黑';
            font-size: 15px;
            color: #626262;
        }

        .navbar-background:hover {
            background: gray;
            color: #ffffff;
        }
    </style>
    <script>
        var regNumber = new RegExp("^[0-9]*$"); //正则表达式：纯数字
        var regNumber2 = new RegExp("^(0\\.(?!0+$)\\d{1,4}|^[1-9][0-9]{0,4}(\\.\\d{0,1})?)$");
        date_time();
        function judgeTime(startTime,endTime){
            return new Date(endTime).getTime()-new Date(startTime).getTime();
        }
        function myFunction() {
            document.getElementById("error").innerHTML = "";
        }

        $(function () {
            $("#button").click(function () {
                if (document.riform.rentId.value == "" || document.riform.rentId.value == null) {
                    window.alert("租客不能为空！");
                    return false;
                } else if (document.riform.hireId.value == "" || document.riform.hireId.value == null) {
                    window.alert("房东不能为空！");
                    return false;
                } else if (document.riform.houseId.value == "" || document.riform.houseId.value == null) {
                    window.alert("房号不能为空！");
                    return false;
                } else if (document.riform.rentStartDate.value==""||document.riform.rentStartDate.value==null||document.riform.rentEndDate.value==""||document.riform.rentEndDate.value==null) {
                    window.alert("时间不能为空！");
                    return false;
                }  else {
                    if (document.riform.rentId.value.length > 11 || document.riform.rentId.value.length < 6) {
                        window.alert("请输入6-11个数字的租客编号！");
                        return false;
                    }else if (document.riform.hireId.value.length > 11 || document.riform.hireId.value.length < 6) {
                        window.alert("请输入6-11个数字的房东编号！");
                        return false;
                    }else if (document.riform.houseId.value.length > 11 || document.riform.houseId.value.length < 6) {
                        window.alert("请输入6-11个数字的房屋编号！");
                        return false;
                    }else{
                        var startTime=$("[name='rentStartDate']").val();
                        var endTime=$("[name='rentEndDate']").val();
                        if (judgeTime(startTime,endTime)<0){
                            window.alert("结束时间不能早于起始时间！");
                        }
                    }
                    $("#riform").submit();
                }
            })
        })

        setInterval("date_time()", 1000);
        function date_time() {
            var date = new Date();
            var year = date.getFullYear();
            var month = date.getMonth()+1;
            var day = date.getDate();
            var hour = date.getHours();
            var minutes = date.getMinutes();
            var seconds = date.getSeconds();
            if(parseInt(seconds) >= 0 && parseInt(seconds) < 10) {
                seconds = "0"+seconds;
            }
            $("#date_time").text(year+"/"+month+"/"+day+"   "+hour+":"+minutes+":"+seconds);
        }
        jQuery('#datetimepicker').datetimepicker({
            format:'Y-m-d H:i:s'      //这是设置日历格式
        });
    </script>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/main">Rent System</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse" style="margin-left: 100px;">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item navbar-background">
                <a class="nav-link"
                   href="${pageContext.request.contextPath}/rentInfo/allRentInfoLimit?startIndex=1">
                    <svg class="bi bi-house-door" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"/>
                        <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                    </svg>
                    &nbsp返回&nbsp&nbsp</a>
            </li>
        </ul>
        <form class="form-inline mt-2 mt-md-0">
            <a href="${pageContext.request.contextPath}/admin/logout">
                <button class="btn btn-outline-success my-2 my-sm-0" type="button">Logout</button>
            </a>
        </form>
    </div>
</nav>
<div class="container">
    <div class="text-center mb-4">
        <h1 class="h1 font-weight-normal" style="font-family: 华文细黑"><small>Modify RentInfo</small></h1>
    </div>

    <form action="${pageContext.request.contextPath}/rentInfo/addRentInfo" method="post" id="riform"
          name="riform">

        <div class="form-group">
            <label>租客</label>
            <input type="text" class="form-control" name="rentId" required>
        </div>
        <div class="form-group">
            <label>房东</label>
            <input type="text" class="form-control" name="hireId" required>
        </div>
        <div class="form-group">
            <label>租房编号</label>
            <input type="text" class="form-control" name="houseId" required>
        </div>
        <div class="form-group">
            <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
                <input type="text" placeholder="起始时间" name="rentStartDate" class="form-control datetimepicker-input" data-target="#datetimepicker1"/>
                <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar">
                        <svg class="bi bi-list-task" width="1em" height="1em" viewBox="0 0 16 16"
                             fill="currentColor"
                             xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5H2zM3 3H2v1h1V3z"/>
                            <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9z"/>
                            <path fill-rule="evenodd"
                                  d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5V7zM2 7h1v1H2V7zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5H2zm1 .5H2v1h1v-1z"/>
                        </svg>
                    </i></div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
                <input type="text" placeholder="结束时间" name="rentEndDate" class="form-control datetimepicker-input" data-target="#datetimepicker2"/>
                <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar">
                        <svg class="bi bi-list-task" width="1em" height="1em" viewBox="0 0 16 16"
                             fill="currentColor"
                             xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5H2zM3 3H2v1h1V3z"/>
                            <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9z"/>
                            <path fill-rule="evenodd"
                                  d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5V7zM2 7h1v1H2V7zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5H2zm1 .5H2v1h1v-1z"/>
                        </svg>
                    </i></div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>备注</label>
            <input type="text" class="form-control" name="remark" required>
        </div>
        <br>
        <center>
            <button id="button" type="submit" class="btn add-button">添加</button>
        </center>
    </form>

    <script type="text/javascript" language="javascript">
        moment.tz.serDefault('Asia/Shanghai');
        $('#datetimepicker1').data('DateTimePicker').timeZone('Asia/Shanghai');
        $('#datetimepicker1').datetimepicker({sideBySide: true});
        $('#datetimepicker1').data('DateTimePicker').format('YYYY-MM-DD');
        $('#datetimepicker1').data('DateTimePicker').date(moment());
    </script>
</div>
</body>
</html>
