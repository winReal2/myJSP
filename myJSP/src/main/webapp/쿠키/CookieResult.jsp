<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키값 출력하기</title>
</head>
<body>

	<h2>쿠키값 확인하기</h2>
	<p>처음 접속시 저장된 쿠키가 없는 경우 빈 페이지가 출력될 수 있습니다</p>
<%
	//request가 담고 있음(요청) / getCookies에 마우스올려 타입확인해서 변수에 담아줌
	Cookie[] cookies = request.getCookies();
	
	//반복문이용해서 쿠키값 확인
	//처음에는 비어있을 수 있어서 객체엔 무조건 null체크
	if(cookies != null){
		//배열에 들어있는 쿠키의 값을 하나씩 꺼내와서 쿠키(변수명cookie)에 저장
		for(Cookie cookie : cookies){
			//출력하려면 변수에 담아줌
			String cookieName = cookie.getName();
			String cookieValue = cookie.getValue();
		
			out.print("쿠키명 : " + cookieName + "<br>" 
					+ "쿠키값 : " + cookieValue + "<br><br>");
		}
	}
%>


</body>
</html>