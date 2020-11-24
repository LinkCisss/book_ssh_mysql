<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>用户注册</div>
		
		<div class="feat_prod_box_details">
		
			<div class="contact_form">
				<div class="form_subtitle">用户注册</div>
				<span style="color:red;">${msg}</span>
				<form action="register.action" method="post">
					<div class="form_row">
						<label class="contact"><strong><font style="color:red;">*</font>用户:</strong></label>
						<input type="text" name="user.username" class="contact_input" required="required"/>
					</div>
					<div class="form_row">
						<label class="contact"><strong><font style="color:red;">*</font>密码:</strong></label>
						<input type="password" name="user.password" class="contact_input" required="required"/>
					</div>
					<div class="form_row">
						<input type="submit" class="register" value="注册" style="margin-right:10px"/>
						<a href="login.jsp" style="float:right;margin:8px">已有账户? 点击登录</a>
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