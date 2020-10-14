<%--
  Created by IntelliJ IDEA.
  User: jqjxx
  Date: 2020/6/10
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include/header.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="text-align: center;margin-bottom: 120px">欢迎来到南财点评！</h1>
<div class="container">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4">
            <form action="../shopRegister" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label >商铺名称</label>
                    <input class="form-control" id="shopName" placeholder="商铺名称" name="shopName">
                </div>
                <div class="form-group">
                    <label>密码</label>
                    <input class="form-group" id="shopPassword" placeholder="密码" name="shopName">
                </div>
                <div class="form-group">
                    <label>确认密码</label>
                    <input class="form-group" id="confirmShopPassword" placeholder="密码" name="confirmShopName">
                </div>
                <div class="form-group">
                    <label>种类</label>
                    <input type="radio"name="category"value="0">食堂&nbsp&nbsp
                    <input type="radio"name="category"value="1">超市&nbsp&nbsp
                    <input type="radio"name="category"value="2">水果店&nbsp&nbsp
                    <input type="radio"name="category"value="3">其他（如打印店理发店）&nbsp&nbsp
                </div>
                <div class="form-group">
                    <label>位置</label>
                    <input type="radio"name="location"value="0">中苑&nbsp&nbsp
                    <input type="radio"name="location"value="1">西苑&nbsp&nbsp
                    <input type="radio"name="location"value="2">东苑&nbsp&nbsp
                    <input type="radio"name="location"value="3">北苑&nbsp&nbsp
                </div>
                <div class="form-group">
                    <label >详细地址</label>
                    <textarea  class="form-control" id="locationDetail" placeholder="如中苑二楼靠近充饭卡的地方" name="locationDetail"></textarea>
                </div>
                <div class="form-group">
                    <label >选择图片(只能上传一张)</label>
                    <input type="file" id="shopPicture" name="shopPicture">
                    <p class="help-block"></p>
                </div>
                <div class="form-group">
                    <label >电话</label>
                    <input class="form-control" id="phoneNumber" placeholder="电话" name="phoneNumber">
                </div>
                <button type="submit" class="btn btn-default"id="submit">上传</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
