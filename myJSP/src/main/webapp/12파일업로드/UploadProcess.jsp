<%@page import="common.JSPFunction"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fileupload.FileDao"%>
<%@page import="fileupload.FileDto"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
		<!-- oreilly(출판사 이름) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 저장할 디렉터리의 실제 경로  (외부에 디렉토리 설정하는 경우가 더 많다~)
	String saveDirectory = "C:/upload";
	
	//역슬래쉬 \ 두개 넣어주면 오류안남
	// webapp 폴더 하위에 디렉토리를 생성
	// saveDirectory = "C:\\Users\\user\\git\\myJSP\\myJSP\\src\\main\\webapp\\upload";
	
	// 파일의 최대 크기(1MB)
	int maxPostSize = 1024 * 1000;
	
	// 인코딩 방식
	String encoding = "utf-8";

	//파일저장하다 오류발생할 수 있어서 
	try{
		// 1.MultipartRequest 객체 생성
		//	생성자의 매개변수로 저장경로, 파일최대크기, 인코딩방식을 지정
		//	객체가 정상적으로 생성되면 파일은 업로드 됩니다
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding); 	
		
		// 2. 새로운 파일명 생성
		// 동일한 파일명으로 업로드 되는 경우, 기존파일에 덮어쓰기하여 소실될 위험이 있으므로 파일명을 변경해준다
		String fileName = mr.getFilesystemName("attachedFile");

		//확장자를 분리한 파일이름을 ofilename
		// 첨부파일의 확장자를 알아내는 방법
		String ext = fileName.substring(fileName.lastIndexOf("."));
		
		//H : 0~23, S : millisecond
		//현재시간을 파일이름으로 지정
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String oFileName = fileName.substring(0, fileName.lastIndexOf("."));
		
		String newFileName = oFileName +"_"+ now + ext;		
		System.out.println("원본파일명 : " + fileName);
		System.out.println("신규파일명 : " + newFileName);
		
		// 3. 파일명 변경
		File oldFile = new File(saveDirectory + File.separator + fileName);
		File newFile = new File(saveDirectory + File.separator + newFileName);
		
		oldFile.renameTo(newFile);
		
		//폼 요소의 값을 저장 (변수에 저장하고 dto로 생성해줄게요)
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		
		//체크박스인 경우, 배열로 반환 받아서 문자열로 연결해서 저장
		String[] categoryArr = mr.getParameterValues("category"); //다중선택이라 처리가 별도로 필요=> 배열로 반환을 받아야함! values
		//String 버퍼 이용
		StringBuffer sb = new StringBuffer();
		if(categoryArr == null){
			sb.append("선택없음");
		} else {
			for(String category : categoryArr){
				sb.append(category+",");
			}
		}

		
		System.out.println("name : " + name);
		System.out.println("title : " + title);
		System.out.println("category : " + sb.toString());
		System.out.println("ofileName : " + fileName);
		
		//DTO 생성 (dao호출을 위해)
		FileDto dto = new FileDto("", name, title, sb.toString(), fileName, newFileName, "");
		
		//DAO를 통해 데이터 베이스에 등록
		FileDao dao = new FileDao();
		int res = dao.insertFile(dto);
		
		if(res>0){
			out.print("등록되었습니다.");
			// 리스트 페이지로 이동
			JSPFunction.alertLocation("등록되었습니다", "FileList.jsp", out);
		} else {
			out.print("DB등록에 실패하였습니다.");   // 콘솔창 보니 열 인덱스가 부족하다고 나옴! > 그래서 insertFile로 가서 sql문 확인
			// 이전페이지로 이동
			JSPFunction.alertBack("DB등록에 실패하였습니다. \n 관리자에게 문의해주세요.", out);
		}
		
		
	} catch(Exception e){
		e.printStackTrace();
		out.print(e);
		request.setAttribute("errorMessage", "파일업로드 오류");
		
		//이전 페이지로 이동
		JSPFunction.alertBack("파일업로드 오류 발생. \n 관리자에게 문의해주세요.", out);
	}
	
%>





</body>
</html>