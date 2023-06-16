<%@page import="common.JSPFunction"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../6세션/IsLogin.jsp" %>
<%
/*
out.print("제목 : " + request.getParameter("title"));
out.print("내용 : " + request.getParameter("content"));
out.print("id : " + request.getParameter("num"));
*/


	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = session.getAttribute("UserId").toString();
	
	BoardDao dao = new BoardDao();
	Board board = new Board(num, title, content, id, "", "");
	
	int res = dao.update(board);
	out.print(res); //**!! res값이 0이 아니라 1이 나와야 if문 실행되니까 확인! 안나오면 상단의 out.print해서 값들 출력해보고 null값 나오면 edit페이지가서 각각의 값들 확인!!
	
	
	if(res > 0){
		JSPFunction.alertLocation("수정되었습니다", "View.jsp?num="+num, out);
	} else {
		JSPFunction.alertBack("수정작업 중 오류가 발생했습니다.", out);
	}

	
	
%>
</body>
</html>