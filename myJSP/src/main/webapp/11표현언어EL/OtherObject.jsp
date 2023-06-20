<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		쿠키, 헤더값을 읽을 수 있는 내장객체를 제공
		(내장객체가 가지고 있는 값도 출력할 수 있다)
		
		cookie : 쿠키를 읽을 때 사용
		header : 헤더정보를 읽을 때 사용
		initParam : web.xml에 설정한 컨텍스트 초기화 매개변수를 읽을 때 사용
		pageContext : JSP의 pageContext객체와 동일한 역할
	 -->
	 
	 <%
		 //쿠키를 읽기위해 쿠키생성
		 CookieManager.makeCookie(response, "ELCookie", "EL좋아요", 10);
	 %>
	 
	 <h3>쿠키 값 읽기</h3>
	 <!-- 첫번쨰화면, 첫번쨰 요청에서는 쿠키값 안나오고 두번째 요청에서 값이 나옴 (원리를 생각)-->
	 <li>${cookie.ELCookie.value }</li>
	 
	 <h3>HTTP 헤더 읽기</h3>
	 <ul>
	 	<li>host : ${header.host }</li>
	 	<li>user-agent : ${header['user-agent'] }</li>
	 	<li>cookie : ${header.cookie }</li>
	 </ul>
	 
	 <h3>컨텍스트 초기화 매개변수</h3>
	 <li>${initParam.INIT_PARAM }</li>
	 <li>${initParam.OracleDriver }</li>
	 <li>${initParam.OracleUrl }</li>
	 
	 <h3>컨텍스트 루트 경로 읽기</h3>
	 <!-- Servers > 모듈 > path -->
	 <li>${pageContext.request.contextPath }</li>
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
</body>
</html>