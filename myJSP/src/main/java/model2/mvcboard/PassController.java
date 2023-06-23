package model2.mvcboard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSPFunction;

/**
 * Servlet implementation class PassController
 */
@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassController() {
        super();
        // TODO Auto-generated constructor stub
    }
    //service메서드에 따라 get, post 분기시켜줌
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	super.service(req, resp);
    }
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//mode :  수정(edit), 삭제(delete)
		//mode값을 받아 리퀘스트영역에 저장!
		request.setAttribute("mode", request.getParameter("mode"));
		request.setAttribute("idx", request.getParameter("idx"));
		
		//페이지 전환
		request.getRequestDispatcher("../14MVCBoard/Pass.jsp").forward(request, response);
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 수정, 삭제 컨트롤러로 이동시켜주려고 함
		// 이 값들이 post로 넘어올때  name 속성을 가지고 온다
		String idx = request.getParameter("idx");  
		String mode = request.getParameter("mode");
		String pass = request.getParameter("pass");
		
		//비밀번호일치하는지 확인하는 매서드를 다오에 만들고 그 매서드 호출
		MVCBoardDao dao = new MVCBoardDao();
		
		//패스워드와 인덱스에 맞는 값이 있으면 res해서 결과 확인
		//게시글의 비밀번호가 일치하는지 확인
		boolean confirmed = dao.confirmPassword(pass, idx);
		
		if(confirmed) {
			//비밀번호 체크 성공
			System.out.println("비밀번호 검증 성공!");
			//삭제 수정 여부
			if(mode.equals("edit")) {
				//수정 (edit콘트롤러로 이동
				response.sendRedirect("../mvcboard/edit.do?idx="+idx); //=>컨트롤러가 다른 컨트롤러 부름
			} else if(mode.equals("delete")) {
				//삭제
				int res = dao.delete(idx);
				if(res > 0 ) {
					//삭제성공
					JSPFunction.alertLocation(response, "../mvcboard/list.do", "삭제되었습니다." );
				} else {
					// 게시물 삭제실패
					// 메세지 처리후 이전화면으로
					JSPFunction.alertBack(response, "게시물 삭제에 실패했습니다. 관리자에게 문의하세요");
					
				}
				
			} else {
			//비밀번호 체크 실패  / out객체가 없음 그래서 또 다른 function 만들어야... (jsp에선 내장객체)
			JSPFunction.alertBack(response, "비밀번호 검증에 실패했습니다.");
			}
		}
	}
}
