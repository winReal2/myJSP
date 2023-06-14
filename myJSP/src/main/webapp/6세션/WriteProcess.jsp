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
<%@ include file="IsLogin.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	// 1. 폼값을 입력 받아서 DTO 객체를 생성
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//사용자가 로그아웃을 하지 않았더라도 
	//일정시간이 경과되면 세션이 제거되므로 오류가 발생할 수 있다(null포인트익셉션)
	//로그인사용자가 아니면 로그인페이지로 이동시켜
	//String id = session.getAttribute("UserId").toString();
	String id = session.getAttribute("UserId") == null ? "" : session.getAttribute("UserId").toString();
	
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setId(id);

	// 2. DAO.insert(...) 호출 : DB에 게시글을 등록하고 결과를 숫자로 반환
	BoardDao dao = new BoardDao();
	int res = dao.insert(board);
	out.print(res);  //** 실행확인!! 오류 : alert창이 안뜨는데 새로고침하면 목록에 데이터는 추가가 되니까 alert 실행 전인 res값을 확인하기 위해 중간에 out.print(res); 실행해봄
					 // 값이 잘 나오는걸 확인하고 아래 실행문에서 오류가 없는지 확인! (따옴표 중복으로 인한 오류가 발생했었음)
	// 3. 등록성공 : 리스트 페이지로 이동
	//	  등록실패 : 메세지 처리
	// 공통의 메서드로 만들기위해 common패키지 내부에 메서드생성
	
	if(res > 0 ){
		// 등록성공
		JSPFunction.alertLocation("게시글이 등록되었습니다.(공통호출)", "Board.jsp", out);

	/*
		<script>
			alert("게시글이 등록 되었습니다!");  //**오류 !! 따옴표 잘 확인하기!
			location.href="Board.jsp";
		</script>
	*/

	} else {
		// 등록실패
		JSPFunction.alertBack("등록중 오류가 발생하였습니다.(공통호출)", out);	
	}

	/*
		<script>
			alert("등록 중 오류가 발생하였습니다!");
			history.go(-1);
		</script>
	*/
		
	%>
	

</body>
</html>