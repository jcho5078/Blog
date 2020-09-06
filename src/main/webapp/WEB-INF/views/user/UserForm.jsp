<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.jcho5078.blog.vo.UserVO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css?after" />
</head>
<body>
<% UserVO vo = (UserVO)request.getAttribute("userForm"); %>
<div class="page-wrap">
	<!-- Nav -->
	<nav id="nav">
		<ul>
			<li><a href="${pageContext.request.contextPath}" class="active"><span class="icon fa-home"></span></a></li>
			<li><a href="${pageContext.request.contextPath}/gallery"><span class="icon fa-camera-retro"></span></a></li>
			<li><a href="${pageContext.request.contextPath}/generic"><span class="icon fa-file-text-o"></span></a></li>
		</ul>
	</nav>
	
	<!-- Main -->
	<section id="main">
		<header id="header">
			<h1>회원정보 수정</h1>
		</header>
		<section id="banner" style="height: 20em;">
			<div class="inner">
				<h3>회원정보 수정</h3>
			</div>
		</section>
		<section id="galleries">
			<div class="gallery">
				<form action="updateUserForm">
					<table border="1">
						<tr>
							<th>ID</th>
							<th>PW</th>
							<th>닉네임</th>
							<th>수정</th>
						</tr>
						<tr>
							<td id="id"><c:out value="${userForm.id}"/></td>
							<td><input type="password" name="pw"></td>
							<td><input type="text" id="name" name="name" placeholder="${userForm.name}"></td>
							<td><input type="submit" value="수정"></td>
						</tr>
					</table>
				</form>
				
				<form action="deleteUser" id="deleteForm">
					<input type="button" id="delete" value="탈퇴">
					<input type="hidden" id="delete_id" name="id" value="">
				</form>
			</div>
		</section>
	</section>
</div>
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