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
	//각 영역에 저장!
	pageContext.setAttribute("scopeValue", "페이지 영역");
	request.setAttribute("scopeValue", "리퀘스트 영역");
	session.setAttribute("scopeValue", "세션 영역");
	application.setAttribute("scopeValue", "어플리케이션 영역");

%>

	<h2>각 영역에 저장된 속성읽기(출력)</h2>
	<ul>
		<li>page영역 : 
			${pageScope.scopeValue }
		</li>
		<li>request영역 : 
			${requestScope.scopeValue }
		</li>
		<li>session영역 : 
			${sessionScope.scopeValue }
		</li>
		<li>application영역 : 
			${applicationScope.scopeValue }
		</li>
	</ul>
	
	
	<h2>영역 지정없이 속성 읽기</h2>
	<ul>
		<li>${scopeValue }</li> <!-- 아무것도 지정안했을 땐 가장 가까운 페이지영역이 출력 -->
	</ul>
	
	<!-- 포워드는 리퀘스트영역만 공유 페이지영역만 공유하지 않음 
		포워드(페이지전환)는 기존출력은 무시되고 페이지를 이동합니다.
		페이지가 이동되면 값이 저장되지 않음!
	-->
	<jsp:forward page="ImplicitForwardResult.jsp"></jsp:forward>
</body>
</html>