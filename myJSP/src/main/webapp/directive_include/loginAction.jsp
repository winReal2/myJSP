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
   		//request.getParameter : 사용자의 요청을 받아옵니다.
   		String id = request.getParameter("userid");
   		String pw = request.getParameter("userpw");
   		
   		if("abc".equalsIgnoreCase(id) && "123".equals(pw)){
   			//로그인 성공   name(파라메터)
   			//로그인 성공 시 세션영역에 id 저장(아이디만)
   			session.setAttribute("id", id);
			//세션에 저장 
   			response.sendRedirect("gogreen.jsp");
   			//response.sendRedirect("gogreen.jsp?name="+id);
   		} else {
   			//로그인 실패
   			response.sendRedirect("gogreen.jsp?loginErr=Y");

   		}
   	%>	
</body>
</html>