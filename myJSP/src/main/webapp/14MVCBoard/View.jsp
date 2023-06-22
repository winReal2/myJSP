<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>MVC 모델2 게시판</h2>

<table border="1" width="90%">
	<c:forEach items="${list }" var="row" varStatus="loop">
	<tr>
		<th>일련번호</th>
		<td>${row.idx }</td>ff
		<th>작성일</th>
		<td>${row.postdate }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${row.title }</td>
		<th>작성자 이름</th>
		<td>${row.name }</td>	
	</tr>
	<tr>
		<th>내용</th>
		<td>${row.content }</td>
	</tr>
	<tr>
		<th>파일명</th>
		<td>${row.ofile }</td>
        <td>
  		    <a href="" >다운로드</a>
      	</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${row.pass }</td>
		<th>저장된 파일명</th>
		<td>${row.sfile }</td>	
	</tr>

	</c:forEach>
</table>

</body>
</html>