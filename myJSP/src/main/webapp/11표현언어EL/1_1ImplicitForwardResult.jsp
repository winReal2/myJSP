<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>각 영역에 저장된 속성읽기</h2>
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
		<li>${scopeValue }</li> <!-- 아무것도 지정안했을 땐 가장 가까운 페이지영역이 출력 (페이지가 없으면 리퀘스트영역) -->
	</ul>
</body>
</html>