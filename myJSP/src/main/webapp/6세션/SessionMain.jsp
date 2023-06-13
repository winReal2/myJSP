<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	[Session]
	클라이언트의 상태 정보를 저장하고, 로그인 기능구현에 사용
	
	http통신은 요청과 응답으로 구성되어 있습니다.
	클라이언트에서 서버로 페이지를 요청을 하면 서버는 페이지를 응답해주고 
	통신은 종료 되는것이죠.
	
	서버는 어떻게 로그인 상태를 유지 시켜 줄수 있을까요?  
	
	클라이언트에서 웹브라우저로 서버에 최초로 접근시 
		-> 웹서버는 웹브라우저에게 세션아이디를 발급 
		-> 세션아이디는 쿠키로 생성되어 응답객체의 쿠키에 담겨 클라이언트로 전송
			개발자도구의 쿠키를 확인해 보면 JSESESSIONID라는 값이 입력 되어 있습니다.
			여기 저장된 값이 세션아이디 입니다.
	(웹브라우져를 새로 열고 서버에 접근시 쿠키에 저장된 세션ID값이 변경된것을 확인 할 수 있습니다.)
==========================================================================
	[세션의 유지시간]
	기본값 (30분, 1800초)
	유지시간이 만료되기 전 새로운 요청이 들어오면 유지시간 연장
	클라이언트가 유지시간 내 요청이 없는 경우 해당 세션은 서버에서 제거
	
	클라이언트에서 JSESESSION를 제거할 경우 서버에서는 새로운 세션아이디 발급
	쿠키값을 요청헤더에 담아감(그런데 헤더에 전송이 안되어서 새로 발급)
	
	
	[세션 유지시간 설정하는 2가지 방법]
	web.xml을 이용하는 방법 (분 단위) / 직접 setMaxInactiveInterval을 이용한 방법 (초 단위)
 -->

<%
	session.setMaxInactiveInterval(100);	//유지시간 100초

	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); // 날짜 표시 형식
	
	long creationTime = session.getCreationTime();  // 최초 요청(세션 생성) 시간을 알수 있다. 반환타입은 LONG
	// format의 반환타입 String  (long타입을 date타입으로 변환 하는게 new Date())
	String creationTimeStr = sdf.format(new Date(creationTime));   
	
	long lastTime = session.getLastAccessedTime();   // 마지막 요청 시각
	String lastTimeStr = sdf.format(new Date(lastTime));
%>

<h2>Session 설정 확인</h2>
<ul>
	<li>최초 요청 시각 : <%=creationTimeStr %></li>
	<li>마지막 요청 시각 : <%=lastTimeStr %></li>
	<li>세션 아이디 : <%=session.getId() %></li>  <!--세션 아이디는 응답할때 쿠키에 담아보내준다 -->
	<li>세션 유지시간 : <%=session.getMaxInactiveInterval() %> </li>
</ul>


</body>
</html>