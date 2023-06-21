<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>JSTL의 if 태그로 짝수 / 홀수 판단하기</h4>
	<!-- 상단에 태그라이브러리 추가해줘야 오류나지 않음!!(노란 밑줄 경고문) -->
	<c:set var="number" value="101"/>
	<!-- 
		test   : if문에서 사용할 조건(참,거짓) 지정 (표현언어 사용가능)
	 	var	   : 조건의 결과를 저장할 변수명
	 	scope  : 변수(var)가 저장될 영역
	 -->
	<!-- number를 2로 나눈 나머지가 0과 같으면 true, 아니면 false -->
	<c:if test="${number mod 2 eq 0}" var="result">
		<!-- 조건이 참인 경우 실행됩니다. -->
		${number }는 짝수입니다. <br>	
	</c:if>
	result : ${result }
	<c:if test="${not result }" var="result2">
		${number }는 홀수 입니다.<br>
	</c:if>	
	result2 : ${result2 }
	
	
	<h4>문자열 비교와 else 구문 흉내내기</h4>	
	<!-- 문자열 변수 선언 -->
	<c:set var="str" value="JSP"/>
	<c:if test="${str eq 'Java' }" var="result3">
		문자열은 Java입니다!<br>
	</c:if>
	<c:if test="${not result3 }" var="result4">
		'Java'가 아닙니다!<br>
	</c:if>
	result5 : ${result4 }
	
	
	<h4>조건식 주의사항</h4>
	<!-- 표현언어(EL)를 사용하지 않은 경우 -->
	<c:if test="100" var="result4">
		일반값을 입력 : false<br>
	</c:if>
	result4 : ${result4 }<br>
	
	<c:if test="tRuE" var= "result5">
		대소문자 구분없이 ""tRuE" 인 경우 true<br> 
	</c:if>
	result5 : ${result5 }<br>	
	
	<c:if test="${true } " var="result6">
		EL에 공백(쌍따옴표 옆 공백)이 삽입된 경우 false<br>
	</c:if>
	result6 : ${result6 }<br>
	
	
</body>
</html>











