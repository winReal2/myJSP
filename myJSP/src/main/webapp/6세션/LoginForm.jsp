<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>Session</title></head>
<body>
	<jsp:include page="Link.jsp" />
    <h2>로그인 페이지</h2>
    <span style="color: red; font-size: 1.2em;"> 
    </span>
<%=
	//오류메세지가 있으면 출력하는 부분
	request.getAttribute("LoginErrMag") == null ? "" : request.getAttribute("LoginErrMag")
%>
<!-- 
	1. 로그인 성공시 로그인 폼을 화면에 보여주지 않음  
	2. 제목태그 이용하여 ~님 환영합니다 출력
	3. header영역의 로그인 링크를 로그아웃으로 수정 (로그인 버튼을 로그아웃 버튼으로)
 -->
 <% 
	//로그인되었는지 확인
	if(session.getAttribute("UserId") == null){
 %>
    <form action="LoginProcess.jsp" method="post" name="loginFrm"
        onsubmit="return validateForm(this);">
        아이디 : <input type="text" name="user_id" required="required"/><br />
        패스워드 : <input type="password" name="user_pw" required="required"/><br />
        <input type="submit" value="로그인하기" />
    </form>
    
	<%} else { 
		String name = "";
		 if(session.getAttribute("member") != null) {
			 Member member = (Member)session.getAttribute("member");
			 name = member.getName();
		 }
	 %>
		<h2><%=name %> + 님 환영합니다.</h2>
 	<%
 		response.sendRedirect("board.jsp");
	} 
 	%>
	
</body>
</html>