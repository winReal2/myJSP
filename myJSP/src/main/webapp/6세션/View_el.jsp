<%@page import="common.JSPFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	// 한 건의 게시물을 가지고 나옵니다.(게시물 반환 (다오로부터 가지고 옴), )
	BoardDao dao = new BoardDao();
	// (request.getParameter("num")) : 조회하려는 게시글 넘버
	// 게시글 1건을 조회 후 board객체에 담아서 반환
	Board board = dao.selectOne(request.getParameter("num"));
	dao.updateVisitCount(request.getParameter("num"));
	
	if(board == null){
		//출력부분을 jspfunction이 실행
		JSPFunction.alertBack("게시글이 존재하지 않습니다.(상세)", out);
		//out.print("<script>");
		//out.print("alert('게시글이 존재하지 않습니다.');");
		//out.print("history.go(-1);");
		//out.print("</script>");
		
		return;  //더이상 실행할 필요가 없어서 return(끝)
	}
	
	//영역에 저장하고 가져다 사용
	request.setAttribute("board", board);
%>
	
<script>
	function deletePost(){
		var res = confirm("삭제 하시겠습니다?");
		
		if(res){
			location.href = "DeleteProcess.jsp?num=<%=board.getNum()%>"
		}
	}
</script>

</head>
<body>

<jsp:include page="Link.jsp"/>

<h2>회원제 게시판 - 상세보기(View)</h2>

<!-- 
	//if(board != null){
		//out.print(board.getId());
		//out.print(board.getTitle());
		//out.print(board.getContent());
  -->
 
 		
<form name="detail_View" action="Board.jsp">
	<table border="1" style="width:90%">
		<tr>
			<td>번호</td>
			<td>${board.num }</td>
			<td>작성자</td>
			<td>${board.id }</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${board.postdate }</td>
			<td>조회수</td>
			<td>${board.visitcount }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${board.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<!-- 자바처리는 dao에서 처리함. 화면단에서 처리하지 X -->
			<td colspan="3" height="100">${board.content }</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="submit" value="목록보기">
				<% 
				// 로그인한 아이디와 글쓴이가 같으면 수정, 삭제 버튼 활성화
				if(session.getAttribute("UserId") != null && board.getId().equals(session.getAttribute("UserId"))) {
				%>
				<button type="button" onclick="location.href='Edit.jsp?num=<%=board.getNum()%>'">수정하기</button>
				<button type="button" onclick="deletePost()">삭제하기</button> <!-- 함수실행 -->
				<% } %>
			</td>
		<tr>
	</table>
</form>
		



</body>
</html>