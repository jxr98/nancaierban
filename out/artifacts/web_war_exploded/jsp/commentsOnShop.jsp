<%--
  Created by IntelliJ IDEA.
  User: jqjxx
  Date: 2020/6/10
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include/header.jsp"%>
<%@ page import="bean.Shop"%>
<%@ page import="service.ShopService"%>
<%@ page import="service.CommentService"%>

<%
    Integer shopId=(int)session.getAttribute("shopIdForShops");
    if(shopId==null){
        response.sendRedirect("shopLogin.jsp");
    }
%>
<script>
    $(function(){
        $("#previous").hide();
        var shopId="<%= shopId%>";
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
            url:"../commentsOnShop",
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
        $("#previous").on("click",function () {
            $("#next").fadeIn(1);
            document.getElementById('pageCounter').innerText = parseInt(document.getElementById('pageCounter').innerText)-1;
            var start=document.getElementById('pageCounter').innerText;
            $.ajax({
                url:"../commentsOnShop",
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
    <title>关于店铺的所有评价</title>
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
</body>
</html>
