<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>个人中心</div>

		<div class="feat_prod_box_details">
		
			<div class="contact_form">
				<div class="form_subtitle">个人信息</div>
				<span style="color:red;">${msg}</span>
				<form action="update.action" method="post">
					<input type="hidden" name="user.id" value="${sessionScope.user.id}">
					<div class="form_row">
						<label class="contact"><strong>姓名:</strong></label>
						<input type="text" name="user.name" class="contact_input" value="${sessionScope.user.name}"/>
					</div>
					<div class="form_row">
						<label class="contact"><strong>电话:</strong></label>
						<input type="text" name="user.phone" class="contact_input" value="${sessionScope.user.phone}"/>
					</div>
					<div class="form_row">
						<label class="contact"><strong>地址:</strong></label>
						<input type="text" name="user.address" class="contact_input" value="${sessionScope.user.address}"/>
					</div>
					<div class="form_row"></div>
					<div class="form_row">
						<input type="submit" class="register" value="提交保存" style="margin-right:10px"/>
					</div>
				</form>
        	</div>
		
			<div class="contact_form">
				<div class="form_subtitle">登录密码</div>
				<span style="color:red;">${msg2}</span>
				<form action="updatePassword.action" method="post">
					<input type="hidden" name="user.id" value="${sessionScope.user.id}">
					<div class="form_row">
						<label class="contact"><strong>原密码:</strong></label>
						<input type="password" name="user.password" class="contact_input" required="required"/>
					</div>
					<div class="form_row">
						<label class="contact"><strong>新密码:</strong></label>
						<input type="password" name="user.password2" class="contact_input" required="required"/>
					</div>
					<div class="form_row"></div>
					<div class="form_row">
						<input type="submit" class="register" value="提交保存" style="margin-right:10px"/>
					</div>
				</form>
        	</div>
		
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