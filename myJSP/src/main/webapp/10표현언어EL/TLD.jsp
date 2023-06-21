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
	객체를 먼저 설정파일에 등록한다고 생각하면됨

	TLD (Tag Library Descriptor)
		JSP에서 사용되는 커스텀 태그나 JSTL의 태그들에 대한 설정파일
		WEB-INF 폴더에 하위에 위치, 작성해야 인식가능함!!
	
	prefix : EL에서 사용할 접두어
	uri : tld 파일의 경로
 -->
 <%@ taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>
 
 <h3>TLD파일에 등록 후 정적 메서드 호출하기</h3>
 	<ul>
	 	<li>${mytag:isNumber("100") } </li>
	 	<li>${mytag:isNumber("백") } </li>
 	</ul>
 
 
 
 
 makeCookie
 
</body>
</html>