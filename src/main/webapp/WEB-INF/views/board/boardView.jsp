<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page import="java.security.Principal" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<%@ page import="com.jcho5078.blog.user.CustomUserDetails" %>
<%@ page import="com.jcho5078.blog.vo.BoardVO" %>
<%@ page import="java.util.List"%>
<% BoardVO vo = (BoardVO)request.getAttribute("viewBoard"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
</head>
<body>

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
					<!-- Header -->
					<header id="header">
						<!-- if you login before -->
						<sec:authorize access="isAuthenticated()">
							<form action="${pageContext.request.contextPath}/logout" method="POST" class="logout_form">
								<c:out value="${name}님 환영합니다"/>
						   		<button type="submit">로그아웃</button>
						   		<button type="button" value="유저정보 확인" onclick="location.href='user/userForm'">유저정보 확인</button>
							</form>
						</sec:authorize>
						
						<!-- if you doesn't login before -->
						<sec:authorize access="isAnonymous()">
					   		<button type="button" value="유저정보 확인" onclick="location.href='login'">로그인</button>
						</sec:authorize>

						<!-- only manager access here -->
						<sec:authorize access="hasAuthority('ROLE_MANAGER')">
							<h3>*<a href="manage/viewAllUser" >유저 목록 확인(관리자)</a></h3>
						</sec:authorize>
					</header>
					
					<!-- Banner -->
						<section id="banner">
							<div class="inner">
								<h1>Galleria</h1>
								<p>함께하는 즐거움</p>
								<ul class="actions">
									<li><a href="#galleries" class="button alt scrolly big">Continue</a></li>
								</ul>
							</div>
						</section>

					<!-- Gallery -->
						<section id="galleries">

							<!-- Photo Galleries -->
							<div class="gallery" style="width: 80%; left: 10%;">
								<table border="1">
									<tr>
										<td style="font-size: 0.7em;">
											작성자: <c:out value="${viewBoard.writer}"/><br>
											작성 날짜: <c:out value="${viewBoard.writedate}"/>
										</td>
									</tr>
									<tr>
										<th>
											<h3 style="margin: 0 0 0 0 !important;"><c:out value="${viewBoard.title}"/></h3>
										</th>
										<c:out value="# ${viewBoard.bdnum}"/>
									</tr>
									<tr>
										<td style="padding: 2em 1em 5em 1em;">
											<c:out value="${viewBoard.content}"/>
										</td>
									</tr>
							
									<c:set var="isUser" value="${viewBoard.isuser}" />
								</table>
								<div style="margin: 1em 5em 0 5em;">
								<!-- 게스트글 삭제 -->
								<c:if test="${isUser eq 0}">
									<form action="delete" id="delGuestForm" method="post" style="margin: 0 auto;">
										PW: <input type="password" id="pw" name="pw">
										<input type="hidden" id="am_bdnum" name="bdnum">
										<button type="button" id="delGuest">삭제</button>
										<button type="button" onclick="location.href='${pageContext.request.contextPath}'" style="float: right;">홈으로</button>
									</form>
								</c:if>
								<!-- 유저글 삭제 -->
								<c:if test="${isUser eq 1}">
									<form action="deleteUser" id="delUserForm" method="post">
										<c:set var="writer" value="${viewBoard.writer}" />
										<c:set var="currentUser" value="${writer}"/>
										
										<c:if test="${currentUser eq writer}">
											<input type="hidden" id="writer" name="writer">
											<input type="hidden" id="bdnum" name="bdnum">
											<button type="button" id="delUser">삭제</button>
										</c:if>
										<button type="button" onclick="location.href='${pageContext.request.contextPath}'" style="float: right;">홈으로</button>
									</form>
								</c:if>
								<br>
								</div>
							</div>
						</section>
						
					
						
					<!-- Footer -->
						<footer id="footer">
							<div class="copyright">
								&copy; Code by My git: <a href="https://github.com/jcho5078/Blog">Git</a>. Images: <a href="https://unsplash.com/">Unsplash</a>.
							</div>
						</footer>
				</section>
		</div>
	
	<!-- Scripts -->
	<script>
		$('#delGuest').click(function(e){
			var pw = $('#pw').val();
			var bdnum = ${bdnum};
			
			$('#am_bdnum').val(bdnum);
			
			if(pw != "${viewBoard.pw}"){
				alert('비밀번호가 맞지 않습니다.');
			}else {
				$('#delGuestForm').submit();
			}
		});
		
		$('#delUser').click(function(e){
			var writer = "${writer}";
			var bdnum = ${bdnum};
			
			$('#writer').val(writer);
			$('#bdnum').val(bdnum);
			
			$('#delUserForm').submit();
		});
	</script>
</body>
</html>