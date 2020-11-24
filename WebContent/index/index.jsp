<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书店首页</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<!-- 精品推荐 -->
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>精品推荐</div>

		<c:forEach var="book" items="${specialList}">
		
			<div class="feat_prod_box">
				<div class="prod_img">
					<a href="detail.action?bookid=${book.id}"><img src="../${book.cover}" class="thumb_big"/></a>
				</div>
				<div class="prod_det_box">
					<div class="box_top"></div>
					<div class="box_center">
						<span class="special_icon"><img src="images/special_icon.gif"></span>
						<div class="prod_title">
							<a href="detail.action?bookid=${book.id}">${book.name}</a>
						</div>
						<p class="details">${book.intro}</p>
						<a href="detail.action?bookid=${book.id}" class="more">- 图书详情 -</a>
						<div class="clear"></div>
					</div>
					<div class="box_bottom"></div>
				</div>
				<div class="clear"></div>
			</div>		
				
		</c:forEach>
		

		<!-- 最新出版 -->
		<div class="title"><span class="title_icon"><img src="images/bullet2.gif"/></span>最新出版</div>
		
		<div class="new_products">
			<c:forEach var="book" items="${newList}">
				<div class="new_prod_box"> 
					<a href="detail.action?bookid=${book.id}">${book.name}</a>
					<div class="new_prod_bg">
						<span class="new_icon"><img src="images/new_icon.gif"/></span>
						<a href="detail.action?bookid=${book.id}"><img src="../${book.cover}" class="thumb" border="0" /></a> 
					</div>
				</div>
			</c:forEach>
		
		</div>
		
		<div class="clear"></div>
	
	</div>
   
   	<jsp:include page="right.jsp"/>
   
	<div class="clear"></div>
	
</div>

<jsp:include page="footer.jsp"/>

</div>

</body>
</html>