<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>

	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<!-- method를 지정하지 않은 경우는 모두 get방식으로 호출됩니다.
		 아무런 설정도 하지 않으면 기본이 get 방식 -->
	<!-- 404 : 페이지를 찾을 수 없음 
		 서버에 파일이 없는 경우, 또는 경로가 일치하지 않는 경우
		 URL경로를 확인해봐야함!!!!!!!!(현재나의 위치가 내장객체안에 있어)-->
	 <!-- requestWebInfo.jsp를 서버에 요청 / 파라메터들 eng=hello&han=안녕 -->
	<p><a href="requestWebInfo.jsp?eng=hello&han=안녕">GET방식 요청</a></p>
	
	<!-- 폼객체를 만들고 파라메터를 넘기는 방법 -->
	<form action="requestWebInfo.jsp" method="post">
		영어 : <input type="text" name="eng" value="Bye"><br>
		한글 : <input type="text" name="han" value="잘 가"><br>
		<input type="submit" value="post전송">
	</form>
	
	<h1>2. 클라이언트의 요청 매개변수 읽기</h1>
	<form method="post" action="requestParameter.jsp">
	<!-- 다양한 input태그를 사용하여 서버에 값을 전달해봅시다! -->
		아이디 : 
        <input type='text' name='id' value='' ><br>
		성별 : 
        <input type='radio' name='gender' value='M' checked="checked" >남자
        <input type='radio' name='gender' value='F'>여자<br><br>
		관심사항 : 
        <input type='checkbox' name='favo' value='baseball' checked> 야구
        <input type='checkbox' name='favo' value='football'> 축구
        <input type='checkbox' name='favo' value='basketball'> 농구<br><br>
        자기소개 : 
        <textarea name="intro" cols="30" rows="4"></textarea><br>
        <input type= "submit" value="전송하기">
	</form>
	
	<!-- requestMain 요청(서버에 요청하는 방법) / 응답은 requestParameter에서! -->
</body>
</html>