<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer customerId=(Integer) session.getAttribute("customerId");
    if(customerId==null){
        response.sendRedirect("jsp/login.jsp");
    }
%>
<%--<script>--%>
<%--    window.onload=function () {--%>
<%--        var customerId=<%= (int)session.getAttribute("customerId")%>;--%>
<%--        $.ajax({--%>
<%--            url:"indexRecommend",--%>
<%--            data:{--%>
<%--                customerId:customerId--%>
<%--            },--%>
<%--            type:"post",--%>
<%--            success:function showShops(data) {--%>
<%--                var $ge=$(".first");--%>
<%--                for(var i=0;i<4;i++){--%>
<%--                        $ge.children("div").children("div").children("p").children("a").attr("href","shopDetails.jsp?shopId=" + data[i].shopId);--%>
<%--                        $ge.children("div").children("div").children(".content").append("<span>" + data[i].shopName + "</span>");--%>
<%--                        $ge.children("div").children("img").attr("src",data[i].picture);--%>
<%--                    $ge=$ge.next();--%>
<%--                }--%>
<%--            },--%>
<%--            dataType:"json"--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>
<html>
  <head>
    <title>欢迎来到南财点评</title>
      <meta name="viewport" content="width=device-width,initial-scale=1">
      <link rel="stylesheet" href="css/bootstrap.css">
      <style>
          #titletop{
              font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
              color: #28a4c9;
              text-align:center;
          }
      </style>
  </head>
  <body>
  <div class="container-fluid">
      <h1 id="titletop">欢迎来到南财点评</h1>
  </div>

  <div class="container"style="text-align: center">
      <ul class="nav nav-pills .nav-stacked">
          <li role="presentation" class="active"><a href="#">首页</a></li>
          <li role="presentation"><a href="jsp/login.jsp">登录</a></li>
          <li role="presentation"><a href="jsp/register.jsp">注册</a></li>
          <li role="presentation"><a href="jsp/shopLogin.jsp">我是商家</a></li>
          <li role="presentation"><a href="jsp/managerLogin.jsp">我是管理员</a></li>
      </ul>
  </div>

  <div class="container">
      <div class="row">
          <div class="col-lg-6 first">
              <div class="thumbnail">
                  <img src="img/cafeteria.gif" alt="食堂" class="image-circle">
                  <div class="caption">
                      <h3>食堂</h3>
                      <p class="content"></p>
                      <p><a href="jsp/shopDetails.jsp?shopId=0" class="btn btn-primary" role="button">点击查看详情</a> </p>
                  </div>
              </div>
          </div>
          <div class="col-lg-6">
              <div class="thumbnail">
                  <img src="img/mall.jpg" alt="超市"class="image-circle">
                  <div class="caption">
                      <h3>超市</h3>
                      <p class="content"></p>
                      <p><a href="jsp/shopDetails.jsp?shopId=18" class="btn btn-primary" role="button">点击查看详情</a> </p>
                  </div>
              </div>
          </div>
          <div class="col-lg-6">
              <div class="thumbnail">
                  <img src="img/fruit.jpg" alt="水果店"class="image-circle">
                  <div class="caption">
                      <h3>水果店</h3>
                      <p class="content"></p>
                      <p><a href="jsp/shopDetails.jsp?shopId=10" class="btn btn-primary" role="button">点击查看详情</a> </p>
                  </div>
              </div>
          </div>
          <div class="col-lg-6">
              <div class="thumbnail">
                  <img src="img/barber.jpg" alt="理发店"class="image-circle">
                  <div class="caption">
                      <h3>理发店</h3>
                      <p class="content"></p>
                      <p><a href="jsp/shopDetails.jsp?shopId=24" class="btn btn-primary" role="button">点击查看详情</a> </p>
                  </div>
              </div>
          </div>
      </div>
  </div>

  <div class="container-fluid">
      <ul class="nav nav-pills navbar-fixed-bottom navbar-inverse">
          <div class="row">
              <li role="presentation" class="active col-sm-4"><a href="#" style="padding: 80px">首页</a></li>
              <li role="presentation"class="col-sm-4"><a href="jsp/shopsClassification.jsp" style="padding: 80px">浏览商铺</a> </li>
              <li role="presentation" class="col-sm-4"><a href="jsp/myComments.jsp"style="padding: 80px">我的评价</a></li>
          </div>
      </ul>
  </div>
  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
  </body>
</html>