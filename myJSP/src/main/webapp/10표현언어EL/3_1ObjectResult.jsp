<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>영역을 통해 전달된 객체 읽기</h2>
	<%
	/*
		표현언어(EL)를 이용하면 형변환이 필요없이 파라메터를 읽어올 수 있다.
		별도의 null처리 없어도 오류가 발생하지 않는다.
		( 현재페이지 리로드시 오류발생 X )
		객체를 사용하기 위해서 임포트만 해주면 된다!
	*/
	%>
	<!-- 출력하려면 이름만 알고 있으면 됨 
		페이지 영역이 없어서 리퀘스트영역으로 찾아감
		포워딩된 페이지이기 때문에 3Objectparams에서 실행해줘야함
	-->
	<ul>
		<li>Person 객체
			<p>아이디 : ${personObj.id }, 이름 : ${personObj.name }</p>
		</li>
		<li>String 객체
			<p>${requestScope.stringObj }</p>
		</li>
		<li>Integer 객체
			<p>${integerObj }</p>
		</li>
	</ul>
	
	
	<h2>매개변수로 전달된 값 읽기(파라메터로 넘어온 값 읽기)</h2>
	<ul>
		<li>${param.firstNum }</li>
		<li>${param.secondNum }</li>
		<!-- 중괄호 안에서 연산 가능 -->
		<li>${param.firstNum + param.secondNum}</li>
		<li>${param.firstNum} + ${param.secondNum}</li>
		<li>${param['firstNum'] }</li>
		<li>${param["secondNum"] }</li>
	</ul>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>