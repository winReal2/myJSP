package model2.mvcboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MVCBoardDao dao = new MVCBoardDao();
		List<MVCBoardDto> list = dao.getList();
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("/14MVCBoard/View.jsp").forward(req, resp);
	}
	
	public ViewController() {
		// TODO Auto-generated constructor stub
	}

}
