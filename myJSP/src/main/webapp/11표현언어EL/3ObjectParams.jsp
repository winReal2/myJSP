<%@page import="dto.Member"%>
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
		//request영역에 객체생성 후 forward된 페이지에서 출력
		request.setAttribute("personObj", new Member("test","","하니", "2023-06-19"));
		request.setAttribute("stringObj", "문자열");
		request.setAttribute("integerObj", new Integer(99));
											// 웨퍼클래스. 인티저안에 넣어서 객체로 변환해줌
	%>
	<h2>객체 매개변수</h2>
	<jsp:forward page = "ObjectResult.jsp">
		<jsp:param value="10" name="firstNum"/>
		<jsp:param value="20" name="secondNum"/>
	</jsp:forward>
	<!-- </jsp:forward> 줄바꿈해서 출력하면 오류남! -->
	
</body>
</html>