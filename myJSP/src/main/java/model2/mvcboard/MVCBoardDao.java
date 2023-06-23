package model2.mvcboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;
import dto.Board;
import dto.Criteria;

public class MVCBoardDao {

	public MVCBoardDao() {
		// TODO Auto-generated constructor stub
	}

	// 총건수 조회
	public int totalCount() {
		int res = 0;
		
		return res;
	}

	// 1. 목록 조회 (criteria추천)  (2.리스트 조회 listController에서)
	public List<MVCBoardDto> getList(Criteria cri){
		List<MVCBoardDto> list = new ArrayList<MVCBoardDto>();
		//쿼리 수정
		String sql = "select * from mvcboard ";
		
		//검색어가 null이 아니라면 검색 기능을 추가
		if(cri.getSearchWord() != null && !(cri.getSearchWord()).equals("")) {
			sql += "where " + cri.getSearchField() 
				+ " like '%" + cri.getSearchWord() + "%'";
		}
		sql += "order by idx desc";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			ResultSet rs = psmt.executeQuery();
			
			//while문 이용, if문 사용시 한건 반환
			while(rs.next()) {
				MVCBoardDto dto = new MVCBoardDto(rs.getString("idx")
												, rs.getString("name")
												, rs.getString("title")
												, rs.getString("content")
												, rs.getString("postdate")
												, rs.getString("ofile")
												, rs.getString("sfile")
												, rs.getInt("downcount")
												, rs.getString("pass")
												, rs.getInt("visitcount")
												);
				list.add(dto);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//검색 처리 > 페이징 처리  (목록조회 + 페이징) 뭐리문수정 rownum
	public List<MVCBoardDto> getListPage(Criteria cri){
		List<MVCBoardDto> list = new ArrayList<MVCBoardDto>();
		//쿼리 수정
		String sql = 
				"select * from ("
				+ "    select tb.*, rownum rn from ("
				+ " 	    select * from mvcboard ";
		
		//검색어가 null이 아니라면 검색 기능을 추가
		if(cri.getSearchWord() != null && !(cri.getSearchWord()).equals("")) {
			sql += "where " + cri.getSearchField() 
				+ " like '%" + cri.getSearchWord() + "%'";
		}
		sql += " order by idx desc"
				+ " ) tb"
				+ " )"
				+ " where rn between ? and ?";
		System.out.println("검색 sql : " + sql);
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			// 페이징 처리 - 시작번호와 끝번호를 입력 (?에 대한 답 psmt로)
			psmt.setInt(1, cri.getStartNo());
			psmt.setInt(2, cri.getEndNo());
	
			ResultSet rs = psmt.executeQuery();
			
			//while문 이용, if문 사용시 한건 반환
			while(rs.next()) {
				MVCBoardDto dto = new MVCBoardDto(rs.getString("idx")
												, rs.getString("name")
												, rs.getString("title")
												, rs.getString("content")
												, rs.getString("postdate")
												, rs.getString("ofile")
												, rs.getString("sfile")
												, rs.getInt("downcount")
												, rs.getString("pass")
												, rs.getInt("visitcount")
												);
				list.add(dto);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	//====================================================================

	public int getTotalCnt(Criteria criteria) {
		int totalCnt = 0;

		
		String cntSql = "select count(*) from mvcboard ";
				if(criteria.getSearchWord() != null && !"".equals(criteria.getSearchWord())) {
				cntSql	+= "where "+criteria.getSearchField()+" like '%"+criteria.getSearchWord()+"%' ";
				}
				cntSql	+= "order by idx desc";					
		
				System.out.println(cntSql);
				
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

	public MVCBoardDto selectOne(String idx) {
		//dto객체 생성
		MVCBoardDto dto = new MVCBoardDto();
		String sql = "select * from mvcboard where idx = ? ";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setString(1, idx); //=>selectOne의 파라메터값으로 String idx로줘야 사용가능!
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getString(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
			}
				
		} catch (SQLException e) {
			System.out.println("게시물 상세보기 조회중 오류가 발생");
			e.printStackTrace();
		}
		//return null 바꾸끼
		return dto;
	}

	
	public boolean confirmPassword(String pass, String idx) {
		boolean res = false;
		String sql = "select * from mvcboard where idx = ? and pass = ?";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setString(1, idx);
			psmt.setString(2, pass);
			
			ResultSet rs = psmt.executeQuery();
			
			res = rs.next();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return res;
	}

	public int delete(String idx) {
		int res = 0;
		
		String sql = "delete from mvcboard where idx = ?";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setString(1, idx);
			
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	
	
	
}
