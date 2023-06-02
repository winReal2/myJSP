<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp %>
<!-- 내가 보내려는 파일이 1kb넘으면 오류발생 (Error : JSP버퍼 오버플로우
안나게 하려면 버퍼크기를 충분히 크게 지정하던가 autoFlush속성을 true로 설정하면 해결-->
<%@ page buffer=10kb autoFlush="true" %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	버퍼(buffer)
	응답결과를 웹 브라우저로 즉시 전송하지 않고, 
	출력할 내용을 버퍼에 저장해 두었다가 일정량이 차면 클라이언트로 전송
	
	(CPU(가장빠름)나 메모리에 비해 IO(입출력) 속도가 느리므로 응답결과를 버퍼에 저장해 두었다가 전송) 
	(한번에 모아서 출력!)
	buffer="none"으로 지정시 포워드, 에러페이지 등의 기능을 사용하지 못함.
	크기를 줄일 경우 jsp의 기능을 온전히 사용하지 못하므로 값을 변경하는 경우 거의 없음.
	
	버퍼를 사용하는 이유!
	- 성능 향상(속도가 빨라질 수 있다)
	- JSP 실행 도중 버퍼를 비우고 새로운 내용을 전송 가능 
	  (포워드, 리다이렉트에 관한 이야기! 요청을 하면 컨트롤러를 통해 다른페이지를 보여주고 
	- 버퍼가 다 차기 전에, 응답헤더를 변경 가능 
	
	autoFlush (버퍼가 모두채워졌을떄 처리방법)
	true (기본값) : 버퍼가 차면, 자동 전송
	false : 버퍼가 차면, 예외(Exception) 발생으로 실행 중지 	
 -->
 <%
 	for(int i = 0; i<100; i++){
 		out.println("abcde12345");
 	}
 
 		out.println(out.getBufferSize());
 		out.println(out.isAutoFlush());
 %>
</body>
</html>