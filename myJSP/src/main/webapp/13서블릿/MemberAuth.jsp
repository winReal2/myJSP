<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>MVC패턴으로 회원 인증하기</h2>
	
	<p>${authMessage }</p>
	<!-- 
	uri매핑해줘야함 /13서블릿/MemberAuth.mvc
	서블릿매핑시에는 컨텍스트루트(/myJSP) 빠져있음 => 쉽게해주는게 ./ (13서블릿까지 가고 싶으면 ./)
	
	MemberAuth.java가서 파라메터값 소문자 id, pw로 바꿔줘야한다
	id값은 db에 있는 값이어야 member가 널이 안나온다
	(Cannot invoke "dto.Member.getName()" because "member" is null)
	-->
	<a href="./MemberAuth.mvc?id=MUSTHAVE&pw=1234">
	test로그인
	</a>
</body>
</html>