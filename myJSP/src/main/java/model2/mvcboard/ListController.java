package model2.mvcboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
//컨트롤러의 역할을 위해 상속받음
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListController extends HttpServlet{
//doget은 서비스가 호출
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 2. 리스트 조회  (3. 14번폴더 : list.jsp 화면으로 이동)
		MVCBoardDao dao = new MVCBoardDao();
		List<MVCBoardDto> list = dao.getList();
		//리스트 조회가 궁금하다면
		System.out.println("list : " + list.size());
		
		// request영역에 저장
		req.setAttribute("list", list);
		
		// 화면 페이지 전환 
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
		
	}
	
	public ListController() {
		// TODO Auto-generated constructor stub
	}

}
