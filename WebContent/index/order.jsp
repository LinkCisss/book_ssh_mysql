<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/cart.js"></script>
<title>我的订单</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>我的订单</div>
		
		<div class="feat_prod_box_details">
		
			<c:if test="${indentList != null}">
			
				<c:forEach var="indent" items="${indentList}">
			
					<table class="cart_table">
					
						<tr>
		          			<td colspan="3">下单时间: ${indent.systime}</td>
				            <td class="cart_total"><span class="red">总价: </span></td>
				            <td>${indent.total}</td>
		          		</tr>
					
						<c:forEach var="item" items="${indent.itemList}">
							<tr class="cart_title">
								<td>
									<a href="detail.action?bookid=${item.book.id}">
										<img src="../${item.book.cover}" class="thumb" border="0"/>
									</a>
								</td>
								<td>${item.book.name}</td>
								<td>${item.book.price}</td>
								<td>${item.amount}</td>
								<td>${item.total}</td>
							</tr>			
						</c:forEach>
						
		        	</table><br>
		        	
		        </c:forEach>
	        	
			</c:if>
			
			${msg}
		
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