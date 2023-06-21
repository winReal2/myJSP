<%@page import="utils.CookieManager"%>
<%@page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	MyELClass myClass = new MyELClass();
	pageContext.setAttribute("myClass", myClass);
	//pageContext.setAttribute("response", response);
%>
	<h3>영역에 저장후 메서드 호출하기</h3>
	001129-3000000 => ${myClass.getGender("001129-3000000")}<br>
	001129-4000000 => ${myClass.getGender("001129-4000000")}<br>

	<h3>정적메서드 호출하기</h3>
	${MyELClass.showGugudan(7)}
	
	<h3>정적메서드 호출하기 - 쿠키생성하기</h3>
	<!-- response도 저장해줘야 함 / 쿠키값은 새로고침하면 출력됨! 이유는 생각해보기 -->
	${CookieManager.makeCookie(response, "ELCookie", "EL좋아요", 10) }<br>
	${cookie.ELCookie.value }

	<h3>메서드 호출하기</h3>
	<!-- 로직에 대한 구현은 백단(서버단)에서! jsp에선 화면출력용으로만 사용 -->
	${"123-123".replace("-", "") }

</body>
</html>