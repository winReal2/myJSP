<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업창 제어 ver 2.0</title>
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
    /*(오류발생포인트)none에 따옴표 붙이면 팝업창 안사라짐 (실행안됨) */
    .off{
    	display : none;  
    }
</style>

<script>
//페이지가 로드되면 실행
window.onload = function(){
	//버튼이 클릭되면 함수를 실행
	closeBtn.onclick = function(){
		//버튼이 클릭되면 팝업창 숨기기
		popup.style.display='none';	
		
		var chkVal = document.querySelector("input[id=inactiveToday]:checked");
		
		//체크박스가 체크된 상태라면 
		if(chkVal !=null && chkVal.value == 1){
			//javascript를 활용해서 쿠키를 생성할 수 있다!
			const date = new Date();
			//12시간을 나타낸다
			date.setTime(date.getTime() + 12 * 60 * 60 * 1000);
			document.cookie = "PopupClose=off;expires="+date.toGMTString();
		}
	}
}	
</script>

</head>
<body>
<%
	//너무 길면 아래처럼 String off = CookieManager.readCookie(request, "PopupClose").equals("")?"":"off";
	String popupClose =  CookieManager.readCookie(request, "PopupClose");
	//쿠키에 popupClose가 등록되어 있으면 class속성을 이용해 팝업창을 출력하지 않도록 처리
	String off = popupClose.equals("") ? "" : "off";


%>
<h2>쿠키를 활용한 팝업창 제어 ver2.0 </h2>
	<!-- class="< % =off % >" : 클래스 추가함으로써 보이거나 안보이거나하는 처리할 수 있다. 
		style에 off를 display none으로!하고 popupClose를 off에 담아 삼항연산자 처리-->
    <div id="popup" class="<%=off%>">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
        
	        <form name="popFrm">
	            <input type="checkbox" id="inactiveToday" value="1" /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" />
	        </form>
        </div>
    </div>
</body>
</html>