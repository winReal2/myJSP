<%@page import="dto.Criteria"%>
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

	//검색조건 
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	//편하게 처리하기 위해 Criteria 생성자에서 수정함!(생성자의 역할 : 초기화) (null처리, String 처리)
	String pageNo = request.getParameter("pageNo");
	
	//검색어가 null인 경우 빈문자열로 치환
	searchWord = searchWord == null? "": searchWord;  //삼항연산자로 검색창에 null안나오게 함
	// if(searchWord == null){
	//		searchWord = "";
	//	}
	
	//검색어가 null이 아니면 검색기능을 추가!!
	//작업결과 보고 확인위해 만들어 둠. 확인다 되면 없애도 된다
	//out.print("검색어 : " + searchWord + "<br>");
	//out.print("검색필드 : " + searchField);
	
	// 검색조건 객체로 생성
	Criteria criteria = new Criteria(searchField, searchWord, pageNo);

	// 게시판 DB 작업 - DAO 생성
	BoardDao dao = new BoardDao();
	//List<Board> boardList = dao.getList(searchField, searchWord); // **getList() 아무것도 안넣으니 오류발생! 파라메터 넣어주기!
	
	//리스트 조회
	List<Board> boardList = dao.getListPage(criteria); 
	
	//총 건수 조회
	int totalCnt = dao.getTotalCnt(criteria);	//만들어놓은 criteria 객체를 이용
	
%>

<jsp:include page="Link.jsp"/>

<h2>목록보기(List)</h2>

총건수 : <%=totalCnt %>

<!-- 검색폼 -->
<form name="searchForm">
<input type="text" name="pageNo" value="<%=criteria.getPageNo()%>"> <!-- 나중에 숨김처리하면되니까 확인용으로 나둠 -->
<table border="1" width="90%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="title">제목</option>
				<option value="content" <%="content".equals(searchField)? "selected" : ""%>>내용</option>
				<option value="content||title">제목+내용</option>
			</select>
			<!-- 검색창에 계속해서 출력하고 싶을 때 => value="< % =searchWord%>"  null나오면 삼항연산자로 null처리리리-->
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

<!-- 페이지블럭 생성 시작 -->
<%
	//원래 생성하는 부분은 상단에 위치하지만 헷갈릴까봐 아래에 작성
	PageDto pageDto = new PageDto(totalCnt, criteria);
%>
<table border="1" width="90%">
	<tr>
		<td align="center">
			<%@include file = "PageNavi.jsp" %>
		</td>
	</tr>	
</table>
<!-- 페이지블럭 생성 끝 -->






</body>
</html>



















