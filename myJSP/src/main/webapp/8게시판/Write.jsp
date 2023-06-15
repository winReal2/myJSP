<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
<%@include file="../6세션/Link.jsp" %>

<h2>회원제 게시판 - 글쓰기(Write)</h2>


<!-- form에서 action주는 것과  input 태그 button에서 onclick하는 것은 무슨 차이? -->
<form action="WriteProcess.jsp">
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='List.jsp'">목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>