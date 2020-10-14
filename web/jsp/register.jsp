<%--
  Created by IntelliJ IDEA.
  User: jqjxx
  Date: 2020/5/1
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Register</title>
</head>
<body>
<h1>欢迎来到南财点评！</h1>
<form method="post" action="../register.do" id="form">用户注册<br>
    用户名：<input name="customerName" type="text" id="customerName" class="customerForm"/>
    <br>
    密码： <input type="text" name="customerPassword" id="customerPassword" class="customerForm"/>
    <br>
    确认密码：<input type="text" id="confirmCustomerPassword" class="customerForm"/>
    <br>
    性别：<input type="radio"name="gender"value="female">女&nbsp&nbsp
    <input type="radio" name="gender" value="male">男
    <br>
    手机号：<input type="text" name="phoneNumber" id="phoneNumber"class="customerForm"/>
    <br>
    <input type="submit"id="submit"value="注册">
</form>
<%--<script>--%>
<%--    $(function() {--%>
<%--        $("#submit").on('blur', $(function () {--%>
<%--                var one = $("#customerPassword").val();--%>
<%--                alert(one);--%>
<%--                var two = $("#confirmCustomerPassword").val();--%>
<%--                $("#form").submit(function () {--%>
<%--                    if (one != two) {--%>
<%--                        alert("两次密码输入不一致");--%>
<%--                        return false;--%>

<%--                    }--%>
<%--                    return true;--%>
<%--                });--%>
<%--            })--%>
<%--        )--%>
<%--    });--%>
<%--</script>--%>
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
</body>
</html>
