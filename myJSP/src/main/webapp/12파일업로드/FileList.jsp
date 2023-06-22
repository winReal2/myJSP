<%@page import="fileupload.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>DB에 등록된 파일 목록 보기</h2>
<!-- 같은폴더에 있어서 파일명만 적어도 됨 
<a href="../12파일업로드/FileUpload.jsp">파일 등록하기</a>
-->
<a href="FileUpload.jsp">파일 등록하기</a>


out.print("req : " + request.getAttribute("list")

	<!-- 자바빈을 표현언어에서 사용하기 위해 변수로 선언 -->
	<!-- JSTL을 사용한 방법 -->
	<c:set var="fileList" value="${requestScope.list  }"/>
	
	
 <!-- 게시물 목록 테이블(표) --> 
    <table border="1" >
        <tr>
            <th>No</th>
            <th>작성자</th>
            <th>제목</th>
            <th>카테고리</th>
            <th>원본 파일명</th>
            <th>저장된 파일명</th>
            <th>작성일</th>
            <th></th>
        </tr>
        
        <c:forEach items="${fileList }" var="fileDto">
        	<tr>
        		<td>${fileDto.idx }</td>
        		<td>${fileDto.name }</td>
        		<td>${fileDto.title }</td>
        		<td>${fileDto.cate }</td>
        		<td>${fileDto.ofile }</td>
        		<td>${fileDto.sfile }</td>
        		<td>${fileDto.postdate }</td>
    	        <td>
    	        	<!-- 경로까지 저장하는 경우도 있고 경로는 지정해놓고 이름만 하는곳도 있음 
    	        	사용자가 원래업로드한 이름으로 다운로드해주려고 함-->
        		    <a href="Download.jsp?oName=${fileDto.ofile }&sName=${fileDto.sfile}" >다운로드</a>
            	</td>
        	</tr>
        
        </c:forEach>
     <%--  목록의 내용 --> 
	<%
		if(list.isEmpty()){
	%>
		<tr>
			<td colspan="5">게시물이 없습니다.</td>
		</tr>
	<%		
		} else {

			for(FileDto dto : list){
	%>
        <tr align="center">
            <td align="center"><%=dto.getIdx() %></td>
            <td align="center"><%=dto.getName()%></td>         
            <td align="center"><%=dto.getTitle() %></td>  
            <td align="center"><%=dto.getCate() %></td>    
            <td align="center"><%=dto.getOfile() %></td>    
            <td align="center"><%=dto.getSfile() %></td>   
            <td align="center"><%=dto.getPostdate() %></td> 
            <td>
            <a href="${pageContext.request.contextPath }/upload/http통신과 json(2023.05.30).txt" download="파일명" >다운로드</a>
            </td>
        </tr>
	<%		
			}
		}	
	%> --%>

    </table>        
        
</body>
</html>