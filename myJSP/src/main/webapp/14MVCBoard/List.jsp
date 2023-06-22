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
	<h2>MVC 모델2 게시판</h2>
	<!-- varStatus는 사용하면 넣고, 아니면 안넣어도됨 -->
	<!-- 3. JSTL로 데이터뿌려줌  ListController.java가서 화면출력하면 쭈루룩 나옴 =>이걸 표로 만들기 -->

<table border="1">
	<tr>
		<th>일련번호</th>
		<th>작성자 이름</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성일</th>
		<th>파일명</th>
		<th>저장된 파일명</th>
		<th>다운로드 횟수</th>
		<th>비밀번호</th>
		<th>조회수</th>
		<th></th>
	</tr>

	<c:forEach items="${list }" var="row" varStatus="loop">
		<tr>
			<td>${row.idx }</td>
			<td>${row.name }</td>
			<td><a href="${pageContext.request.contextPath }/14MVCBoard/View.jsp">${row.title }</a></td>
			<td>${row.content }</td>
			<td>${row.postdate }</td>
			<td>${row.ofile }</td>
			<td>${row.sfile }</td>
			<td>${row.downcount }</td>
			<td>${row.pass }</td>
			<td>${row.visitcount }</td>
   	        <td>
      		    <a href="" >다운로드</a>
          	</td>
		</tr>
	</c:forEach>

</table>
</body>
</html>