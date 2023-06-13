<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
<%
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pwd");
	
	out.print("id : " + id + "<br>");
	out.print("pw : " + pw + "<br>");
	
	// id가 abc, 비밀번호가 123이면 로그인 성공
	// id != null && id.equals("abc") => null처리 해줘야함! 이유생각!
	if("abc".equals(id) && "123".equals(pw)){
		//로그인 성공
		out.print("로그인 성공");
		//요청할 페이지 정보
		
		/*
		response객체 : 요청에 대한 응답을 웹페이지로 보내주는 역할
		
		1. 페이지 이동
		- redirect
		웹 서버가 웹 브라우저에게 다른 페이지로 이동하라고 응답하는 기능
		웹브라우저로부터 새로운 요청을 받게 되므로 기존 요청정보가 사라짐!
			
			[사용방법]
			response.sendRedirect("페이지주소");		
		*/
		response.sendRedirect("ResponseWelcome.jsp");
	} else {
		
		/*
		2. 페이지 이동
		-forward
		다른 JSP페이지로 요청처리를 전달(사용자의 요청정보가 공유됨!!!)
		반환되는 페이지에서 이전 요청에 대한 정보를 사용할 수 있다
		
			[사용방법]
			request.getRequestDispatcher("페이지주소").forward(request, response);		
		*/
		
		//로그인 실패
		out.print("로그인 실패");
		//response.sendRedirect("ResponseMain.jsp?loginErr=Y");
		
		//사용자로부터 전달받은 request객체가 공유되므로 
		//아이디를 바로 출력할 수 있다! (redirect시 null출력!(페이지가 바뀌고 기존 요청정보가 사라지기 때문에 null출력))
		RequestDispatcher rd = request.getRequestDispatcher("ResponseMain.jsp");
		rd.forward(request, response);
		
		
		
	}
	
%>
</body>
</html>