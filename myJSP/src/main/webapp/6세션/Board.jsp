<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
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
<%
//[추가희망] : 세션유지시간에 맞춘 시간표시(연장기능(클릭하면 시간 초기화 등))

	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	searchWord = searchWord == null? "": searchWord;  //삼항연산자로 검색창에 null안나오게 함
	// if(searchWord == null){
	//		searchWord = "";
	//	}
	
	//검색어가 null이 아니면 검색기능을 추가!!
	//작업결과 보고 확인위해 만들어 둠. 확인다 되면 없애도 된다
	//out.print("검색어 : " + searchWord + "<br>");
	//out.print("검색필드 : " + searchField);
	
	BoardDao dao = new BoardDao();
	List<Board> boardList = dao.getList(searchField, searchWord); // **getList() 아무것도 안넣으니 오류발생! 파라메터 넣어주기!

	int totalCnt = dao.getTotalCnt(searchField, searchWord);
	

	
	
%>

<jsp:include page="Link.jsp"/>

<h2>목록보기(List)</h2>

총건수 : <%=totalCnt %>

<!-- 검색폼 -->
<form>
<table border="1" width="90%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="title">제목</option>
				<option value="content" <%="content".equals(searchField)? "selected" : ""%>>내용</option>
				<option value="content||title">제목+내용</option>
			</select>
			<!-- 검색창에 계속해서 출력하고 싶을 때 => value="< % =searchWord%>" -->
			<input type="text" name="searchWord" value="<%=searchWord%>">
			<input type="submit" value="검색하기">
		</td>
	</tr>
</table>
</form>
<!-- 검색폼 끝 -->

<table border="1" width="90%">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
	
<%
	if(boardList.isEmpty()){
		//게시글이 하나도 없을 때		
%>
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
		</tr>
<%
	} else {
		for(Board board : boardList){
%>	
		<!-- 반복문이 돌떄마다 한 줄씩 생성 -->
	<tr>
		<td><%=board.getNum() %></td>
		<td><a href="View.jsp?num=<%=board.getNum() %>"><%=board.getTitle()%></a></td>  <!-- 링크를 걸 부분 -->
		<td><%=board.getId()%></td>
		<td><%=board.getVisitcount()%></td>
		<td><%=board.getPostdate()%></td>
	</tr>
	
<%
	}
}		
%>	
</table>


<!-- 로그인했을때만 글쓰기 버튼이 나왔으면 좋겠다 -->
<%
	if(session.getAttribute("UserId") != null){
%>	
<table border="1" width="90%">
	<tr>
		<td align="right">
			<input type="button" value="글쓰기" onclick="location.href='Write.jsp'">
		</td>
	</tr>
</table>
<%} %>













</body>
</html>



















