<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
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
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");

	MemberDao dao = new MemberDao();     //객체 생성
	Member member = dao.login(id, pw);
	
	if(member != null){
		//로그인 성공 => 세션에 member 객체를 저장
		session.setAttribute("UserId", member.getId());
		session.setAttribute("member", member);
		
		response.sendRedirect("Board.jsp");
		

				
	} else {
		// 로그인 실패 => LoginForm.jsp 페이지로 이동, 오류메세지 출력
			request.setAttribute("LoginErrMag", "아이디, 비밀번호가 일치하지 않습니다.");
		//forward를 이용 (샌드리다이랙트는 리스폰스에 있음)
		//LoginFor.jsp 페이지로 이동
		//request영역을 공유하기 위해 forward 사용
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
	
%>



</body>
</html>












