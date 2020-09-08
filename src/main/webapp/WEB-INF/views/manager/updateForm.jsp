<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.jcho5078.blog.vo.UserVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% UserVO User = (UserVO) request.getAttribute("User"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 정보 수정</title>
</head>
<body>
<form action="updateAllUser">
	<table border="1">
		<tr>
			<th>ID</th>
			<th>PW</th>
			<th>NAME</th>
			<th>수정</th>
		</tr>
		<tr>
			<td id="id"><c:out value="${User.getId()}"/></td>
			<td><input type="text" name="pw" value="${User.getPw()}"></td>
			<td><input type="text" name="name" value="${User.getName()}"></td>
			<td>
				<input type="hidden" id="id_hidden" name="id">
				<input type="submit" value="수정하기">
			</td>
		</tr>
	</table>
</form>
<script>
	var id_hidden = $("#id").text();
	document.getElementById("id_hidden").value = id_hidden;
</script>
</body>
</html>