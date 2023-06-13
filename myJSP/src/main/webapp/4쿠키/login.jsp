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
String loginErr = request.getParameter("loginErr");
	
	if("Y".equals(loginErr)){
		out.print("<script>'로그인 다시 하세요'</script>");
	}
	//location.href=localhost:8080/%EB%82%B4%EC%9E%A5%EA%B0%9D%EC%B2%B4/login.jsp?loginErr=Y
%>
<!-- form : 페이지를 요청한다! 폼태그안에 있는 요소들을 파라메터로 가지고 간다 -->
<form action="loginAction.jsp" method="post">			
	<%
		// 쿠키에 저장된 아이디 보여주기
		// 쿠키에 저장된 아이디가 있다면 id필드(id칸)의 value속성에 아이디값을 넣어줍니다
		
		String userId = CookieManager.readCookie(request, "userId");			
		
		/* readCookie매서드를 이용하면서 필요없어진 아래의 로직
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie : cookies){
				if("userId".equals(cookie.getName())){
					userId = cookie.getValue();
					out.print("userId : " + userId);
					break;
				}
			}
		}
		//아래 input태그에 value값 입력해줌 (value="< % =userId % >")
		*/
		//==========================================
		String name = request.getParameter("name");
		if(name != null && !name.equals("")){
			out.print("<h1>" + name + "님 환영합니다.</h1>");
		}else {
	%>
	<!-- 체크박스가 체크되어서 로그인버튼이 눌러졌다면 폼이 서브밋되는 페이지에서 저장할지말지 결정 -->
    <div class='loginbox'>
        <div id='login'>
            <input type="text" name="userid" id="userpw" placeholder='ID를 입력해주세요.' required="required" value="<%=userId%>"><br>
            <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.' required="required"><br>
        	<input type="checkbox" name="save_check" value="Y"> 아이디 저장하기 <br>
        </div>
        <div id='button'>
        <input type="submit" value="로그인">
        </div>
    </div>
    <div id='info'>
        <a href="">회원가입</a>
        <a href="">ID찾기</a>
        <a href="">PW찾기</a>
    </div>
    <%} %>
</form>	

</body>
</html>