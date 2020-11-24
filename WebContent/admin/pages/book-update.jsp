<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="js/jqueryui/css/jquery-ui-1.10.2.css" />
<script src="js/jqueryui/js/jquery-1.9.1.js"></script>
<script src="js/jqueryui/js/jquery-ui-1.10.2.js"></script>
<script src="js/jqueryui/js/datepicker-zh-CN.js"></script>
</head>
<body>
	
	<form action="bookUpdate.action" method="post" enctype="multipart/form-data">

		<input type="hidden" name="page" value="${param.page}"/>
		
		<input type="hidden" name="book.id" value="${book.id}"/>
		<input type="hidden" name="book.cover" value="${book.cover}"/>

		封面：<img src="../${book.cover}" width="150px" height="150px">
		<br>
		修改: <input type="file" name="photo" size="12"/><br>
		书名：<input type="text" name="book.name" value="${book.name}" required="required"/><br>
		价格：<input type="text" name="book.price" value="${book.price}" required="required"/><br>
		介绍：<input type="text" name="book.intro" value="${book.intro}" required="required"/><br>
		作者：<input type="text" name="book.auther" value="${book.auther}"/><br>
		出版社：<input type="text" name="book.press" value="${book.press}"/><br>
		出版日期：<input type="text" id="datepicker" name="book.pubdate" value="${book.pubdate}"/><br>
		图书分类:  <select name="book.category.id">
						<c:forEach var="category" items="${categoryList}">
							<c:if test="${book.category.id==category.id}">
								<option value="${category.id}" selected="selected">${category.name}</option>
							</c:if>
							<c:if test="${book.category.id!=category.id}">
								<option value="${category.id}">${category.name}</option>
							</c:if>
						</c:forEach>
				   </select>
		<input type="submit" value="修改"/>
		
	</form>
		
	${msg}
	
</body>
</html>
