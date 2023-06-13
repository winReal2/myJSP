<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<!-- 로그아웃하는 2가지 방법 -->
<%
	//방법 1. 회원인증정보 속성 삭제
	session.removeAttribute("UserId");
	session.removeAttribute("member");
	
	//방법 2. 세션무효화
	session.invalidate();
	
	//페이지 이동
	response.sendRedirect("LoginForm.jsp");
	
%>	
	
	
	
</body>
</html>