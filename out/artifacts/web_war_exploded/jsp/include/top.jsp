<%--
  Created by IntelliJ IDEA.
  User: jqjxx
  Date: 2020/5/15
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--这是一开始的头导航栏--%>
<nav class="nav navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a href="index.jsp" class="navbar-brand">首页</a>
            <a href="jsp/login.jsp">您好，请登录</a>
            <a href="jsp/register.jsp">注册</a>
            <button type="button"class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar">x</span>
                <span class="icon-bar">y</span>
                <span class="icon-bar">z</span>
            </button>
        </div>
    </div>
</nav>

<%--这是个toggle--%>
<div class="navbar-header">
    <a class="navbar-brand"href="index.jsp">首页</a>
    <button type="button"class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
</div>
<div class="navbar-collapse collapse">
    <ul class="nav navbar-nav">
        <li class="active"><a href="index.jsp">home</a></li>
        <li><a href="index.jsp">Link</a></li>
        <li><a href="index.jsp">Link</a></li>
    </ul>
</div>
</body>
</html>
