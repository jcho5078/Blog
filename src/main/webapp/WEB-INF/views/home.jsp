<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Snapshot by TEMPLATED</title>
		<meta charset="utf-8" />
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
								<div class="gallery">
									<header class="special">
										<h2>New Boards</h2>

									</header>
									
									
									<!-- 게시판 출력 -->
									<div class="content">
										<c:forEach var="list" items="${BoardList}">
											<div class="media" style="border: 0.1em dashed #bcbcbc !important;">
												<div style="margin: 0 0 0.1em 0 !important;">
													<c:if test="${list.isuser eq 1}">
														<h5 align="center" style="bottom: 0; left: 40%; margin: 0 0 0 0 !important; color: blue;">
															<c:out value="${list.writer}"/>
														</h5>
													</c:if>
													<c:if test="${list.isuser eq 0}">
														<h5 align="center" style="bottom: 0; left: 40%; margin: 0 0 0 0 !important;">
															<c:out value="${list.writer}"/>
														</h5>
													</c:if>
												</div>
												<div>
													<button onclick="location.href='board/readboard?bdnum=${list.bdnum}'" style="background: none !important;">
														<img src="resources/images/thumbs/03.jpg" alt="" title="This right here is a caption." />
													</button>
												</div>
												<div style="margin: 0.5em 0 0 0 !important;">
													<h5 align="center" style="bottom: 0; left: 40%; margin: 0 0 0 0 !important;">
														${list.title}
													</h5>
												</div>
											</div>
										</c:forEach>
									
									</div>
									
									<footer>
										<!-- 페이지 구현 -->
										<div>
											<ul>
												<!-- 이전 -->
												<c:if test="${BoardPage.prevPage}">
											    	<li style="list-style: none; float: left; padding: 0.5em;">
											    		<a href="${BoardPage.uriMaker(BoardPage.startPage - 1)}">이전</a>
											    	</li>
											    </c:if> 
												<!-- 페이지 연달아 출력 -->
												<c:forEach begin="${BoardPage.startPage}" end="${BoardPage.endPage}" var="page">
													<li style="list-style: none; float: left; padding: 0.5em;">
														<a href="${BoardPage.uriMaker(page)}">${page}</a>
													</li>
												</c:forEach>
												<!-- 다음 -->
												<c:if test="${BoardPage.nextPage}">
											    	<li style="list-style: none; float: left; padding: 0.5em;">
											    		<a href="${BoardPage.uriMaker(BoardPage.page + 1)}">다음</a>
											    	</li>
											    </c:if> 
											</ul>
										</div>
									
									
										<a href="${pageContext.request.contextPath}/gallery" class="button big">Best Shots</a>
									</footer>
								</div>
						</section>
						
					<!-- Board Form -->
					<form id="boardForm" action="board/insert" method="post">
					
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

								<div class="column">
									<h3>Write Something</h3>
									
										<div class="field half first">
											<sec:authorize access="isAnonymous()">
												<label  for="pw">Name</label>
												<input id="am_writer" name="am_writer" type="text" placeholder="Name">
												
												<label for="am_pw">Password</label>
												<input name="am_pw" id="anonymous_pw" type="password" placeholder="Password">
	
											</sec:authorize>
											
											<sec:authorize access="isAuthenticated()">
												<label>Name</label>
												<h4 id="username" name="username"><c:out value="${name}"/></h4>
												<input type="hidden" id="writer" name="writer">
											</sec:authorize>
										</div>
										
										<div class="field">
											<label for="title">Title</label>
											<input type="text" name="title" id="title" placeholder="Title"></textarea>
										</div>
										
										<div class="field">
											<label for="message">Content</label>
											<textarea name="content" id="content" rows="6" placeholder="Content"></textarea>
										</div>
										<ul class="actions">
											<li>
												<button type="button" id="submitBtn">작성 완료</button>
											</li>
										</ul>
		
								</div>

						</section>
						</form>
						
					<!-- Footer -->
						<footer id="footer">
							<div class="copyright">
								&copy; Code by My git: <a href="https://github.com/jcho5078/Blog">Git</a>. Images: <a href="https://unsplash.com/">Unsplash</a>.
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
				$('#content').keyup(function (e){
				    var content = $(this).val();
	
				    if (content.length > 2800){
				        alert("최대 2800자까지 입력 가능합니다.");
				        $(this).val(content.substring(0, 2800));
				    }
				});
				
				$('#submitBtn').click(function(e) {
					
					var title = $('#title').val();
					var content = $('#content').val();
					var writer = $('#username').text();
					
					$('#writer').val(writer);
					
					if(title == ""){
						alert('제목을 입력하시오');
					}
					if(content == ""){
						alert('내용을 입력하시오');
					}
					
					if(title != "" && content != ""){
						$('#boardForm').submit();
					}
				});
			</script>

	</body>
</html>