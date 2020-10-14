<%--
  Created by IntelliJ IDEA.
  User: jqjxx
  Date: 2020/6/1
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int shopId=Integer.parseInt(request.getParameter("shopId"));
    String shopName=request.getParameter("shopName");
    int customerId=Integer.parseInt(request.getParameter("customerId"));
    session.setAttribute("shopId",shopId);
    session.setAttribute("customerId",customerId);
    session.setAttribute("shopName",shopName);
%>
<%@ include file="include/header.jsp"%>
<html>
<head>
    <title>写评价</title>
</head>
<body>
<div class="container-fluid">
    <h1 id="titletop" style="text-align: center">在为商铺<%= shopName%>写评价</h1>
</div>
<div class="container">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4">
            <form action="../addComment" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label >评分（五分制）</label>
                    <input class="form-control" id="score" placeholder="0.0-5.0" name="score">
                </div>
                <div class="form-group">
                    <label >评价（250字以内）</label>
                    <textarea  class="form-control" id="commentContent" placeholder="评价内容" name="commentContent"></textarea>
                </div>
                <div class="form-group">
                    <label >选择图片(只能上传一张)</label>
                    <input type="file" id="commentPicture" name="commentPicture">
                    <p class="help-block"></p>
                </div>
                <button type="submit" class="btn btn-default"id="submit">上传</button>
            </form>
         </div>
    </div>
</div>
</body>
</html>
