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
			<form action="${pageContext.request.contextPath}/logout" method="POST" class="logout_form">
		   		<button type="submit">로그아웃</button>
			</form>
		</header>
		<section id="banner">
			<div class="inner">
				<h3>회원정보 수정</h3>
			</div>
		</section>
		<section id="galleries">
			<div class="gallery">
				<div class="userForm" style="align-content: center; display: inline;">
					<form action="updateUserForm">
						<dl>
							<dt><label>ID</label></dt>
							<dd>
								<h3 id="id"><c:out value="${userForm.id}"/></h3>
								<input id="id_hidden" name="id" type="hidden">
							</dd>
						</dl>
						<dl>
							<dt>PW</dt>
							<dd><input type="password" name="pw" placeholder="Pw"></dd>
						</dl>
						<dl>
							<dt>닉네임</dt>
							<dd><input type="text" id="name" name="name" value="${userForm.name}"></dd>
						</dl>
						<dl>
							<dt>가입 일짜</dt>
							<dd><c:out value="${userForm.hiredate}"/></dd>
						</dl>
						<input type="submit" value="수정">
					</form>
					<form action="deleteUser" id="deleteForm">
						<input type="button" id="delete" value="탈퇴">
						<input type="hidden" id="delete_id" name="id" value="">
					</form>
				</div>
			</div>
		</section>
	</section>
</div>
<script>
$("#delete").click(function() {

	var id = $("#id").text();
	
	document.getElementById("delete_id").value = id;
	
	document.getElementById("deleteForm").submit();
});

var id_hidden = $("#id").text();
document.getElementById("id_hidden").value = id_hidden;

</script>
</body>
</html>