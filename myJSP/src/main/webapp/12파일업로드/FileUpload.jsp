<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function validateForm(form){
	if(form.name.value == ''){
		alert("작성자를 입력하세요.");
		form.name.focus();
		return false;
	}
	
	if(form.title.value == ''){
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	
	if(form.attachedFile.value == ''){
		alert("첨부파일은 필수 입력입니다.");
		return false;
	}
	if(document.querySelectorAll("[name=category]:checked").length == 0){
		alert("카테고리를 선택 해주세요!");
		return false;
	}

}
</script>
</head>
<body>

	<h3>파일 업로드</h3>
	<!-- 
		파일을 업로드하기 위해 라이브러리(cos.jar) 추가후
		form태그의 속성 설정 (파일전송을 위해 두가지 속성 변경)
		
		[속성 설정]
		method : post 
		enctype : multipart/form-data
	 -->
	<!-- 
		파일을 관리하기 위한 로직작성
		1. 유효성검사
		2. 체크박스인경우 배열로 받아야함!

		onsubmit
		사용자 입력체크 로직 추가
		(유효성검사 / validation check) 
		값을 정확히 입력했을 때만 넘어가도록 함 -->
	${errorMessage }	
	<form action="UploadProcess.jsp" method="post" enctype="multipart/form-data"
			onsubmit="return validateForm(this;)">  
			<!-- 함수이름 : validateForm return하지않으면 그냥 서브밋 실행 / return false하면 기본이벤트 실행안하고 멈춤!-->
		<p>
			작성자 : <input type="text" name="name" value="하니">
		</p>
		<p>
			제목 : <input type="text" name="title" value="제목">
		</p>
		<p>
			카테고리 : 
			<input type="checkbox" name="category" value="사진" checked> 사진
			<input type="checkbox" name="category" value="과제"> 과제
			<input type="checkbox" name="category" value="워드"> 워드
			<input type="checkbox" name="category" value="음원"> 음원
		</p>
		<p>
			<!-- multiple="multiple" : 파일 여러개 선택할 수 있는 속성-->
			첨부파일 : <input type="file" name="attachedFile" >
		</p>
		<input type="submit" value="전송하기">
	</form>

	<!-- 
		enctype : form값을 서버로 전송할떄의 인코딩 방식을 지정
		
		- application/x-www-form-urlencoded (기본값)
			모든 문자를 서버로 전송하기 전에 인코딩합니다
		
		- multipart/form-data
			<form>태그를 통해 파일을 서버로 전송할 때 사용
			모든 문자를 인코딩하지 않습니다
	 -->	
	
	<h3>다운로드</h3>
	<!-- a태그일때 링크연결하려면 컨텍스트루트 넣어줘야함 
	받으려는 파일이 한글인 경우 문제가 발생 => download= -->
	<a href="${pageContext.request.contextPath }/upload/http통신과 json(2023.05.30).txt" download="파일명" >다운로드</a>


	
	
		
</body>
</html>