package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//HttpServlet 상속받음
public class HelloServlet extends HttpServlet{
	//doGet메서드(사용자의 요청) 재정의 (do치고 컨트롤스페이스)
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 서블릿 호출되면 jsp로 반환(포워드로)
		req.setAttribute("message", "서블릿 호출!!");
		
		// 
		//PrintWriter out = res.getWriter();
		//out.print("<h1>서블릿 호출!!</h1>");
		//getWriter().print하고 forward나 sendRedirect 하면 안됨
		//res.getWriter().print("서블릿 호출!!");
		
		
		//사용자의 요청 > 서블릿 실행 > 페이지전환
		// sendRedirect는 request영역이 공유가 안됨 (forward는 리퀘스트 영역에 객체를 공유한다)
		res.sendRedirect("HelloServlet.jsp");
		// 서블릿을 호출하면 매핑을 위해 web.xml에 서블릿 등록
	
		// 포워드인경우 주소표시줄 변경 X 내부적 변경 > 404나오면 포워드 주석처리 해보고,주소도 확인
		//req.getRequestDispatcher("HelloServlet.jsp").forward(req, res);
	}
	
	public HelloServlet() {
		// TODO Auto-generated constructor stub
	}

}
