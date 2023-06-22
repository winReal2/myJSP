package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/12파일업로드/FileListServlet.do")
public class FileListServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("message", "FileListServlet.do 호출");
		req.getRequestDispatcher("FileList.jsp").forward(req, res);
	}
	
	public FileListServlet() {
		// TODO Auto-generated constructor stub
	}

}
