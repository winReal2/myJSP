<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	JSTL (JSP Standard Tag Library)
	
		JSP의 표준태그라이브러리를 이용하면 
		스크립틀릿을 사용하지 않고 태그를 사용하여
		제어문, 반복문 등을 사용할 수 있다
	
	[JSTL을 사용하기 위한 방법]
	1. 라이브러리 추가
		기본태그가 아닌 확장태그이므로 사용하기위해서는 별도의 라이브러리가 필요하다
		메이븐리파지토리로 접근하여 jstl-1.2jar파일을 다운받고 lib폴더에 추가하면 된다!
	
	2. taglib 지시어 추가
		지시어를 추가해야 사용할 수 있다
	
	[JSTL 종류]
	Core 태그 : 변수선언, 조건문/반복문, URL처리
	접두어 	 : c
	
	Formatting : 숫자, 날짜, 시간 포맷 지정
	접두어  	   : fmt
 -->
 
 	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 	
<!-- 
	Core태그
	변수선언, 조건문/반복문 등을 대체하는 태그를 제공
	
 --> 	
	<!-- 
	1.변수 선언 
		var : 변수명
		value : 값
		scope : 저장영역	
	
	주석 내 문장도 잘 살펴보자!!(오류발생 포인트)
	c:set하고 /로 닫아주면 /c:set과 같은의미이다!
	<-- c:set / > == <-- c:set ><-- / c:set >
	-->
	
	<c:set var="directVar" value="100" />
	<c:set var="elVar" value="${ directVar mod 5 }" />
	<c:set var="expVar" value="<%=new Date() %>" />
	<c:set var="betweenVar">변수값 요렇게 설정</c:set>

	<h4>EL을 이용해 변수 출력</h4>
	<ul>
		<li>directVar : ${pageScope.directVar }</li>
		<li>elVar : ${ elVar }</li>
		<li>expVar : ${ expVar }</li>
		<li>betweenVar : ${ betweenVar }</li>
	</ul>
	
	<h4>자바빈즈 생성1 - 생성자 사용</h4>
	<c:set  var ="personVal1" 
			value='<%=new Member("id","", "하니", "2023-06-20") %>'
			scope="request" />
	
 	<ul>
 		<!-- 영역을 지정하지 않으면 페이지 영역부터 순서대로 찾아감 -->
 		<li>${personVal1.id }</li>
 		<li>${requestScope.personVal1.name }</li>
 	</ul>
 	
 	
 	<h3>자바빈즈 생성후 값을 변경하기</h3>
 	<h4>자바빈즈 생성2 - target, property 사용</h4>
 	<!-- 
 		자바빈즈 생성 후 값을 변경해봅시다
 		target : 자바빈즈 변수명
 		property : 자바빈즈 속성명(멤버변수명)
 		value : 값 지정
 	 -->
 	 
 	 	<c:set  var ="personVal2" 
				value='<%=new Member("hani","", "하니", "2023-06-20") %>'
				scope="request" />
	<ul>
 		<li>변경전 이름 : ${personVal2.name }</li>
 		<li>변경전 아이디 : ${requestScope.personVal2.id }</li>
 	</ul>	
 	
 	<!-- 객체이기때문에 el태그이용해서 변수이름 넣어주면 됨 -->
 	<c:set target="${personVal2}" property="id" value="hani1234"/>
 	<c:set target="${personVal2}" property="name" value="하니1234"/>
	<ul>
 		<li>변경후 이름 : ${personVal2.name }</li>
 		<li>변경후 아이디 : ${requestScope.personVal2.id }</li>
 	</ul>	
 	
 	
 	<h4>List 컬렉션 이용하기</h4>
 	<!-- 리스트 객체로 맴버객체를 담고 출력까지 -->
 	<%
 	
 	ArrayList<Member> list = new ArrayList<Member>();
 	list.add(new Member("hani", "", "하니", ""));
 	list.add(new Member("nami", "", "나미", ""));
 	%>
 	<c:set var="pList" value="<%=list %>" scope="request"/>
	<ul>
	<!-- 리스트는 방번호를 가져올 수 있다! -->
 		<li>이름 : ${pList[0].name }</li>
 		<li>아이디 : ${requestScope.pList[0].id }</li>
 	</ul>	
	<ul>
 		<li>이름 : ${pList[1].name }</li>
 		<li>아이디 : ${requestScope.pList[1].id }</li>
 	</ul>	
 	
 	
 	<h4>Map 컬렉션 이용하기</h4>
 	<!-- 인덱스는 번호를 ,맵은 키값을 알아야 -->
 	<%
 		Map<String, Member> map = new HashMap<String, Member>();
		//키는 스트링타입(pArgs1, pArgs2), 밸류는 객체( new Member("1", "", "일번", "")) 		
 		map.put("pArgs1", new Member("1", "", "일번", ""));
 		map.put("pArgs2", new Member("2", "", "이번", ""));
 	%>
 	<!-- 맵을 저장부터! / value는 위에서 생성한 map을 넣어줌-->
 	<c:set var="map" value="<%=map %>" scope="request"/>
	<ul>
 		<li>이름 : ${ map.pArgs1.name }</li>
 		<li>아이디 : ${ requestScope.map.pArgs1.id }</li>
 	</ul>	
	<ul>
 		<li>이름 : ${ map.pArgs2.name }</li>
 		<li>아이디 : ${ requestScope.map.pArgs2.id }</li>
 	</ul>	
 	
 	
</body>
</html>










