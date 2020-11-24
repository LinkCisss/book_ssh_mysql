<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
</head>
<body>
<div class="header">

    <div class="logo">
	    <a href="index.action">
	    	<img src="images/logo.gif" border="0" /></a>
    </div>
    
    <div id="menu">
		<ul>
			<li <c:if test="${flag==1}">class="selected"</c:if>><a href="index.action">书店首页</a></li>
			<li <c:if test="${flag==2}">class="selected"</c:if>><a href="about.action">书店简介</a></li>
			<li <c:if test="${flag==3}">class="selected"</c:if>><a href="special.action">精品推荐</a></li>
			<li <c:if test="${flag==4}">class="selected"</c:if>><a href="new.action">最新出版</a></li>
			<li <c:if test="${flag==5}">class="selected"</c:if>><a href="sale.action">优惠促销</a></li>
			<c:if test="${sessionScope.user == null}">
				<li <c:if test="${flag==6}">class="selected"</c:if>><a href="login.jsp">用户登陆</a></li>
				<li <c:if test="${flag==7}">class="selected"</c:if>><a href="register.jsp">用户注册</a></li>
				<li><a href="../admin/login.jsp" target="_blank">后台管理</a></li>
			</c:if>
			<c:if test="${sessionScope.user != null}">
				<li <c:if test="${flag==8}">class="selected"</c:if>><a href="my.action">个人中心</a></li>
				<li <c:if test="${flag==9}">class="selected"</c:if>><a href="order.action">我的订单</a></li>
				<li><a href="logout.action">注销登录</a></li>
			</c:if>
			<li style="float: right; margin-right: 10px;">
				<form action="search.action" method="post" id="form_search">
					<a href="javascript:void(0);" onclick="$('#form_search').submit()" style="float: right;margin-left:0">搜索</a>
					<input type="text" name="searchName" value="${searchName}" placeholder="输入图书名称" />
				</form>
			</li>
		</ul>
    </div>
</div>

</body>
</html>