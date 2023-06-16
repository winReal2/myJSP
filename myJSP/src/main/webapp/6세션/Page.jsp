<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	function go(page){
		// 버튼이 움직이지 않으면 스크립트부터 확인하기 위해 alert("aa");
		location.href="PageNavi.jsp?pageNo="+page;
	}
</script>
<%
	int pageNo = request.getParameter("pageNo")==null
					? 1 : Integer.parseInt(request.getParameter("pageNo"));
	//스크립트 실행되는 것 확인 후 > out.print("pageNo");
	
	//생성자 호출 (startNo, endNo 설정해줌)
	Criteria criteria = new Criteria(pageNo);
	int total = 500;
	PageDto pageDto = new PageDto(total, criteria);
	
	if(pageDto.isPrev()){
		//제일 앞으로가기 (1페이지블록)
		out.print("<input type='button' value='<<' onclick='go(1)'>");	
	
		//앞으로가기 (이전 페이지 블럭을 가지고 옴)
		out.print("<input type='button' value='<' onclick='go("+ (pageDto.getStartNo()-1) +")'>");	
	}

	for(int i = pageDto.getStartNo(); i<=pageDto.getEndNo(); i++){
		out.print("<input type='button' value='"+i+"' onclick='go("+i+")'>");  //내가 클릭한 번호(i)의 페이지로 이동
	}
	
	if(pageDto.isNext()){
		//뒤로가기 (이후 페이지블럭을 가지고 옴)
		out.print("<input type='button' value='>' onclick='go("+ (pageDto.getEndNo()+1) +")'>");	

		//제일 뒤로가기 (마지막 페이지블럭)
		out.print("<input type='button' value='>>' onclick='go("+ (pageDto.getRealEnd()) +")'>");	
	}
%>



</body>
</html>