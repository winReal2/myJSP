package model2.mvcboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;
import dto.Board;

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
	public List<MVCBoardDto> getList(){
		List<MVCBoardDto> list = new ArrayList<MVCBoardDto>();
		
		String sql = "select * from mvcboard order by idx desc";
		
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
	
	
	public MVCBoardDto selectOne(String idx) {
		String sql = "select * from board where idx=?";
		MVCBoardDto dto = null;
		
		System.out.println("num : " + idx);
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, idx);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new MVCBoardDto();
				dto.setIdx(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getInt("visitcount"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
		
	}
	
	
	

	
	
	
}
