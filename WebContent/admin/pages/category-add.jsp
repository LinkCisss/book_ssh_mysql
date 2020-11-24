<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<form action="../categoryAdd.action" method="post" >

		名称：<input type="text" name="category.name" required="required"/>
		
		<input type="submit" value="添加"/>
		
	</form>
		
	${msg}
	
</body>
</html>
