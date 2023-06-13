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

public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	
	/**
	 * 게시물의 총 개수를 반환
	 * @return
	 */
	public int getTotalCnt() {
		int totalCnt = 0;
		
		String cntSql = "select count(*) from board order by num desc";
		
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
	 * 게시글을 조회합니다.
	 * @return List<Board>
	 */
	//Board(게시물)을 담고 있는 리스트
	public List<Board> getList() {
		//list(리스트) 생성 후 반환
		List<Board> boardList = new ArrayList<>();
		
		String sql = "select * from board order by num desc";
		
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



















