package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionUtil;
import common.DBConnPool;
import dto.Board;
import dto.Criteria;

/**
 * 
 * @author user
 *
 */
public class BoardDao {
	
	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	
	/**
	 * 게시글을 등록합니다.
	 * @return
	 */
	public int insert(Board board) {
		int res = 0;
		
		String sql = "insert into board (num, title, content, id, postdate, visitcount) "
					+ "values (seq_board_num.nextVal, ?, ?, ?, sysdate, 0)";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setString(3, board.getId());
			
			//insert, delete, update 실행후 몇 건이 처리되었는지 반환
			res = psmt.executeUpdate();

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return res;
	}
	
	
	
	
	/**
	 * 게시물의 총 개수를 반환
	 * @return 게시물의 총 개수
	 */
	public int getTotalCnt(Criteria criteria) {
		int totalCnt = 0;

		
		String cntSql = "select count(*) from board ";
				if(criteria.getSearchWord() != null && !"".equals(criteria.getSearchWord())) {
				cntSql	+= "where "+criteria.getSearchField()+" like '%"+criteria.getSearchWord()+"%' ";
				}
				cntSql	+= "order by num desc";					
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(cntSql);){
			ResultSet rs = psmt.executeQuery(cntSql);
			
			rs.next();
			totalCnt = rs.getInt(1);   //첫번째 컬럼의 값을 반환
			
			rs.close();
		} catch (SQLException e) {
			System.out.println("총 게시물의 수를 조회하던 중 예외가 발생하였습니다.");
			e.printStackTrace();
		}
	
		return totalCnt;
	}
	
	
	
	/**
	 * (검색조건과 검색어를 파라메터로 받아서 
	 * 게시글 목록을 조회합니다.
	 * @param searchField : 검색조건
	 * @param searchWord : 검색어
	 * @return List<Board> : 게시글 목록
	 */
	//Board(게시물)을 담고 있는 리스트
	public List<Board> getList(String searchField, String searchWord) {
		//list(리스트) 생성 후 반환
		List<Board> boardList = new ArrayList<>();
		
		String sql = "select * "
					+ "from board ";
			//검색어가 입력되었으면 검색조건을 추가
			if(searchWord != null && !"".equals(searchWord)) {
				
				sql		+= "where "+searchField+" like '%"+searchWord+"%' ";				
			}
			sql		+= "order by num desc";
			
		
		//검색조건 추가
		try (Connection conn = DBConnPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);){
			ResultSet rs = psmt.executeQuery(sql);
				
				while(rs.next()) {
					
					//게시물의 한 행을 읽어서 보드 DTO에 저장
					Board board = new Board();
					
					
					board.setNum(rs.getString("num"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setId(rs.getString("id"));
					board.setPostdate(rs.getString("postdate"));
					board.setVisitcount(rs.getString("visitcount"));
		
					boardList.add(board); //결과 목록에 저장

				}
		} catch (SQLException e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return boardList;
	}
	
	
	/**
	 * 게시글 번호를 입력받아 게시글을 조회합니다.
	 * @param num
	 * @return
	 */
	public Board selectOne(String num) {
		Board board = null;
		String sql = "select * from board where num = ?";
		
		if( num == null || "".equals(num)) {
			return null;
		}
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			psmt.setString(1, num);
			
			ResultSet rs = psmt.executeQuery();  //executeUpdate는 int 타입반환
			
			// 1건의 게시글을 조회하여 board 객체에 담아줍니다  (board 생성은 상단에서 세팅은 글이 있을 때만)
			if(rs.next()) {
				board = new Board();
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setPostdate(rs.getString("postdate"));
				board.setVisitcount(rs.getString("visitcount"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return board;
	}

	
	/**
	 * 게시물의 조회수를 1 증가 시킵니다
	 * @param num : 게시물 번호
	 * @return 업데이트된 게시물 건수
	 */
	public int updateVisitCount(String num) {
		int res=0;
		String sql="update board set visitcount = visitcount+1 where num= ? ";
		
		try (Connection con = DBConnPool.getConnection();
				PreparedStatement psmt = con.prepareStatement(sql);) {
			psmt.setString(1, num);
			
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	
	//board객체에 담아서 매개변수 자리에 작성 (String title, String content 이런거 X)
	/**
	 * 게시물 수정하기
	 * @param board
	 * @return
	 */
	public int update(Board board) {
		int res = 0;
		String sql=" update board set title = ?, content = ? where num = ?";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setString(3, board.getNum());
			
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return res;
	}
	
	
	public int delete(Board board) {
		int res=0;
		String sql="delete from board where num=?";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt =  conn.prepareStatement(sql);){
			
			psmt.setString(1, board.getNum());
			
			res = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
		
	}
	
	public List<Board> getListPage(Criteria criteria) {
		//list(리스트) 생성 후 반환
		List<Board> boardList = new ArrayList<>();
		
		String sql = ""
					+ "select * from ("
					+ "		select rownum rn, t.* from( "
					
					+"select board.* "
					+ " from board ";
			//검색어가 입력되었으면 검색조건을 추가
			if(criteria.getSearchWord() != null && !"".equals(criteria.getSearchWord())) {
				
				sql		+= "where "+criteria.getSearchField()+" like '%"+criteria.getSearchField()+"%' ";				
			}
			sql		+= "order by num desc"
					+ ")t )"
					+ " where rn between " + criteria.getStartNo()
					+ " and " + criteria.getEndNo();
			
		
		//검색조건 추가
		try (Connection conn = DBConnPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);){
			ResultSet rs = psmt.executeQuery(sql);
				
				while(rs.next()) {
					
					//게시물의 한 행을 읽어서 보드 DTO에 저장
					Board board = new Board();
					
					
					board.setNum(rs.getString("num"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setId(rs.getString("id"));
					board.setPostdate(rs.getString("postdate"));
					board.setVisitcount(rs.getString("visitcount"));
		
					boardList.add(board); //결과 목록에 저장

				}
		} catch (SQLException e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return boardList;
	}
	
	
	
}





















