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
</head>
<h2>글 보기</h2>
<body>
	<table border="1">
		<tr>
			<c:out value="${viewBoard.bdnum}"/>
			<th>
				<c:out value="${viewBoard.title}"/>
			</th>
		</tr>
		<tr>
			<td>
				작성자: <c:out value="${viewBoard.writer}"/><br>
				작성 날짜: <c:out value="${viewBoard.writedate}"/>
			</td>
		</tr>
		<tr>
			<td><c:out value="${viewBoard.content}"/></td>
		</tr>

		<c:set var="isUser" value="${viewBoard.isuser}" />
	</table>
	
	<!-- 게스트글 삭제 -->
	<c:if test="${isUser eq 0}">
		<form action="delete" id="delGuestForm" method="post">
			<input type="password" id="pw" name="pw">
			<button type="button" id="delGuest">삭제</button>
		</form>
	</c:if>
	<!-- 유저글 삭제 -->
	<c:if test="${isUser eq 1}">
		<form action="deleteUser" id="delUserForm" method="post">
			<c:set var="writer" value="${viewBoard.writer}" />
			<c:set var="currentUser" value="${writer}"/>
			
			<c:if test="${currentUser eq writer}">
				<input type="hidden" id="writer" name="writer">
				<button type="button" id="delUser">삭제</button>
			</c:if>
		</form>
	</c:if>
	
	<!-- Scripts -->
	<script>
		$('#delGuest').click(function(e){
			var pw = $('#pw').val();
			
			if(pw != "${viewBoard.pw}"){
				alert('비밀번호가 맞지 않습니다.');
			}else {
				$('#delGuestForm').submit();
			}
		});
		
		$('#delUser').click(function(e){
			var writer = "${writer}";
			$('#writer').val(writer);
			
			$('#delUserForm').submit();
		});
	</script>
</body>
</html>