<%--
  Created by IntelliJ IDEA.
  User: jqjxx
  Date: 2020/5/24
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include/header.jsp"%>
<%
    Integer customerId=(Integer) session.getAttribute("customerId");
    if(customerId==null){
        response.sendRedirect("login.jsp");
    }
%>
<script>
    window.onload=function () {
            $("#previous").hide();
            var value=$("#cafeteria").val();
            document.getElementById('pageCounter').innerText="1";
            var category;
            $.ajax({
                url:"../shopsClassification",
                data:{
                    category:value,
                    start:1
                },
                type:"post",
                success:function showShops(data) {
                    $(".col-md-6").children("div").children("div").children(".name").text("");
                    $(".col-md-6").children("div").children("div").children("img").attr("src","");
                    category=value;
                    var $ge=$("#first");
                    for(var i=0;i<10;i++){
                        if(i<data.length) {
                            $ge.fadeIn(1);
                            $ge.children("div").children("div").children(".link").children("a").attr("href","shopDetails.jsp?shopId=" + data[i].shopId);
                            $ge.children("div").children("div").children(".name").append("<span>" + data[i].shopName + "</span>");
                            $ge.children("div").children("div").children("img").attr("src",data[i].picture);
                        }
                        if(i>=data.length){
                            $ge.fadeOut(1);
                        }
                        $ge=$ge.next();
                    }
                    if(data.length<11){
                        $("#next").hide();
                    }
                    if(data.length==11){
                        $("#next").fadeIn(1);
                    }
                },
                dataType:"json"
            });
        $("#cafeteria").on('click',function () {
            var value=$("#cafeteria").val();
            $("#previous").hide();
            document.getElementById('pageCounter').innerText="1";
            $.ajax({
                url:"../shopsClassification",
                data:{
                    category:value,
                    start:1
                },
                type:"post",
                success:function showShops(data) {
                    $(".col-md-6").children("div").children("div").children(".name").text("");
                    $(".col-md-6").children("div").children("div").children("img").attr("src","");
                    category=value;
                    var $ge=$("#first");
                    for(var i=0;i<10;i++){
                        if(i<data.length) {
                            $ge.fadeIn(1);
                            $ge.children("div").children("div").children(".link").children("a").attr("href","shopDetails.jsp?shopId=" + data[i].shopId);
                            $ge.children("div").children("div").children(".name").append("<span>" + data[i].shopName + "</span>");
                            $ge.children("div").children("div").children("img").attr("src",data[i].picture);}
                        if(i>=data.length){
                            $ge.fadeOut(1);
                        }
                       $ge=$ge.next();
                    }
                    if(data.length<11){
                        $("#next").hide();
                    }
                    if(data.length==11){
                        $("#next").fadeIn(1);
                    }
                },
                dataType:"json"
            });
        });
        $("#supermarket").on('click',function () {
            var value=$("#supermarket").val();
            $("#previous").hide();
            document.getElementById('pageCounter').innerText="1";
            $.ajax({
                url:"../shopsClassification",
                data:{
                    category:value,
                    start:1
                },
                type:"post",
                success:function showShops(data) {
                    $(".col-md-6").children("div").children("div").children(".name").text("");
                    $(".col-md-6").children("div").children("div").children("img").attr("src","");
                    category=value;
                    var $ge=$("#first");
                    for(var i=0;i<10;i++){
                        if(i<data.length) {
                            $ge.fadeIn(1);
                            $ge.children("div").children("div").children(".link").children("a").attr("href","shopDetails.jsp?shopId=" + data[i].shopId);
                            $ge.children("div").children("div").children(".name").append("<span>" + data[i].shopName + "</span>");
                            $ge.children("div").children("div").children("img").attr("src",data[i].picture);}
                        if(i>=data.length){
                            $ge.fadeOut(1);
                        }
                        $ge=$ge.next();
                    }
                    if(data.length<11){
                        $("#next").hide();
                    }
                    if(data.length==11){
                        $("#next").fadeIn(1);
                    }
                },
                dataType:"json"
            });
        });
        $("#fruitshops").on('click',function () {
            var value=$("#fruitshops").val();
            $("#previous").hide();
            document.getElementById('pageCounter').innerText="1";
            $.ajax({
                url:"../shopsClassification",
                data:{
                    category:value,
                    start:1
                },
                type:"post",
                success:function showShops(data) {
                    $(".col-md-6").children("div").children("div").children(".name").text("");
                    $(".col-md-6").children("div").children("div").children("img").attr("src","");
                    category=value;
                    var $ge=$("#first");
                    for(var i=0;i<10;i++){
                        if(i<data.length) {
                            $ge.fadeIn(1);
                            $ge.children("div").children("div").children(".link").children("a").attr("href","shopDetails.jsp?shopId=" + data[i].shopId);
                            $ge.children("div").children("div").children(".name").append("<span>" + data[i].shopName + "</span>");
                            $ge.children("div").children("div").children("img").attr("src",data[i].picture);}
                        if(i>=data.length){
                            $ge.fadeOut(1);
                        }
                        $ge=$ge.next();
                    }
                    if(data.length<11){
                        $("#next").hide();
                    }
                    if(data.length==11){
                        $("#next").fadeIn(1);
                    }
                },
                dataType:"json"
            });
        });
        $("#others").on('click',function () {
            var value=$("#others").val();
            $("#previous").hide();
            document.getElementById('pageCounter').innerText="1";
            $.ajax({
                url:"../shopsClassification",
                data:{
                    category:value,
                    start:1
                },
                type:"post",
                success:function showShops(data) {
                    $(".col-md-6").children("div").children("div").children(".name").text("");
                    $(".col-md-6").children("div").children("div").children("img").attr("src","");
                    category=value;
                    var $ge=$("#first");
                    for(var i=0;i<10;i++){
                        if(i<data.length) {
                            $ge.fadeIn(1);
                            $ge.children("div").children("div").children(".link").children("a").attr("href","shopDetails.jsp?shopId=" + data[i].shopId);
                            $ge.children("div").children("div").children(".name").append("<span>" + data[i].shopName + "</span>");
                            $ge.children("div").children("div").children("img").attr("src",data[i].picture);}
                        if(i>=data.length){
                            $ge.fadeOut(1);
                        }
                        $ge=$ge.next();
                    }
                    if(data.length<11){
                        $("#next").hide();
                    }
                    if(data.length==11){
                        $("#next").fadeIn(1);
                    }
                },
                dataType:"json"
            });
        });
        $("#previous").on("click",function () {
            $("#next").fadeIn(1);
            if(parseInt(document.getElementById('pageCounter').innerText)>1) {
                document.getElementById('pageCounter').innerText = parseInt(document.getElementById('pageCounter').innerText)-1;
            }
            var start=document.getElementById('pageCounter').innerText;
            $.ajax({
                url:"../shopsClassification",
                data:{
                    category:category,
                    start:start
                },
                type:"post",
                success:function showShops(data) {
                    $(".col-md-6").children("div").children("div").children(".name").text("");
                    $(".col-md-6").children("div").children("div").children("img").attr("src","");
                    var $ge=$("#first");
                    for(var i=0;i<10;i++){
                        if(i<data.length) {
                            $ge.fadeIn(1);
                            $ge.children("div").children("div").children(".link").children("a").attr("href","shopDetails.jsp?shopId=" + data[i].shopId);
                            $ge.children("div").children("div").children(".name").append("<span>" + data[i].shopName + "</span>");
                            $ge.children("div").children("div").children("img").attr("src",data[i].picture);}
                        if(i>=data.length){
                            $ge.fadeOut(1);
                        }
                        $ge=$ge.next();
                    }
                    if(start==1){
                        $("#previous").hide();
                    }
                },
                dataType:"json"
            });
        });
        $("#next").on("click",function () {
            // $("#previous").fadeIn(1);
            document.getElementById('pageCounter').innerText=parseInt(document.getElementById('pageCounter').innerText)+1;
            var value="<%=session.getAttribute("category")%>";
            var start=document.getElementById('pageCounter').innerText;
            $.ajax({
                url:"../shopsClassification",
                data:{
                    category:category,
                    start:start
                },
                type:"post",
                success:function showShops(data) {
                    $(".col-md-6").children("div").children("div").children(".name").text("");
                    $(".col-md-6").children("div").children("div").children("img").attr("src","");
                    var $ge=$("#first");
                    for(var i=0;i<10;i++){
                        if(i<data.length) {
                            $ge.fadeIn(1);
                            $ge.children("div").children("div").children(".link").children("a").attr("href","shopDetails.jsp?shopId=" + data[i].shopId);
                            $ge.children("div").children("div").children(".name").append("<span>" + data[i].shopName + "</span>");
                            $ge.children("div").children("div").children("img").attr("src",data[i].picture);}
                        if(i>=data.length){
                            $ge.fadeOut(1);
                        }
                        $ge=$ge.next();
                    }
                    if(data.length<11){
                        $("#next").hide();
                    }
                    $("#previous").fadeIn(1);
                },
                dataType:"json"
            });
        });

    };
