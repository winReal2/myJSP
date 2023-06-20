<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	// 리스트 생성 후 멤버를 담아볼게요
	// (Object 타입으로 지정 > 어떤 타입이든 저장 가능)
	List<Object> aList = new ArrayList<Object>();
	aList.add("청해진");
	aList.add(new Member("test", "", "하니", "2023-06-19"));
	
	// EL표현을 이용하기 위해 영역에 저장
	// 페이지 영역에 리스트 객체 저장
	pageContext.setAttribute("aList", aList);	
%>
	
<h2>List 컬렉션</h2>
<ul>
	<!-- 영역을 지정하지 않았지만 페이지 영역에 저장된 aList의 값이 출력 -->
	<li>0번째 요소
		<p>${aList[0] }</p>  
	</li>
	<!-- 객체의 주소값이 반환 -->
	<li>1번째 요소
		<p>${aList[1] }</p>
		<p>id : ${aList[1].id }</p>
		<p>name : ${aList[1].name }</p>
	</li>
	<!-- 예외가 발생하지 않고 출력되지 않음 -->
	<li>2번째 요소
		<p>${aList[2] }</p>
	</li>
</ul>	
	
	
<h2>Map 컬렉션</h2>
<%
	//키, 값 모두 String
	Map<String, String> map = new HashMap<String, String>();
	// key, value 세팅 
	map.put("한글", "훈민정음");
	map.put("Eng", "English");

	//영역에 저장해줘야 화면에 출력됨
	pageContext.setAttribute("map", map);
%>	
<ul>
	<!-- map은 키값으로 접근 -->
	<li>한글
		<p>${map['한글'] }</p>
		<p>${map["한글"] }</p>
		<!-- 한글은 .으로 접근 불가 -->
		<!-- EL코드 주석처리 방법 : 앞에 \를 붙여줍니다 -->
		<p>\${map.한글 }</p>
		<p><%=map.get("한글") %></p>
	</li>
	<li>영문
		<p>${map.Eng }</p>
		<p>${map.['Eng'] }</p>
		<p>${map.["Eng"] }</p>
		<p><%=map.get("Eng") %></p>		
	</li>
</ul>

	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>