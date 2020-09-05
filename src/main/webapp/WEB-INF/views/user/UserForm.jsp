<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.jcho5078.blog.vo.UserVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserForm</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<h1>유저 정보</h1>
	<% UserVO vo = (UserVO)request.getAttribute("userForm"); %>
	<h2><c:out value="${userForm.id}"/>님 환영합니다.</h2>
	<form action="updateUserForm">
		<table border="1">
			<tr>
				<th>ID</th>
				<th>PW</th>
				<th>닉네임</th>
				<th>수정</th>
			</tr>
			<tr>
				<td id="id">${userForm.id}</td>
				<td><input type="password" name="pw"></td>
				<td><input type="text" name="name" value="${userForm.name}"></td>
				<td><input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
	<form action="deleteUser" id="deleteForm">
		<input type="button" id="delete" value="탈퇴">
		<input type="hidden" id="delete_id" name="id" value="">
	</form>
<script>
$("#delete").click(function() {

	var id = $("#id").text();
	console.log(id);
	
	document.getElementById("delete_id").value = id;
	
	document.getElementById("deleteForm").submit();
});
</script>
</body>
</html>