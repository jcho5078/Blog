<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><!-- spring form의 차이 공부 필요 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/assets/css/main.css?after" />
</head>
<body>
		<section id="main">
		<header id="header">
			<div>회원가입</div>
		</header>
		
		<div class="inner">
			<form action="signUp" name="insertUser" method="post">
				ID: <input type="text" name="id"><br>
				PW: <input type="text" name="pw"><br>
				NAME: <input type="text" name ="name"><br>
				<input type="submit" value="회원가입">
			</form>
		</div>
	</section>
</body>
</html>