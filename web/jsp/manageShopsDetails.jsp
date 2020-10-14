<%--
  Created by IntelliJ IDEA.
  User: jqjxx
  Date: 2020/6/15
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include/header.jsp"%>
<%@ page import="bean.Shop"%>
<%@ page import="service.ShopService"%>
<%
    String managerName=(String)session.getAttribute("managerName");
    if(managerName==null){
        response.sendRedirect("index.jsp");
    }
%>
<script>
    $(function() {
            <%int shopId=request.getParameter("shopId")!=null?Integer.parseInt(request.getParameter("shopId")):(int)session.getAttribute("shopId");%>
            var shopId = "<%= shopId%>";
            <%Shop shop=new ShopService().get(shopId);%>;
            var shopName = "<%= shop.getShopName()%>";
            var locationDetails = "<%= shop.getLocationDetail()%>";
            var phoneNumber = "<%= shop.getPhoneNumber()%>";
            var picture = "<%= shop.getPicture()%>";
            $(".shopName").append("<span>" + shopName + "</span>");
            $(".locationDetails").append("<span>" + locationDetails + "</span>");
            $(".phoneNumber").append("<span>" + phoneNumber + "</span>");
            $(".col-sm-6").children("img").attr("src", picture);
            $(".btn-lg").on("click",function () {
                <%
                ShopService shopService=new ShopService();
                shopService.updateShopStatus(shopId);
                %>
                $(".btn-lg").html("已审核通过");
            });
        });
</script>
<html>
<head>
    <title>管理商铺(以下为刚注册待待审批)</title>
</head>
<body>
<div class="container-fluid">
    <h1 id="titletop" style="text-align: center">欢迎来到南财点评</h1>
    <h2 id="titletop2" style="text-align: center">注册但未审核通过的店铺的详情</h2>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <h3 class="shopName"></h3>
            <p class="locationDetails lead glyphicon glyphicon-tags">商铺地址详情：</p>
            <p></p>
            <p class="phoneNumber lead glyphicon glyphicon-earphone">电话：</p>
            <br/><br/>
            <button type="button" class="btn btn-primary btn-lg">通过审核</button>
        </div>
        <div class="col-sm-6">
            <img src="" alt="picture"style="height:380px;width:500px">
        </div>
    </div>
</div>
</body>
</html>
