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
	//사용자의 요청을 담고 있는 객체
	// getParameter : 사용자가 우리에게 넘겨준 파라미터값을 읽어들어오는것
	//오류 : String 타입을 integer활용해 int 타입으로 변경
	int age = Integer.parseInt(request.getParameter("age"));
	
	out.print("당신의 나이는 " + age + " 입니다.");

%>
</body>
</html>