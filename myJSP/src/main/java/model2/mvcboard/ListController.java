package model2.mvcboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
//컨트롤러의 역할을 위해 상속받음
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;

public class ListController extends HttpServlet{

	
	//doget은 서비스가 호출
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 2. 리스트 조회  (3. 14번폴더 : list.jsp 화면으로 이동)  / 페이지 정보 수정 후 dao로 이동
		MVCBoardDao dao = new MVCBoardDao();
		
		/*
		int pageNo = 1;
		if(req.getParameter("pageNo") != null) {
			//오류처리에 도움
			try {
				Integer.parseInt(req.getParameter("pageNo"));							
			} catch (Exception e) {
				System.out.println("페이지 번호를 숫자로 변환중 오류 발생");
				System.out.println("pageNo : " + req.getParameter("pageNo").toString());
				//오류가 발생한 채 끝게하지 않기위해
				pageNo = 1;
			}
		}
		*/
		
		// <검색어, 페이지 정보 세팅 / Criteria Dao에 생성>
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		String pageNo = req.getParameter("pageNo");
				
		Criteria cri = new Criteria(searchField, searchWord, pageNo);
		
		System.out.println("======페이지 관련 파라메터====");
		System.out.println(cri.getPageNo());
		System.out.println(cri.getStartNo());
		System.out.println(cri.getEndNo());
		System.out.println("========================");
		
		cri.setSearchField(req.getParameter("searchField"));
		cri.setSearchWord(req.getParameter("searchWord"));
		
		// Criteria객체를 만들어서 객체를 넣어준다 > change메서드로 빨간 줄 해결
		// 검색어, 페이지 정보를 담은 객체를 매개변수로 넣어줍니다.
		//List<MVCBoardDto> list = dao.getList(cri);
		List<MVCBoardDto> list = dao.getListPage(cri);
		
		//리스트 조회가 궁금하다면
		System.out.println("list : " + list.size());
		int totalCnt = dao.getTotalCnt(cri);
		
		// 페이지 네비게이션 생성을 위해 pageDto생성
		PageDto pageDto = new PageDto(totalCnt, cri); 
		
		// request영역에 저장
		req.setAttribute("list", list);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("pageDto", pageDto);
		
		// 화면 페이지 전환 
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
		
	}
	
	public ListController() {
		// TODO Auto-generated constructor stub
	}
	

	
	

}
