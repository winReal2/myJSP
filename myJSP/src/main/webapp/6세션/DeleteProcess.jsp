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
<%@include file="IsLogin.jsp" %>  <!-- 세션이만료되면 삭제기능 튕기게끔함 (islogin.jsp가서 return작성까지해주었음! -->
<%
	String num = request.getParameter("num");
	//out.print(num);

	Board board = new Board(num, "", "", "", "", "");
	
	BoardDao dao = new BoardDao();
	int res = dao.delete(board); //***오류발생!! 위에서 생성한 board에 num이 들어있어야함!
	
	if(res > 0){
		JSPFunction.alertLocation("삭제되었습니다.", "Board.jsp", out);
	} else {
		JSPFunction.alertBack("삭제를 실패했습니다.", out);
	}
%>
</body>
</html>