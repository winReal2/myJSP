package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//.one으로 끝나는 모든(*) 요청
@WebServlet("*.one")
public class FrontController extends HttpServlet{

	//doget은 기본메서드 (자동으로 request, response가 매개변수로 들어간다)
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		// uri.lastIndexOf("/") : 문자열의 끝에서 부터 찾아서 그 문자열의 인덱스를 반환
		// 요청경로
		String commandStr = uri.substring(uri.lastIndexOf("/"));
		
		//요청에 따라 분기
		if(commandStr.equals("/regist.one")) {
			registFunc(req);
		} else if(commandStr.equals("/login.one")) {
			loginFunc(req);
		} else if(commandStr.equals("/freeboard.one")) {
			freeboardFunc(req);
		}
		req.setAttribute("uri", uri);
		req.setAttribute("commandStr", commandStr);
		
		req.getRequestDispatcher("/13서블릿/FrontController.jsp").forward(req, resp);
		//테스트용 resp.getWriter().print(commandStr);
		
		
		
	}
	


	// 요청별 처리 메서드
	// resultValue 출력을 위해 jsp파일로 이동후 작성
	private void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>회원가입</h4>");
	}
	
	private void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>로그인</h4>");
	}
	
	private void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>자유게시판</h4>");	
	}


	public FrontController() {
		// TODO Auto-generated constructor stub
	}

}
