<%@page import="dto.Board"%>
<%@page import="common.JSPFunction"%>
<%@page import="dao.NewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>

</head>
<body>
<%
	String num = request.getParameter("num");

	if(num == null){
		JSPFunction.alertBack("존재하지 않는 게시물입니다.", out);
		return;
	}

	NewBoardDao dao = new NewBoardDao();
	//조회수 카운트
	dao.updateVisitCount(num);
	//게시글 조회
	Board board = dao.selectOne(num);
%>

<%@include file = "../6세션/Link.jsp" %>
<h2>회원제 게시판 - 상세 보기(View)</h2>

    <table border="1" width="90%">
        <tr>
            <td>번호</td>
            <td><%=board.getNum() %></td>
            <td>작성자</td>
            <td><%=board.getId() %></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><%=board.getPostdate() %></td>
            <td>조회수</td>
            <td><%=board.getVisitcount() %></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3"><%=board.getTitle() %></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" height="100">
            <%=board.getContent().replace("\r\n", "<br>") %>
            </td> 
        </tr>
        <tr>
            <td colspan="4" align="center">
            
                <button type="button" onclick="location.href='Edit.jsp?num=<%=request.getParameter("num")%>'">수정하기</button>
                <button type="button">삭제하기</button> 
                <%
                String pageNo = "";
                //확인용 => out.print("pageNo : "+ request.getParameter("pageNo"));
                if(request.getParameter("pageNo") != null) {
                	pageNo = request.getParameter("pageNo");
                }
                %>
                <!-- pageNo=< %=request.getParameter("pageNo")%> 로 목록돌아가면 첫화면이 아닌 눌렀던 화면으로 back-->
                <button type="button" onclick="location.href='List.jsp?pageNo=<%=request.getParameter("pageNo")%>'">목록 보기</button>
            </td>
        </tr>
    </table>

</body>
</html>
