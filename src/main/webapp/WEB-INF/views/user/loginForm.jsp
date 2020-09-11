<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>로그인</title>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css?after" />
</head>
<body>
	<section id="main">
		<header id="header">
			<div>로그인</div>
		</header>
		
		<div class="inner">
			<form action="${pageContext.request.contextPath}/loginPass" method="post" id="loginForm">
				ID: <input type="text" name="id" placeholder="ID"><br>
				PW: <input type="password" id="input_pw" placeholder="PW">
				<input type="hidden" id="pw" name="pw">
				<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				<input id="login" type="button" value="로그인">
			</form>

			* <a href="signUpPage">회원가입</a>
			
			<c:if test='${error eq "login"}'>
				<h4 style="color: red;">아이디, 비밀번호 오류.</h4>
			</c:if>
			<c:if test='${error eq "duplicate"}'>
				<h4 style="color: red;">이미 로그인 중인 사용자.</h4>
			</c:if>
			<c:if test='${error eq "NotFound"}'>
				<h4 style="color: red;">등록되지 않은 유저.</h4>
			</c:if>
			<c:if test='${error eq "Authentication Error"}'>
				<h4 style="color: red;">잘못된 정보</h4>
			</c:if>
		</div>
	</section>
	
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/jquery.poptrox.min.js"></script>
	<script src="resources/assets/js/jquery.scrolly.min.js"></script>
	<script>
		$('#login').click(function(e){
			var pw = $("#input_pw").val();
			console.log(pw);
			$('#pw').val(pw);
			console.log("dd: "+$('#pw').val());
			$('#loginForm').submit();
		});
	</script>
</body>
</html>