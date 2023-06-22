package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.Member;

//클래스를 서블릿으로 바꾸려면 상속! + url(경로)로 매핑
// @WebServlet("")
public class MemberAuth extends HttpServlet {
	
	MemberDao dao;
	
	@Override
	public void init() throws ServletException {
		dao = new MemberDao();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String admin_id = this.getInitParameter("admin_id");
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		Member member = dao.login(id, pw);
		
		if(member != null) {
			req.setAttribute("authMessage", member.getName() + "회원님 반갑습니다.");
			
			if(member.getId().equals(admin_id)) {
				req.setAttribute("authMessage", admin_id + "님은 관리자 입니다.");
			}
			
		} else {
			req.setAttribute("authMessage", member.getName() + "로그인 실패");
		}
		
		req.getRequestDispatcher("/13서블릿/MemberAuth.jsp").forward(req, resp);
		//resp.sendRedirect("/13서블릿/MemberAuth.jsp");
	}
	
	public MemberAuth() {
		// TODO Auto-generated constructor stub
	}

}
