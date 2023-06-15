<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="Link.jsp"/>

<%
	String num = request.getParameter("num");

	BoardDao dao = new BoardDao();
	//1건의 게시물을 조회
	Board board = dao.selectOne(num);
%>

<h2>회원제 게시판 - 수정하기(Edit)</h2>

<form action="EditProcess.jsp" method="post">
	<!-- 넘버값이 폼 밖에 있으면 못가져가요 -->
	<input type="text" value="<%=num %>" name="num">
		<table border="1px" style="width:90%">
	
			<tr>
				<td>제목</td>
				<td colspan="3" style="width:90%">
					<input type="text" name="title" style="width:90%" 
							value="<%=board.getTitle()%>">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content"  style="width:90%; height:100px"><%=board.getContent() %> <!-- (위치잘보기) 아래로 떨어트리면 화면에서도 떨어짐 -->
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit"> 수정하기 </button>
					<button type="reset"> 초기화 </button>
					<button type="button" onclick="location.href='Board.jsp'"> 목록보기 </button>
				</td>
			<tr>
		</table>
</form>


</body>
</html>