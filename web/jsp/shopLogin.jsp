<%--
  Created by IntelliJ IDEA.
  User: jqjxx
  Date: 2020/6/10
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="text-align: center;margin-bottom: 120px">欢迎来到南财点评！</h1>
<div class="container">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4" style="text-align:center">
            <form method="post" action="../shopLogin" id="form">
                <div style="margin:30px 30px;font-size:15px">商家登录</div>
                <div class="form-group">
                    商家名称：<input name="shopName" type="text" id="shopName" class="shopForm form-control" placeholder="商家名称"/>
                </div>
                <br>
                <div class="form-group">
                    密码： <input type="text" name="shopPassword" id="shopPassword" class="shopForm form-control"placeholder="密码"/>
                </div>
                <br>
                <div class="form-group">
                    <input type="submit"id="btn"value="登录"class="btn btn-default">
                </div>
            </form>
        </div>
    </div>
    <div class="col-lg-4 col-lg-offset-4" style="text-align:center">
        <a href="shopRegister.jsp"class="btn btn-primary" role="button">没有账号？点击注册</a>
    </div>
</div>
</body>
</html>
