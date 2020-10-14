<%--
  Created by IntelliJ IDEA.
  User: jqjxx
  Date: 2020/6/15
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
</head>
<body>
<h1 style="text-align: center;margin-bottom: 120px">欢迎来到南财点评！</h1>
<div class="container">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4" style="text-align:center">
            <form method="post" action="../managerLogin" id="form">
                <div style="margin:30px 30px;font-size:15px">管理员登录</div>
                <div class="form-group">
                    用户名：<input name="managerName" type="text" id="managerName" class="customerForm form-control" placeholder="用户名"/>
                </div>
                <br>
                <div class="form-group">
                    密码： <input type="text" name="managerPassword" id="managerPassword" class="customerForm form-control"placeholder="密码"/>
                </div>
                <br>
                <div class="form-group">
                    <input type="submit"id="btn"value="登录"class="btn btn-default">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
