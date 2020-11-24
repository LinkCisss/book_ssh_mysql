<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书分类</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>图书分类</div>

		<div class="new_products">
		
			<c:forEach var="book" items="${bookList}">
			
				<div class="new_prod_box"> <a href="details.htm">${book.name}</a>
					<div class="new_prod_bg">
						<c:if test="${book.special==true}"><span class="new_icon"><img src="images/special_icon.gif"/></span></c:if>
						<c:if test="${book.news==true}"><span class="new_icon"><img src="images/new_icon.gif"/></span></c:if>
						<c:if test="${book.sale==true}"><span class="new_icon"><img src="images/promo_icon.gif"/></span></c:if>
						<a href="detail.action?bookid=${book.id}"><img src="../${book.cover}" class="thumb" border="0" /></a>
					</div>
				</div>
				
			</c:forEach>
			
			<!-- 分页 -->
			${pageTool}
			
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