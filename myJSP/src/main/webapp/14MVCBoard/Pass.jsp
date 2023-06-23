<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<script type="text/javascript">
    function validateForm(form) {
        if (form.pass.value == "") {
            alert("비밀번호를 입력하세요.");
            form.pass.focus();
            return false;
        }
    }
</script>
</head>
<body>    
<h2>파일 첨부형 게시판 - 비밀번호 검증(Pass)</h2>
<!-- 이미 만들어서 컨트롤러에서 dopost메서드만 만들면된다 -->
<form name="writeFrm" method="post" action="../mvcboard/pass.do" onsubmit="return validateForm(this);">
<!-- 처음엔 출력되게 다 꺼내놓는다 / idx, mode값 -->
<input type="text" name="idx" value="${ param.idx }" /> <!-- 포워드했기때문에 param.idx, 리퀘스트영역저장했기때매 idx.mode 가능-->
<input type="text" name="mode" value="${ param.mode }" />
<table border="1" width="90%">
    <tr>
        <td>비밀번호</td>
        <td>
            <input type="password" name="pass" style="width:100px;" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <button type="submit">검증하기</button>
            <button type="reset">RESET</button>
            <button type="button" onclick="location.href='../mvcboard/list.do';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>    
</form>
</body>
</html>