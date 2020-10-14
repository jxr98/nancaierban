<%--
  Created by IntelliJ IDEA.
  User: jqjxx
  Date: 2020/5/25
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include/header.jsp"%>
<%@ page import="bean.Shop"%>
<%@ page import="dao.ShopDao"%>
<%@ page import="net.sf.json.JSONArray"%>
<%@ page import="java.io.PrintWriter"%>
<%--<%@ page import=""%>--%>
<%--<%@ page import=""%>--%>
<%
    ShopDao service=new ShopDao();
    Shop[] bean=service.getShopsByCategory("1",1);
    String jsonArray="[";
    int j;
    for(j=0;j<bean.length;j++){
        if(bean[j]==null)
            break;
    }
    for(int i=0;i<j;i++){
        jsonArray+= "{\"shopName\":\""+ bean[i].getShopName()
                + "\",\"location\":\"" + bean[i].getLocation()
                + "\",\"shopId\":\""+ bean[i].getShopId()
                +"\",\"picture\":\"" + bean[i].getPicture()
                + "\"}";
        if(i!=j-1){
            jsonArray+=",";
        }
    }
    jsonArray+="]";
    out.println(jsonArray);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="../test.do" id="form">
    <input type="submit"id="btn"value="登录"class="btn btn-default">
</form>
</body>
</html>