</script>
<html>
<head>
    <title>商铺分类</title>
</head>
<body>
<div class="container-fluid">
    <h1 id="titletop" style="text-align: center">欢迎来到南财点评</h1>
</div>

<%--<div class="container"style="text-align: center">--%>
<%--    <ul class="nav nav-pills .nav-stacked">--%>
<%--        <li role="presentation" class="active"><a href="../index.jsp">首页</a></li>--%>
<%--        <li role="presentation"><a href="login.jsp">登录</a></li>--%>
<%--        <li role="presentation"><a href="register.jsp">注册</a></li>--%>
<%--    </ul>--%>
<%--</div>--%>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2">
            <div class="row">
                <div class="col-sm-12">
                    <button type="button" class="btn btn-info btn-lg shopsClassification btn-default"
                            style="width:100%;height: 100px" name="shopClassification" value="0"id="cafeteria">食堂</button>
                </div>
                <div class="col-sm-12">
                    <button type="button" class="btn btn-info btn-lg shopsClassification"
                            style="width:100%;height: 100px" name="shopClassification" value="1"id="supermarket">超市</button>
                </div>
                <div class="col-sm-12">
                    <button type="button" class="btn btn-info btn-lg shopsClassification"
                            style="width:100%;height: 100px" name="shopClassification" value="2"id="fruitshops" >水果店</button>
                </div>
                <div class="col-sm-12">
                    <button type="button" class="btn btn-info btn-lg shopsClassification"
                            style="width:100%;height: 100px" name="shopClassification" value="3" id="others">其他</button>
                </div>
            </div>
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-md-6"style="border:1px solid darkblue" id="first">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                           <img src="../img/dbimg/0.jpg" alt="超市"class="image-circle" style="height:380px;width:500px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="../index.jsp" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="../img/dbimg/0.jpg" alt="超市"class="image-circle"style="height:380px;width:500px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="shopDetails.jsp" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="../img/dbimg/0.jpg" alt="超市"class="image-circle"style="height:380px;width:500px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="shopDetails.jsp" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="../img/dbimg/0.jpg" alt="超市"class="image-circle"style="height:380px;width:500px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="shopDetails.jsp" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="../img/dbimg/0.jpg" alt="超市"class="image-circle"style="height:380px;width:500px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="shopDetails.jsp" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="../img/dbimg/0.jpg" alt="超市"class="image-circle"style="height:380px;width:500px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="shopDetails.jsp" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="../img/dbimg/0.jpg" alt="超市"class="image-circle"style="height:380px;width:500px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="shopDetails.jsp" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="../img/dbimg/0.jpg" alt="超市"class="image-circle"style="height:380px;width:500px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="shopDetails.jsp" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="../img/dbimg/0.jpg" alt="超市"class="image-circle"style="height:380px;width:500px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="shopDetails.jsp" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="../img/dbimg/0.jpg" alt="超市"class="image-circle"style="height:380px;width:500px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="shopDetails.jsp" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <nav aria-label="Page navigation" class="col-lg-4 col-lg-offset-4">
                    <ul class="pagination pagination-lg">
                        <li>
                            <a href="#" aria-label="Previous" id="previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#" id="pageCounter">1</a></li>
                        <li>
                            <a href="#" aria-label="Next" id="next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<br><br><br><br>
<div class="container-fluid">
    <ul class="nav nav-pills navbar-fixed-bottom navbar-inverse">
        <div class="row">
            <li role="presentation" class="active col-sm-4"><a href="../index.jsp" style="padding: 80px">首页</a></li>
            <li role="presentation"class="col-sm-4"><a href="shopsClassification.jsp" style="padding: 80px">浏览商铺</a> </li>
            <li role="presentation" class="col-sm-4"><a href="myComments.jsp"style="padding: 80px">我的</a></li>
        </div>
    </ul>
</div>
</body>
</html>
