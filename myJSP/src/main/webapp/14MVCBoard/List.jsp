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
	<h2>MVC 모델2 게시판</h2>
	<!-- varStatus는 사용하면 넣고, 아니면 안넣어도됨 -->
	<!-- 3. JSTL로 데이터뿌려줌  ListController.java가서 화면출력하면 쭈루룩 나옴 =>이걸 표로 만들기 -->

<h4>총게시물 수 : ${totalCnt }</h4>
<form method="get" name="searchForm">
	<table border="1" style="width:90%">
	
	<!-- 페이지번호가 눌렸을떄 스크립트 실행(pageNavi.jsp) -->
	<%--<input type="text" name="pageNo" value="${pageNo }"> --%>
	
		<tr>
			<td align="center">
			<!-- 내용 필드 선택하면 고정되는지 확인하기 위해 삼항연산자 전에 미리 출력해보기 
			searchField : ${param.searchField }
			비교결과 : ${param.searchField eq "content" } -->
				<select name = "searchField">
					<option value="title" selected>제목</option>
					<option value="content" ${param.searchField eq "content" ? "selected" : ""} >내용</option>
				</select>
					<input type="text" name="searchWord"  value="${param.searchWord }" />
					<input type="submit" value="검색하기"/>
			</td>
		</tr>
	</table>
</form>
<!-- 검색기능 : 검색어 가지고 컨트롤러로 간다 > getList에서 매개변수를 받아서 넣어주면 된다 -->
<!-- 목록 테이블 -->
<table border="1" style="width:90%">
	<tr>
		<th>일련번호</th>
		<th>제목</th>
		<th>작성자 이름</th>
		<th>조회수</th>
		<th>작성일</th>
		<th>다운로드 횟수</th>
		<th></th>
	</tr>

<!-- 외우기 -->
	<c:choose>
		<c:when test="${empty list }">
		<!-- 게시물 없으면 -->
			<tr>
				<td colspan="6">등록된 게시물이 없습니다.</td>
			</tr>
		</c:when>
		
		<c:otherwise>
			<c:forEach items="${list }" var="row" varStatus="loop">
				<!-- 게시물 있으면 목록줄력 -->
				<tr>
					<td>${row.idx }</td>
					<td><a href="../mvcboard/view.do?idx=${row.idx }">${row.title }</a></td>
					<td>${row.name }</td>
					<td>${row.visitcount }</td>
					<td>${row.postdate }</td>
					<td>${row.downcount }</td>
		   	        <td>
		      		    <a href="" >다운로드</a>
		          	</td>
				</tr>
			</c:forEach>
		</c:otherwise> 
	</c:choose>
</table>

<!-- choose문 오류시 싹 지우고 실행 > 새로 간단하게 만들어서 확인해보기  -->

<!-- 
	글쓰기 버튼 추가
	글쓰기 버튼 클릭시 글쓰기 페이지로 이동 => 글쓰기 버튼 클릭하면 글등록
 -->
  <table>
	<tr>
		<td align="right"> 
			<button onclick="location.href='../mvcboard/write.do'">
			글쓰기
			</button>
		</td>
	</tr>	
 </table>
 
 <table>
	<tr>
		<td align="center"> 
			<%@include file = "../9페이지/PageNavi.jsp" %>
		</td>
	</tr>	
 </table>


		
	<!--  jsp:include을 이용하려면 param 넣어줘야함 / 1IncludeMain 참고 -->
	<%--<jsp:include page="../9페이지/PageNavi.jsp"></jsp:include> --%>


</body>
</html>