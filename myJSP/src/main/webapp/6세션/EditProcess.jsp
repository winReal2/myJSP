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
</head>
<body>
<%
	//한글꺠짐 방지
	request.setCharacterEncoding("utf-8");
	
	// out.print로 확인 후 변수에 담아줌
	//파라메터를 입력받아 Dto객체 생성
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Board board = new Board(num, title, content, "", "", "");
	
	//게시물 업데이트
	BoardDao dao = new BoardDao();
	int res = dao.update(board);
	
	if(res > 0){
		//성공했으면 메세지출력, 상세페이지 이동
		JSPFunction.alertLocation("수정 되었습니다", "View.jsp?num=" + board.getNum(), out);
	} else {
		//실패하면 메세지출력, 이전페이지로 이동
		JSPFunction.alertBack("수정하기 실패하였습니다. 관리자에게 문의바랍니다", out);
	}
%>
</body>
</html>