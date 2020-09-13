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
<%
	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

	CustomUserDetails user = (CustomUserDetails)principal;

	if(principal != null) {
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
		<!-- 유저글 삭제 -->
		<c:if test="">
		
		</c:if>
	</table>
</body>
</html>