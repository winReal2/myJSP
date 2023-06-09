<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>

<script>
//팝업창 닫기!
window.onload = function(){
	
	if(typeof closeBtn != 'undefined'){
	
		//또는 closeBtn.addEventListener('click', function(){
		closeBtn.onclick = function(){		
			
			if(document.querySelector("#inactiveToday").checked){
			//체크박스가 체크되었으면 popFrm폼을 서브밋 처리 (서브밋처리한다는 건 PopupCookie.jsp요청한다는 뜻)
			//쿠키를 생성 후 Main1로 redirect해줍니다.
				popFrm.submit();
				
				} else {
					popup.style.display = 'none';			
			}
		}
	}
}	
</script>

<title>쿠키를 이용한 팝업창 제어 ver 1.0</title>

</head>
<body>

	<h1>쿠키를 이용한 팝업창 제어</h1>
	<!-- 쿠키는 서버에서 생성되므로 서버에 다녀와야합니다. -->
	<%
		//쿠키에 PopupClose값이 등록되어있지 않으면 팝업팡을 보여줌
		String cValue = CookieManager.readCookie(request, "PopupClose");
	
		if(!cValue.equals("Y")){
	
	%>
<!-- 아래팝업창은 cValue가 Y가 아닐때만 나옴 -->
    <div id="popup">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
        
 			<!-- 버튼을 누르면 폼이 서브밋되겠다 -->
	        <form name="popFrm" action="PopupCookie.jsp">
	            <input type="checkbox" id="inactiveToday" value="1" /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" />
	            <!-- 버튼클릭이 클릭되면 이벤트발생(버튼에 onclick이벤트 달아줌) > 창을 닫아줌 -->
	        </form>
        </div>
    </div>
    
    <%
    }
	%>

    
</body>
</html>