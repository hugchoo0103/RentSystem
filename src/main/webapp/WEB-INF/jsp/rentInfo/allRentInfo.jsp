<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: huge
  Date: 2020/9/11
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有租赁信息</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="http://localhost:9090/favicon.ico"/>
    <style>
        body{
            background-image: url("../webapp/image/steep_desktop.jpg");
            background-size: 100%;
            background-repeat: no-repeat;
        }
        .container {
            width: 100%;
            height: auto;
            padding-bottom: 30px;
            margin-top: 0px;
            background: rgba(255,255,240, 0.8);
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
            width: 80px; /* 宽度 */
            height: 30px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 14px; /* 字体大小 */
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
        date_time();
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

        function page() {
            $("#pageform").submit();    //提交ID为pageform的表单
        }
        function hasPrePage() {
            if(!${pageinfo.hasPreviousPage}){
                var newUrl = '${pageContext.request.contextPath}/rentInfo/allRentInfoLimit?startIndex=1';    //设置新提交地址
                $("#prepage").attr('href', newUrl);    //通过jquery为href属性赋值
            }
        }
        function hasNextPage() {
            if(!${pageinfo.hasNextPage}){
                var newUrl = '${pageContext.request.contextPath}/rentInfo/allRentInfoLimit?startIndex=${pageinfo.pages}';    //设置新提交地址
                $("#nextpage").attr('href', newUrl);    //通过jquery为href属性赋值
            }
        }
    </script>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">

    <a class="navbar-brand" href="#">Rent System</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse" style="margin-left: 100px;">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item navbar-background">

                <a class="nav-link" href="${pageContext.request.contextPath}/admin/main">&nbsp&nbsp
                    <svg class="bi bi-house-door" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"/>
                        <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                    </svg>
                    Home &nbsp&nbsp</a>
            </li>
            <li class="nav-item navbar-background active">
                <a class="nav-link" href="${pageContext.request.contextPath}/rentPerson/allRentPersonLimit?startIndex=1">&nbsp&nbsp租客&nbsp&nbsp</a>
            </li>
            <li class="nav-item navbar-background">
                <a class="nav-link" href="${pageContext.request.contextPath}/rentInfo/allRentInfoLimit?startIndex=1">&nbsp&nbsp租赁信息&nbsp&nbsp</a>
            </li>
            <li class="nav-item navbar-background">
                <a class="nav-link" href="${pageContext.request.contextPath}/?startIndex=1">&nbsp&nbsp管理员&nbsp&nbsp</a>
            </li>
            <li class="nav-item navbar-background">
                <a class="nav-link" href="${pageContext.request.contextPath}/hirePerson/allHirePersonLimit?startIndex=1">&nbsp&nbsp房主&nbsp&nbsp</a>
            </li>
            <li class="nav-item navbar-background">
                <a class="nav-link" href="${pageContext.request.contextPath}/house/allHouseLimit?startIndex=1">&nbsp&nbsp房屋&nbsp&nbsp</a>
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
    <div class="row clearfix" style="text-align: center;">
        <div class="col-md-12 column">
            <div class="page-header" >
                <br>
                <h1 style="font-family: Candara">
                    RentInfo
                </h1>
                <br>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 column">
            <form name="riform" id="riform" class="form-inline" action="${pageContext.request.contextPath}/rentInfo/getRentInfoById"
                  method="post" style="float: left;margin-left: 10px;">
                <input id="intype" type="text" name="rentInfoId" class="form-control mr-sm-2" type="search" value=""
                       placeholder="请输入租赁编号"
                       aria-label="Search">
                <button id="cancel" class="default-button" type="reset">清空</button>
                &nbsp;&nbsp;
                <button id="button" class="default-button" type="submit">搜索</button>
                &nbsp;&nbsp;
                <span style="color: darkred;margin-left: 20px;">${error}</span>
                <span style="color: darkred;margin-left: 20px;">${deleteRentInfoError}</span>
            </form>
        </div>

        <div class="col-md-2 column" style="float: right;">
            <a class="btn add-button" href="${pageContext.request.contextPath}/rentInfo/toAddRentInfo">
                + 添加</a>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>租赁编号</th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th>操作</th>
                </tr>
                </thead>
                <%-- 租赁信息从数据库中查询处理，在这个list中便利: foreach --%>
                <tbody>
                <c:forEach var="rentInfo" items="${rentInfoList}">
                    <tr>
                        <td>${rentInfo.rentInfoId}</td>
                        <td>${rentInfo}</td>
                        <td>${rentInfo}</td>
                        <td>${rentInfo}</td>
                        <td>${rentInfo}</td>
                        <td>
                            <svg class="bi bi-pencil-square" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                            </svg>
                            <a href="${pageContext.request.contextPath}/rentInfo/toUpdateRentInfo/${rentInfo.rentInfoId}" class="modify-text">修改</a>
                            &nbsp;| &nbsp;
                            <svg class="bi bi-trash" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                <path fill-rule="evenodd"
                                      d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                            </svg>
                            <a href="${pageContext.request.contextPath}/rentInfo/deleteRentInfo/${rentInfo.rentInfoId}"
                               onclick="return confirm('确定删除吗?')" class="modify-text">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>

    <div style="margin-top:25px;">
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <form name="pageform" id="pageform" action="${pageContext.request.contextPath}/rentInfo/allRentInfoLimit" method="post">
                    <%-- 前端传递隐藏域 --%>
                    <input type="hidden" id="start_index" name="startIndex">
                    <input type="hidden" id="page_size" name="pageSize">
                </form>
                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/rentInfo/allRentInfoLimit?startIndex=1" aria-label="Previous">&laquo;</a></li>
                <li class="page-item">
                    <a class="page-link" id="prepage" href="${pageContext.request.contextPath}/rentInfo/allRentInfoLimit?startIndex=${pageinfo.pageNum-1}" aria-label="Previous" onclick="hasPrePage()">
                        <span aria-hidden="true">&lt;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <c:forEach var="num"
                           begin="${(pageinfo.pageNum-5>0?(pageinfo.pageNum-5):1)}"
                           end="${(pageinfo.pageNum+5<=pageinfo.pages)?(pageinfo.pageNum+5):pageinfo.pages}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/rentInfo/allRentInfoLimit?startIndex=${num}">
                            <c:choose>
                                <c:when test="${num==pageinfo.pageNum}">
                                    <span style="color: cadetblue">${num}</span>
                                </c:when>
                                <c:otherwise>${num}</c:otherwise>
                            </c:choose>

                        </a>
                    </li>
                </c:forEach>
                <li class="page-item">
                    <a class="page-link" id="nextpage" href="${pageContext.request.contextPath}/rentInfo/allRentInfoLimit?startIndex=${pageinfo.pageNum+1}" aria-label="Next" onclick="hasNextPage()">
                        <span aria-hidden="true">&gt;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/rentInfo/allRentInfoLimit?startIndex=${pageinfo.pages}" aria-label="Previous">&raquo;</a></li>
            </ul>
        </nav>
    </div>
</div>



<script type="text/javascript" language="javascript">
    function deleteconfirm() {
        if (confirm('确定删除吗?')) {
            return true;
        }
        return false;
    }
</script>
</body>
</html>
