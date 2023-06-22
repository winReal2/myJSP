package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//서블릿 매핑처리 (어떤url로 호출할지 작성)
// "/13서블릿/AnnotationMapping.do" > AnnotationMapping > doGet
//.do는 그냥이름(확장자, 식별자).  
// HttpServlet 상속받은 객체를 서블릿이라고 함!  그 중에서 요청에 맞는걸 실행시켜주겟다 
// 톰캣이 서블릿을 관리(생명주기 관리)

//@WebServlet은 서버 실행전 정보를 수집한다 (메타데이터) 그래서 실행하지않아도 중복되면 오류!
// @WebServlet의 폴더경로(/13서블릿/AnnotationMapping.do)가 중복되면 충돌발생! 오류! 
// 두 서블릿들 모두 url-pattern [/13서블릿/AnnotationMapping.do]에 매핑되어 있는데, 이는 허용되지 않습니다. 오류
@WebServlet("/13서블릿/AnnotationMapping.do")
public class AnnotationMapping extends HttpServlet{
	
	
	// 포워드인경우 주소표시줄 변경 X 내부적 변경 > 404나오면 포워드 주석처리 해보고,주소도 확인
	@Override  //doget요청이 왔을 때 페이지 반환
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "AnnotationMapping.do 호출");
		req.getRequestDispatcher("HelloServlet.jsp").forward(req, resp);
	}
	
	public AnnotationMapping() {
		// TODO Auto-generated constructor stub
	}

}
