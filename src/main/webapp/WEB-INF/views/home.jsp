<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Snapshot by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="resources/assets/css/main.css?after" />
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
								<h1>Hey, I'm Snapshot</h1>
								<p>A fully responsive gallery template by TEMPLATED</p>
								<ul class="actions">
									<li><a href="#galleries" class="button alt scrolly big">Continue</a></li>
								</ul>
							</div>
						</section>

					<!-- Gallery -->
						<section id="galleries">

							<!-- Photo Galleries -->
								<div class="gallery">
									<header class="special">
										<h2>What's New</h2>

									</header>
									<div class="content">
										<!-- 게시판 출력 -->
										<c:if test="">
											<c:forEach var="list" items="${BoardList}" begin="${BoardList}">
												<div class="media">
													
												</div>
											</c:forEach>
										</c:if>
										<div class="media">
											<a href="resources/images/fulls/01.jpg"><img src="resources/images/thumbs/01.jpg" alt="" title="This right here is a caption." /></a>
										</div>
										
									</div>
									<footer>
										<a href="gallery.html" class="button big">Full Gallery</a>
									</footer>
								</div>
						</section>
					
					<!-- Board -->
					<form action="#" method="post">
					<!-- Contact -->
						<section id="contact">
							<!-- Social -->
								<div class="social column">
									<h3>About Me</h3>
									<p>Mus sed interdum nunc dictum rutrum scelerisque erat a parturient condimentum potenti dapibus vestibulum condimentum per tristique porta. Torquent a ut consectetur a vel ullamcorper a commodo a mattis ipsum class quam sed eros vestibulum quisque a eu nulla scelerisque a elementum vestibulum.</p>
									<p>Aliquet dolor ultricies sem rhoncus dolor ullamcorper pharetra dis condimentum ullamcorper rutrum vehicula id nisi vel aptent orci litora hendrerit penatibus erat ad sit. In a semper velit eleifend a viverra adipiscing a phasellus urna praesent parturient integer ultrices montes parturient suscipit posuere quis aenean. Parturient euismod ultricies commodo arcu elementum suspendisse id dictumst at ut vestibulum conubia quisque a himenaeos dictum proin dis purus integer mollis parturient eros scelerisque dis libero parturient magnis.</p>
									<h3>Follow Me</h3>
									<ul class="icons">
										<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
									</ul>
								</div>

							<!-- Form -->
								<div class="column">
									<h3>Write Something</h3>
									
										<div class="field half first">
											<sec:authorize access="isAnonymous()">
												<label for="name">Name</label>
												<input name="name" id="name" type="text" placeholder="Name">
											</sec:authorize>
											
											<sec:authorize access="isAuthenticated()">
												<label for="username">Name</label>
												<h4 id="username" name="username"><c:out value="${name}"/></h4>
												<input type="hidden" id="name_user" name="name_user">
											</sec:authorize>
										</div>
										
										<sec:authorize access="isAnonymous()">
											<div class="field half">
												<label for="pw">Password</label>
												<input name="pw" id="pw" type="password" placeholder="Password">
											</div>
										</sec:authorize>
										
										<div class="field">
											<label for="message">Message</label>
											<textarea name="message" id="message" rows="6" placeholder="Message"></textarea>
										</div>
										<ul class="actions">
											<li><input value="Send Message" class="button" type="submit"></li>
										</ul>
		
								</div>

						</section>
						</form>
						
					<!-- Footer -->
						<footer id="footer">
							<div class="copyright">
								&copy; Untitled Design: <a href="https://templated.co/">TEMPLATED</a>. Images: <a href="https://unsplash.com/">Unsplash</a>.
							</div>
						</footer>
				</section>
		</div>

		<!-- Scripts -->
			<script src="resources/assets/js/jquery.min.js"></script>
			<script src="resources/assets/js/jquery.poptrox.min.js"></script>
			<script src="resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="resources/assets/js/skel.min.js"></script>
			<script src="resources/assets/js/util.js"></script>
			<script src="resources/assets/js/main.js"></script>
			<script>
				$('#message').keyup(function (e){
				    var content = $(this).val();
	
				    if (content.length > 2800){
				        alert("최대 2800자까지 입력 가능합니다.");
				        $(this).val(content.substring(0, 2800));
				    }
				});
			</script>

	</body>
</html>