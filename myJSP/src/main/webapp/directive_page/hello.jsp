<!-- 

jsp : 동적인 페이지를 작성하기 위해서 java라는 언어를 사용!


	지시어(Directive)
	jsp페이지를 servlet코드로 변환하는데 필요한 정보
	
	어떤식으로 변환이되는가
	
	지시어의 종류
		page 	: JSP페이지에 대한 정보를 설정 
		include : 외부파일을 현재 JSP페이지에 포함(로드)시킴
		taglib 	: 표현언어에서 사용할 자바클래스나 JSTL을 선언

	작성방법
	< %@ 지시어종류 속성1="값1",... (속성 나열)%>	

	자동생성될 때 utf-8로! (요즘은 EUC-KR 안씀)
	기본인코딩을 바꿔주고 싶음
	jsp파일 생성시 기본인코딩을 변경하는 방법
	window > preferences > JSP Files 선택 > encoding > utf-8 선택
 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello</h1>
</body>
</html>