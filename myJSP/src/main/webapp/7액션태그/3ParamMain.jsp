<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - param</title>
</head>
<body>




	<!-- 포워드 시에 전달. 리퀘스트영역에 생성(내가 별도로 어디 담지않아도 생성만하면 공유됨) -->
	<h2>자바빈객체를 파라메터로 전달하기</h2>
	<jsp:useBean id="person" class="dto.Person" scope="request"></jsp:useBean>
	<jsp:setProperty property="name" name="person" value="하니"/>
	<jsp:setProperty property="age" name="person" value="20"/>
	
		
	<!-- 
		jsp:include, jsp:forward 액션태그 이용시
		파라메터를 전달할 수 있다.
	 -->
	 <%
	 	String pValue="StringValue";
	 %>
	 
	<jsp:forward page="ParamForward.jsp?param1=쿼리스트링">
		<jsp:param value="param2" name="param2"/>
		<jsp:param value="<%=pValue %>" name="param3"/>
	</jsp:forward>


</body>
</html>