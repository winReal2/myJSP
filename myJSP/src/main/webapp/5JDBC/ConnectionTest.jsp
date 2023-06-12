<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.ConnectionUtil"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외부 설정파일로부터 DB접속정보를 읽어오기</title>
</head>
<body>
<%
	//외부파일로 빼는 이유에 대해 생각해보면 좋을듯!
	//application은 내장객체(우리가 직접 만들지 않았음)
	Connection conn = ConnectionUtil.getConnection(application);
	
	PreparedStatement psmt = conn.prepareStatement("select sysdate from dual");
	ResultSet rs = psmt.executeQuery();
	
	rs.next();
	out.print(rs.getString(1));  // 1은 결과 집합의 첫 번째 열을 의미
%>
</body>
</html>