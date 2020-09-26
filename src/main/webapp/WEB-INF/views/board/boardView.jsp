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
<title>${viewBoard.title}</title>
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
					   		<button type="button" value="유저정보 확인" onclick="location.href='${pageContext.request.contextPath}/login'">로그인</button>
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
											<c:set var="isUser" value="${viewBoard.isuser}" />
											<c:if test="${isUser eq 0}">
												<div>
													작성자: <c:out value="${viewBoard.writer}"/><br>
												</div>
												작성 날짜: <c:out value="${viewBoard.writedate}"/>
											</c:if>
											<c:if test="${isUser eq 1}">
												<div style="color: blue;">
													작성자: <c:out value="${viewBoard.writer}"/><br>
												</div>
												작성 날짜: <c:out value="${viewBoard.writedate}"/>
											</c:if>
										</td>
									</tr>
									<tr>
										<td style="font-size: 0.6em;">
											조회수: <c:out value="${viewBoard.viewCount}"/>
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
								
								<!-- 댓글 리스트 출력 -->
								<div>
									<hr>
									<h3>댓글 <c:out value="${countComm}"/>개</h3>
									<c:forEach var="comment" items="${CommentList}">
										<form action="deleteComm" id="each_boardComment">
											<p style="font-size: 0.5em;"><c:out value="# ${comment.no}"/></p>
											<div>
												<div>
													<c:if test="${comment.isUser eq 0}">
														작성자: <h5 id="writer_commlist_guest" style="display: inline;"><c:out value="${comment.writer}"/></h5>
													</c:if>
													<c:if test="${comment.isUser eq 1}">
														작성자: <h5 id="writer_commlist_user" style="display: inline; color: blue;"><c:out value="${comment.writer}"/></h5>
													</c:if>
												</div>
												<p id="boardComment_list"><c:out value="${comment.boardComment}"/></p>
												
												<c:if test="${comment.isUser eq 0}">
													<input type="password" id="pw_bdnumComm" placeholder="pw" style="width: 20em;">
												</c:if>
												<button type="button" id="delete_boardComment_submit">댓글 삭제</button>
											</div>
											
											<input type="hidden" name="writer" id="boardComment_writer">
											<input type="hidden" name="bdnum" id="bdnumComm">
											<input type="hidden" name="boardComment" id="input_comm_list">
											<input type="hidden" name="pw" id="pw_Comm_list">
											
										</form>
										<hr>
									</c:forEach>
								</div>
								
								<!-- 댓글 입력Form -->
								<form action="insertComm" id="insertComm" method="post">
									<div>
										<div>
											<c:set var="currentUser" value="${writer}"/>
											<!-- 유저 -->
											<c:if test="${currentUser ne null}">
												작성자: 
												<h5 id="writer_Comm_get_User" style="color: blue;">
													<c:out value="${writer}"/>
												</h5>
											</c:if>
											
											<!-- 게스트 -->
											<c:if test="${currentUser eq null}">
												작성자: 
												<h5 id="writer_Comm_get">
													<input type="text" id="writer_Comm_notuser" placeholder="name" style="width: 20em;">
												</h5>
												<input type="password" id="pw_Comm_notuser" placeholder="pw" style="width: 20em;"><br>
											</c:if>
											<input type="hidden" name="bdnum" id="bdnum_Comm">
											<input type="hidden" name="writer" id="writer_Comm">
											<input type="hidden" name="isUser" id="isUser_Comm">
											<input type="hidden" name="pw" id="pw_Comm">
											
										</div>
										<textarea name="boardComment" id="boardComment" rows="3" placeholder="댓글 작성"></textarea>
										<button type="button" id="comment_submit">댓글 작성</button>
									</div>
								</form>
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
		
		$('#comment_submit').click(function(e){
			
			var bdnum = ${bdnum};
			var pw = 0;
			
			if($('#writer_Comm_get_User').val() == null){
				var writer = $('#writer_Comm_notuser').val();
				$('#isUser_Comm').val(0);
				pw = $('#pw_Comm_notuser').val();
			}else{
				var writer = $('#writer_Comm_get_User').text();
				$('#isUser_Comm').val(1);
			}
			
			$('#writer_Comm').val(writer);
			$('#bdnum_Comm').val(bdnum);
			$('#pw_Comm').val(pw);
			
			var wr = $('#writer_Comm').val();
			var bn = $('#bdnum_Comm').val();
			var con = $('#boardComment').val();
			var is = $('#isUser_Comm').val();
			
			console.log(wr);
			console.log(bn);
			console.log(con);
			console.log(is);
			console.log(pw);
			
			$('#insertComm').submit();
		});
		
		$('#delete_boardComment_submit').click(function(e){
			
			
			var bdnum = ${bdnum};
			
			$('#bdnumComm').val(bdnum);
			
			if($('#writer_Comm_get_User').val() == null){
				var writer = $('#writer_commlist_guest').text();
				pw = $('#pw_Comm_notuser').val();
			}else{
				var writer = $('#writer_commlist_user').text();
			}
			
			$('#boardComment_writer').val(writer);
			
			var comment = $('#boardComment_list').val();
			
			$('#input_comm_list').val(comment);
			
			var pw = $('#pw_bdnumComm').val();
			
			if(pw == aa){
				
				console.log('비밀번호 일치!');
				$('#pw_Comm_list').val(pw);
				
			}else{
				
				console.log('비밀번호 불일치!');
				$('#pw_Comm_list').val(0);
			}
			
			$('#deleteComm').submit();
		});
		
	</script>
</body>
</html>