<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<form action="userUpdate.action" method="post" >
	
		<input type="hidden" name="page" value="${param.page}"/>

		<input type="hidden" name="user.id" value="${user.id}"/>
		
		用户：${user.username}<br>
		姓名：<input type="text" name="user.name" value="${user.name}"><br>
		电话：<input type="text" name="user.phone" value="${user.phone}"><br>
		地址：<input type="text" name="user.address" value="${user.address}"><br>
		<input type="submit" value="修改"/>
		
		${msg}
		
	</form>
	
</body>
</html>
