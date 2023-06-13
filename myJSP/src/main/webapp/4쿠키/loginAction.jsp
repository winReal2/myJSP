<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="utils.CookieManager"%>
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
	//name속성의 값을 매개값으로 넘겨주면 value속성의 값을 반환한다.
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");
	
	//====================================================
	// dao 생성해서 dao메서드 호출		
	MemberDao dao = new MemberDao();		
	Member member = dao.login(id, pw);
	
	//=====================================================
	//아이디 저장 체크박스
	String saveYN = request.getParameter("save_check");	
	// 체크가 되어 넘어오면 Y, 아니면 null
	out.print("saveYN : " + saveYN + "<br>");
	//문자열로 비교하면 코드를 줄일 수 있다
	//아이디 저장하기 체크박스에 체크가 되었다면 쿠키에 아이디를 저장합니다!
	if("Y".equals(saveYN)){
		
		//쿠키메니저에서 생성한 메서드 호출
		//쿠키매니저를 이용하여 쿠키를 생성후 응답객체에 담아줍니다.
		CookieManager.makeCookie(response, "userId", id, 3600);
		
		/*
		out.print("id : " + id + "<br>");
		//쿠키생성하기 (userId, 사용자아이디)
		Cookie cookie = new Cookie("userId", id);
		//유지시간 설정
		cookie.setMaxAge(3600);
		//응답객체에 담기
		response.addCookie(cookie);
		*/
	}
	
	
	//DB 조회결과 id/pw가 일치하는 회원이 있으면 로그인 성공
	if(member != null && !"".equals(member.getName())) {
		out.print("로그인 성공");
		response.sendRedirect("login.jsp?name="+id);
		%>
		<!-- html을 출력 -->
		<h1>로그인 성공</h1>
		<%
			} else {
				out.print("로그인실패");
				//response.sendRedirect("login.jsp?loginErr=Y");
			}
		%>
		
</body>
</html>