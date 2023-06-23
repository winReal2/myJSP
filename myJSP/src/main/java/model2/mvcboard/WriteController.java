package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class WriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//페이지만 이동시켜줄거야
		resp.sendRedirect("../14MVCBoard/Write.jsp");
	}

	
	public WriteController() {
		// TODO Auto-generated constructor stub
	}

	
	
}
