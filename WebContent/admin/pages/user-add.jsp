<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<form action="<c:url value="/admin/userAdd.action"/>" method="post" >

		用户：<input type="text" name="user.username" required="required"><br>
		密码：<input type="text" name="user.password" required="required"><br>
		姓名：<input type="text" name="user.name"><br>
		电话：<input type="text" name="user.phone"><br>
		地址：<input type="text" name="user.address"><br>
		
		<input type="submit" value="添加"/>
		
	</form>
	
	${msg}
	
</body>
</html>
