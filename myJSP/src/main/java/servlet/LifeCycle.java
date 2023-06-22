package servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

///13서블릿/LifeCycle.do를 가지고 jsp에서 get, post방식으로 요청
@WebServlet("/13서블릿/LifeCycle.do")
public class LifeCycle extends HttpServlet{
	
	@PostConstruct
	public void myPostConstruct() {
		System.out.println("myPostConstruct() 호출");
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("init() 호출");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service() 호출");
		//얘는 왜 혼자 super있는지?? 부모가가진 역할을 살려놓은 것 
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet() 호출");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost() 호출");
	}
	//서버에서 중지시켜야 디스트로이 나옴 (콘솔창에서 중지하면 콘솔창을 먼저 다운시켜서 그런듯?)
	@Override
	public void destroy() {
		System.out.println("destroy() 호출");
	}
	
	@PreDestroy
	private void myPredestory() {
		System.out.println("myPreDestroy() 호출");
	}
	
	public LifeCycle() {
		// TODO Auto-generated constructor stub
	}

}
