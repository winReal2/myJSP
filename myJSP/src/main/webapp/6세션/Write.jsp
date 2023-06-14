<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="Link.jsp"/>

<h2>회원제 게시판 - 글쓰기(Write)</h2>

<form name="writeFrm" method="post" action="WriteProcess.jsp"
		onsubmit="return validateForm(this);">
	<table border="1" style="width:90%">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" style="width: 90%" />
		</tr>
		<tr>
			<td>내용></td>
			<td>
				<textarea name="content" style="width:90%; height: 100px;" ></textarea>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2" style="width: 100%">
				<input type="submit" value="작성완료" >
				<input type="reset" value="다시 입력">
				<input type="button" value="목록 보기" onclick="location.href='Board.jsp'">  <!-- 위쪽의  WriteProcess.jsp으로 가서 페이지 안떴음-->
			</td>
		</tr>
	
	</table>
</form>


</body>
</html>