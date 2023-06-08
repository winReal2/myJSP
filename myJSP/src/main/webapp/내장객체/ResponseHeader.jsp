<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Collection" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//응답헤더에 정보추가
	/*
	response객체는 응답헤더에 정보를 추가하는 기능을 제공
		add...() : 응답헤더 추가
		set...() : 응답헤더 수정
	*/
	String add_date = request.getParameter("add_date");
	String add_int = request.getParameter("add_int");
	String add_str = request.getParameter("add_str");
	

	//getParameter()는 String타입을 반환하므로 숫자나 날짜 타입인 경우 형변환이 필요!
	response.addHeader("str", add_str);
	response.addIntHeader("int", Integer.parseInt(add_int));
	
	/*
		문자열을 날짜 형식으로 변환
		형변환을 위해 SimpleDateFormat 사용
		2021-10-25 09:00
		yyyy-MM-dd HH:mm
		
		SimpleDateFormat라는 객체를 이용해 형식을 지정
		그 형식을 이용해 문자열을 날짜형식으로 변환
	*/
	SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	response.addDateHeader("date", s.parse(add_date).getTime());
	
	
	Collection<String> headerNames = response.getHeaderNames();
	//반복문을 이용해서 헤더값 가져옴
	for(String hName : headerNames){
		//헤더에서 어떤 요소를 가지고 올지 적어줌
		String hValue = response.getHeader(hName);
	%>
		<li><%=hName %> : <%=hValue %></li>
	
	<%
	}
%>
</body>
</html>