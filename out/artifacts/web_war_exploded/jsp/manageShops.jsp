<%--
  Created by IntelliJ IDEA.
  User: jqjxx
  Date: 2020/6/15
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include/header.jsp"%>
<%
    String managerName=(String)session.getAttribute("managerName");
    if(managerName==null){
        response.sendRedirect("index.jsp");
    }
%>
<script>
    window.onload=function () {
        $("#previous").hide();
        document.getElementById('pageCounter').innerText = "1";
        $.ajax({
            url: "../manageShops",
            data: {
                status: 0,
                start: 1
            },
            type: "post",
            success: function showShops(data) {
                $(".col-md-6").children("div").children("div").children(".name").text("");
                $(".col-md-6").children("div").children("div").children("img").attr("src", "");
                var $ge = $("#first");
                for (var i = 0; i < 10; i++) {
                    if (i < data.length) {
                        $ge.fadeIn(1);
                        $ge.children("div").children("div").children(".link").children("a").attr("href", "manageShopsDetails.jsp?shopId=" + data[i].shopId);
                        $ge.children("div").children("div").children(".name").append("<span>" + data[i].shopName + "</span>");
                        $ge.children("div").children("div").children("img").attr("src", data[i].picture);
                    }
                    if (i >= data.length) {
                        $ge.fadeOut(1);
                    }
                    $ge = $ge.next();
                }
                if (data.length < 11) {
                    $("#next").hide();
                }
                if (data.length == 11) {
                    $("#next").fadeIn(1);
                }
            },
            dataType: "json"
        });
        $("#previous").on("click",function () {
            $("#next").fadeIn(1);
            if(parseInt(document.getElementById('pageCounter').innerText)>1) {
                document.getElementById('pageCounter').innerText = parseInt(document.getElementById('pageCounter').innerText)-1;
            }
            var start=document.getElementById('pageCounter').innerText;
            $.ajax({
                url:"../manageShops",
                data:{
                    status:0,
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
                            $ge.children("div").children("div").children(".link").children("a").attr("href","manageShopsDetails.jsp?shopId=" + data[i].shopId);
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
            var start=document.getElementById('pageCounter').innerText;
            $.ajax({
                url:"../manageShops",
                data:{
                    status:0,
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
                            $ge.children("div").children("div").children(".link").children("a").attr("href","manageShopsDetails.jsp?shopId=" + data[i].shopId);
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
    <title>管理商铺(以下为刚注册待待审批)</title>
</head>
<body>
<div class="container-fluid">
    <h1 id="titletop" style="text-align: center">欢迎来到南财点评</h1>
    <h2 id="titletop2" style="text-align: center">所有注册但未审核通过的店铺</h2>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-10">
            <div class="row">
                <div class="col-md-6"style="border:1px solid darkblue" id="first">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="" alt="没有图片"class="image-circle" style="height:380px;width:400px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="" alt="没有图片"class="image-circle" style="height:380px;width:400px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="" alt="没有图片"class="image-circle" style="height:380px;width:400px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="" alt="没有图片"class="image-circle" style="height:380px;width:400px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="" alt="没有图片"class="image-circle" style="height:380px;width:400px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="" alt="没有图片"class="image-circle" style="height:380px;width:400px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="" alt="没有图片"class="image-circle" style="height:380px;width:400px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="" alt="没有图片"class="image-circle" style="height:380px;width:400px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="" alt="没有图片"class="image-circle" style="height:380px;width:400px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="" class="btn btn-primary" role="button">点击查看详情</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"style="border:1px solid darkblue">
                    <div class="thumbnail row">
                        <div class="col-sm-12">
                            <img src="" alt="没有图片"class="image-circle" style="height:380px;width:400px">
                        </div>
                        <div class="caption">
                            <p class="name"></p>
                            <p class="link"><a href="" class="btn btn-primary" role="button">点击查看详情</a> </p>
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
</body>
</html>
