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
	//WriteProcess.jsp에서 사용자가 로그아웃을 하지 않았더라도 
	//일정시간이 경과되면 세션이 제거되므로 오류가 발생할 수 있다(null포인트익셉션)
	//로그인사용자가 아니면 로그인페이지로 이동시켜
	// String id = session.getAttribute("UserId").toString();  =>를 위해 IsLogin.jsp페이지 생성함
	if(session.getAttribute("UserId") == null){
%>		
	<script>
		alert("로그인 후 이용가능한 메뉴입니다.");
		location.href = "/myJSP/6세션/LoginForm.jsp";
	</script>
<%	
	return;
	}
%>
</body>
</html>