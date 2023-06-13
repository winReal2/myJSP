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
   		//request.getParameter : 사용자의 요청을 받아옵니다.
   		String id = request.getParameter("userid");
   		String pw = request.getParameter("userpw");
   		
   		String saveYN = request.getParameter("save_check");
   		out.print("saveYN : " + saveYN + "<br>");
   		
   		out.print("saveYN : " +saveYN);
   		//체크박스가 체크되었을 경우, 아이디를 쿠키에 저장합니다.
   		if(saveYN != null && saveYN.equals("Y")){
   			//60*60 = 1시간
   			
   			CookieManager.makeCookie(response, "userid", id, 60*60*24*7);   			
   		}
   		
   		
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