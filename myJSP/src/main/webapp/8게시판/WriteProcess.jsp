<%@page import="dao.NewBoardDao"%>
<%@page import="dao.BoardDao"%>
<%@page import="common.JSPFunction"%>
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
<%@include file = "../6세션/IsLogin.jsp" %> <!-- 로그인 체크 -->
<%@include file = "../6세션/Link.jsp" %>
<%
	Board board = new Board();

	board.setTitle(request.getParameter("title"));
	board.setContent(request.getParameter("content"));
	board.setId(session.getAttribute("UserId").toString());
	
	NewBoardDao dao = new NewBoardDao();
	int res = dao.insert(board);

	if(res > 0 && request.getParameter("title") != null && request.getParameter("content") != null) {
		JSPFunction.alertLocation("입력되었습니다.", "List.jsp", out);
	} else {
		JSPFunction.alertBack("입력 중 오류가 발생하였습니다.\n\n 관리자에게 문의해주세요.", out);
	}
%>
	
</body>
</html>