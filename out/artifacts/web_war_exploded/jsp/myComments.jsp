<%--
  Created by IntelliJ IDEA.
  User: jqjxx
  Date: 2020/6/5
  Time: 19:11
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
        var customerId="<%= (int)session.getAttribute("customerId")%>";
        var start=1;
        $.ajax({
            url:"../myComments.do",
            data:{
                customerId:customerId,
                start:start
            },
            type:"post",
            success:function showDetails(data) {
                var $ge=$(".first");
                for(var i=0;i<10;i++) {
                    if(i<data.length) {
                        $ge.fadeIn(1);
                        $ge.children("ul").children("li:first-child").append(data[i].shopName);
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
                url:"../myComments.do",
                data:{
                    customerId:customerId,
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
                            $ge.children("ul").children("li:first-child").append(data[i].shopName);
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
                url:"../myComments.do",
                data:{
                    customerId:customerId,
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
                            $ge.children("ul").children("li:first-child").append(data[i].shopName);
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
    <title>我的评价</title>
</head>
<body>
<div class="container-fluid">
    <h1 id="titletop" style="text-align: center">欢迎来到南财点评</h1>
    <h2 style="text-align: center">我的所有评价</h2>
</div>

<div class="container">
    <div class="row">
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
