<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/cart.js"></script>
<title>购物车</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>我的购物车</div>
		
		<div class="feat_prod_box_details">
		
			<c:if test="${sessionScope.indent != null}">
			
				<table class="cart_table">
					
					<c:forEach var="item" items="${sessionScope.indent.itemList}">
						<tr class="cart_title">
							<td>
								<a href="detail.action?bookid=${item.book.id}">
									<img src="../${item.book.cover}" class="thumb" border="0"/>
								</a>
							</td>
							<td>${item.book.name}</td>
							<td>${item.book.price}</td>
							<td>x ${item.amount}</td>
							<td>${item.total}</td>
							<td>
								<a href="javascript:buy(${item.book.id});">[添加]</a>
								<a href="javascript:lessen(${item.book.id});">[减少]</a>
								<a href="javascript:deletes(${item.book.id});">[删除]</a>
							</td>
						</tr>			
					</c:forEach>
					
	          		<tr>
			            <td colspan="4" class="cart_total"><span class="red">总价: </span></td>
			            <td>${sessionScope.indent.total}</td>
	          		</tr>
	        	</table><br>
	        	
	        	<form action="save.action" method="post" id="form_save_order">
	        	
	        		<c:if test="${sessionScope.user!=null}">
		        		<table class="cart_table">
		        			<tr>
			        			<td>收货人姓名: <input type="text" name="indent.name" value="${sessionScope.user.name}" placeholder="收货人姓名" style="width:100px" required="required"/></td>
				        		<td>收货人电话: <input type="text" name="indent.phone" value="${sessionScope.user.phone}" placeholder="收货人电话" style="width:100px" required="required"/></td>
				        		<td>收货人地址: <input type="text" name="indent.address" value="${sessionScope.user.address}" placeholder="收货地址" style="width:180px" required="required"/></td>
			        		</tr>
		        		</table>
	        		</c:if>
	        		
	        		<input type="submit" class="checkout" value="提交订单"/>
	        		
	        	</form>
	        	
			
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