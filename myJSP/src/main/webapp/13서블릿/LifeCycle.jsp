<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function requestAction(form, type){
	if(type==1){
		form.method='get';	
	} else{
		form.method='post';	
	}
	form.submit();	
}

</script>
</head>
<body>

	<h2>서블릿 생명주기(Life Cycle) 메서드</h2>
	<form action="./LifeCycle.do" >
		<!-- this.form : 내가 현재 속해있는 폼 / 1이면 겟방식, 2면 post방식 -->
		<input type="button" value="Get방식 요청" onclick="requestAction(this.form, 1)">
		<input type="button" value="Post방식 요청" onclick="requestAction(this.form, 2)">
	
	</form>

</body>
</html>