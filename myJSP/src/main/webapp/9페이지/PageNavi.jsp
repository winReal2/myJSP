<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%
/*
	// 매개변수 : 총게시물수, 검색조건(페이지번호, 페이지당 게시물수, 검색어,검색조건)
	int pageNo = request.getParameter("pageNo")==null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
			
	//totalCnt, pageNo를 세팅해줘야함!!!
	int totalCnt = 300;
	Criteria criteria = new Criteria(pageNo); //2 : 페이지 번호 받아서 넣어줌 Criteria.java가보면 이미 생성되어있는 다른 조건들
	
	PageDto pageDto = new PageDto(totalCnt, criteria);
*/
	//어쩔땐 출력, 또 어쩔땐 출력하지 않아야함
	if(pageDto.isPrev()){
		//시작페이지번호가 1보다 큰 경우 이전버튼을 출력
		out.print("<a href='List.jsp?pageNo="+(pageDto.getStartNo()-1)+"'>");
		out.print("<");
		out.print(" </a>");
	}
	//먼저 반복문 이용해서 페이지번호
	for (int i = pageDto.getStartNo(); i <= pageDto.getEndNo(); i++){
		out.print("<a href='List.jsp?pageNo="+i+"'>");
		out.print(i);
		out.print(" </a>");
	}
	if(pageDto.isNext()){
		//마지막 번호가 게시물의 끝페이지 번호와 일치하지 않으면 
		out.print("<a href='List.jsp?pageNo="+(pageDto.getEndNo()+1)+"'>");
		out.print(">");
		out.print(" </a>");
	}
%>


</body>
</html>













