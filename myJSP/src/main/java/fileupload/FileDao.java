package fileupload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class FileDao {
	public FileDao() {
		// TODO Auto-generated constructor stub
	}

	//입력하고 리스트 출력 2가지만 한다
	//파일 정보를 저장 합니다.
	public int insertFile(FileDto dto) {
		int res = 0;
		
		String sql = "insert into myfile(idx, name, title, cate, ofile, sfile) values(seq_board_num.nextval,"
				+ "                        ?, ?, ?, ?, ?)";  // ? 에는 ''따옴표로 묶지 않는다!!!
		// conn
		// 쿼리생성
		// 그 쿼리를 실행
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt =  conn.prepareStatement(sql);){
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			res = psmt.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return res;
	}
	
	
	// 파일 목록을 조회 합니다.
	public List<FileDto> getFileList(){
		List<FileDto> list = new ArrayList<FileDto>();
		
		String sql = "select * from myfile order by idx desc";
		
		// conn
		// 쿼리생성
		// 그 쿼리를 실행
		// 결과 집합을 담는다
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt =  conn.prepareStatement(sql);){
			ResultSet rs = psmt.executeQuery();	//쿼리 실행		
			
			while(rs.next()) {  //목록 안의 파일 수 만큼 반복
				//DTO에 저장
				FileDto dto = new FileDto();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));

				list.add(dto); //목록에 추가
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
