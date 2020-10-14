<%--
  Created by IntelliJ IDEA.
  User: jqjxx
  Date: 2020/5/27
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include/header.jsp"%>
<%@ page import="bean.Shop"%>
<%@ page import="service.ShopService"%>
<%@ page import="service.CommentService"%>
<%
    Integer customerId=(int)session.getAttribute("customerId");
    if(customerId==null){
        response.sendRedirect("login.jsp");
    }
%>
<script>
    $(function(){
        $("#previous").hide();
        <%int shopId=request.getParameter("shopId")!=null?Integer.parseInt(request.getParameter("shopId")):(int)session.getAttribute("shopId");%>
        var shopId="<%= shopId%>";
        var customerId="<%= (int)session.getAttribute("customerId")%>"
        var start=1;
        <%Shop shop=new ShopService().get(shopId);%>;
        var shopName="<%= shop.getShopName()%>";
        var locationDetails="<%= shop.getLocationDetail()%>";
        var phoneNumber="<%= shop.getPhoneNumber()%>";
        var picture="<%= shop.getPicture()%>";
        var score="<%= new CommentService().getAverageScore(shopId)%>";
        score=Number(score).toFixed(2);
        $(".shopName").append("<span>" + shopName + "</span>");
        $(".locationDetails").append("<span>" + locationDetails + "</span>");
        $(".phoneNumber").append("<span>" + phoneNumber + "</span>");
        $(".col-sm-6").children("img").attr("src",picture);
        $("h3").children(".label-default").append(score);
        $.ajax({
            url:"../shopDetails",
            data:{
                shopId:shopId,
                start:start
            },
            type:"post",
            success:function showDetails(data) {
                var $ge=$(".first");
                for(var i=0;i<10;i++) {
                    if(i<data.length) {
                        $ge.fadeIn(1);
                        $ge.children("ul").children("li:first-child").append(data[i].customerName);
                        $ge.children("ul").children("li:nth-child(2)").prepend(data[i].content + "</br>" + data[i].date + "</br>");
                        $ge.children("ul").children("li:nth-child(2)").children("img").attr("src",data[i].picture);
                    }
                    if(i>=data.length){
                        $ge.fadeOut(1);
                    }
                    $ge=$ge.next();
                }
                if(data.length<11){
                    $("#next").hide();
                }
            },
            dataType:"json"
        });
        $.ajax({
            url:"../shopDetailsRecommend",
            data:{
                shopId:shopId,
            },
            type:"post",
            success:function showRecommend(data) {
                var $ge=$(".recommend");
                for(var i=0;i<4;i++) {
                    if(i<data.length) {
                        $ge.fadeIn(1);
                        $ge.children("div").children("div").children(".link").children("a").attr("href","shopDetails.jsp?shopId=" + data[i].shopId);
                        $ge.children("div").children("div").children(".name").append("<span>" + data[i].shopName + "</span>");
                        $ge.children("div").children("div").children("img").attr("src",data[i].picture);
                    }
                    $ge=$ge.next();
                }
            },
            dataType:"json"
        });

        $(".btn-lg").on("click",function () {
            document.location.href="comment.jsp?shopId=" + shopId+ "&shopName=" + shopName+ "&customerId=" + customerId;
        });
        $("#previous").on("click",function () {
            $("#next").fadeIn(1);
            document.getElementById('pageCounter').innerText = parseInt(document.getElementById('pageCounter').innerText)-1;
            var start=document.getElementById('pageCounter').innerText;
            $.ajax({
                url:"../shopDetails",
                data:{
                    shopId:shopId,
                    start:start
                },
                type:"post",
                success:function showDetails(data) {
                    var $ge=$(".first");
                    $(".list-group-item-success").text("");
                    $(".list-group-item-info").text("");
                    $(".list-group-item-info").append(
                        "<img src=\"\" alt=\"（该用户没上传图片）\"class=\"image-circle\"style=\"height:50px;width:100px\">");
                    for(var i=0;i<10;i++) {
                        if(i<data.length) {
                            $ge.fadeIn(1);
                            $ge.children("ul").children("li:first-child").append(data[i].customerName);
                            $ge.children("ul").children("li:nth-child(2)").prepend(data[i].content + "</br>" + data[i].date + "</br>");
                            $ge.children("ul").children("li:nth-child(2)").children("img").attr("src",data[i].picture);
                        }
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
            document.getElementById('pageCounter').innerText = parseInt(document.getElementById('pageCounter').innerText)+1;
            var start=document.getElementById('pageCounter').innerText;
            $.ajax({
                url:"../shopDetails",
                data:{
                    shopId:shopId,
                    start:start
                },
                type:"post",
                success:function showDetails(data) {
                    var $ge=$(".first");
                    $(".list-group-item-success").text("");
                    $(".list-group-item-info").text("");
                    $(".list-group-item-info").append(
                        "<img src=\"\" alt=\"（该用户没上传图片）\"class=\"image-circle\"style=\"height:50px;width:100px\">");
                    for(var i=0;i<10;i++) {;
                        if(i<data.length) {
                            $ge.fadeIn(1);
                            $ge.children("ul").children("li:first-child").append(data[i].customerName);
                            $ge.children("ul").children("li:nth-child(2)").prepend(data[i].content + "</br>" + data[i].date + "</br>");
                            $ge.children("ul").children("li:nth-child(2)").children("img").attr("src",data[i].picture);
                        }
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
    });
</script>
<html>
<head>
    <title>商铺详情</title>
</head>
<body>
<div class="container-fluid">
    <h1 id="titletop" style="text-align: center">欢迎来到南财点评</h1>
</div>

<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <h3 class="shopName"></h3>
            <p class="locationDetails lead glyphicon glyphicon-tags">商铺地址详情：</p>
            <p></p>
            <p class="phoneNumber lead glyphicon glyphicon-earphone">电话：</p>
            <br/><br/>
            <button type="button" class="btn btn-primary btn-lg">写评价</button>
        </div>
        <div class="col-sm-6">
            <img src="" alt="picture"style="height:380px;width:500px">
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <h3>平均分数(五分制) <span class="label label-default"></span></h3>
        </div>
        <div class="col-lg-6 well well-lg comment first">
            <ul class="list-group" style="text-align:center">
                <li class="list-group-item list-group-item-success"></li>
                <li class="list-group-item list-group-item-info" style="min-height: 200px;margin:0 auto">
                    <img src="" alt="（该用户没上传图片）"class="image-circle"style="height:50px;width:100px">
                </li>
            </ul>
        </div>
        <div class="col-lg-6 well well-lg comment">
            <ul class="list-group" style="text-align:center">
                <li class="list-group-item list-group-item-success"></li>
                <li class="list-group-item list-group-item-info" style="min-height: 200px;margin:0 auto">
                    <img src="" alt="（该用户没上传图片）"class="image-circle"style="height:50px;width:100px">
                </li>
            </ul>
        </div>
        <div class="col-lg-6 well well-lg comment">
            <ul class="list-group" style="text-align:center">
                <li class="list-group-item list-group-item-success"></li>
                <li class="list-group-item list-group-item-info" style="min-height: 200px;margin:0 auto">
                    <img src="" alt="（该用户没上传图片）"class="image-circle"style="height:50px;width:100px">
                </li>
            </ul>
        </div>
        <div class="col-lg-6 well well-lg comment">
            <ul class="list-group" style="text-align:center">
                <li class="list-group-item list-group-item-success"></li>
                <li class="list-group-item list-group-item-info" style="min-height: 200px;margin:0 auto">
                    <img src="" alt="（该用户没上传图片）"class="image-circle"style="height:50px;width:100px">
                </li>
            </ul>
        </div>
        <div class="col-lg-6 well well-lg comment">
            <ul class="list-group" style="text-align:center">
                <li class="list-group-item list-group-item-success"></li>
                <li class="list-group-item list-group-item-info" style="min-height: 200px;margin:0 auto">
                    <img src="" alt="（该用户没上传图片）"class="image-circle"style="height:50px;width:100px">
                </li>
            </ul>
        </div>
        <div class="col-lg-6 well well-lg comment">
            <ul class="list-group" style="text-align:center">
                <li class="list-group-item list-group-item-success"></li>
                <li class="list-group-item list-group-item-info" style="min-height: 200px;margin:0 auto">
                    <img src="" alt="（该用户没上传图片）"class="image-circle"style="height:50px;width:100px">
                </li>
            </ul>
        </div>
        <div class="col-lg-6 well well-lg comment">
            <ul class="list-group" style="text-align:center">
                <li class="list-group-item list-group-item-success"></li>
                <li class="list-group-item list-group-item-info" style="min-height: 200px;margin:0 auto">
                    <img src="" alt="（该用户没上传图片）"class="image-circle"style="height:50px;width:100px">
                </li>
            </ul>
        </div>
        <div class="col-lg-6 well well-lg comment">
            <ul class="list-group" style="text-align:center">
                <li class="list-group-item list-group-item-success"></li>
                <li class="list-group-item list-group-item-info" style="min-height: 200px;margin:0 auto">
                    <img src="" alt="（该用户没上传图片）"class="image-circle"style="height:50px;width:100px">
                </li>
            </ul>
        </div>
        <div class="col-lg-6 well well-lg comment">
            <ul class="list-group" style="text-align:center">
                <li class="list-group-item list-group-item-success"></li>
                <li class="list-group-item list-group-item-info" style="min-height: 200px;margin:0 auto">
                    <img src="" alt="（该用户没上传图片）"class="image-circle"style="height:50px;width:100px">
                </li>
            </ul>
        </div>
        <div class="col-lg-6 well well-lg comment">
            <ul class="list-group" style="text-align:center">
                <li class="list-group-item list-group-item-success"></li>
                <li class="list-group-item list-group-item-info" style="min-height: 200px;margin:0 auto">
                    <img src="" alt="（该用户没上传图片）"class="image-circle"style="height:50px;width:100px">
                </li>
            </ul>
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
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <p class="lead glyphicon glyphicon-hand-right">相似商铺推荐：</p>
        </div>
        <div class="col-md-6 recommend"style="border:1px solid darkblue">
            <div class="thumbnail row">
                <div class="col-sm-12">
                    <img src="" alt="店铺"class="image-circle" style="height:50px;width:100px">
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
                    <img src="" alt="店铺"class="image-circle" style="height:50px;width:100px">
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
                    <img src="" alt="店铺"class="image-circle" style="height:50px;width:100px">
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
                    <img src="" alt="店铺"class="image-circle" style="height:50px;width:100px">
                </div>
                <div class="caption">
                    <p class="name"></p>
                    <p class="link"><a href="../index.jsp" class="btn btn-primary" role="button">点击查看详情</a> </p>
                </div>
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
