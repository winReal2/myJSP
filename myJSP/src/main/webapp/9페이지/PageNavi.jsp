<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
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
<!-- 
	[PageDto객체]
	페이지 블럭을 생성하는 역할을 함 
		  가지고 있는 정보들
		- 페이지블럭의 시작번호
		- 페이지블럭의 끝번호
		- 게시물의 끝 페이지 번호(제일 끝 페이지로 갈 수 있음)
		- 이전 버튼을 출력할지 여부
		- 다음 버튼을 출력할지 여부
		
		다른페이지에서도 공통으로 사용할 수 있음
-->



<c:set var="pageDto" value="<%=pageDto %>"/>

<!-- 이전버튼 -->
<c:if test="${pageDto.prev }">
	<a href='List.jsp?pageNo=${pageDto.startNo-1 }'>이전</a>
</c:if>

<!-- 페이지번호 출력 -->
<c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" var="i">
	<a href='List.jsp?pageNo=${i }' > ${i }</a>
</c:forEach>


<!-- 다음버튼 -->
<c:if test="${pageDto.next }">
	<a href='List.jsp?pageNo=${pageDto.endNo+1 }'>다음</a>
</c:if>


</body>
</html>
