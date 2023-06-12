package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.ConnectionUtil;
import dto.Member;
import oracle.jdbc.driver.DBConversion;

public class MemberDao {

	public MemberDao() {
		
	}
	/**
	 * 로그인
	 * 아이디/비밀번호가 일치하는 회원을 조회합니다.
	 * 
	 * 회원이 존재하는 경우 Member객체 반환
	 * 		존재하지 않는 경우 null 반환
	 * 
	 * @param id : 입력한 회원id
	 * @param pw : 입력한 회원pw
	 * @return
	 */
	//login하고 멤버객체 반환
	public Member login(String id, String pw) {
		Member member = null;
		String sql = "SELECT * FROM MEMBER WHERE ID=? AND PASS=?";
		
		// 리소스를 자동 반환
		// ()여기서 생성된 리소스(자원)를 트라이문이 끝나면 자동으로 반납 (close()해준다~)
		try (Connection con = ConnectionUtil.getConnection();
				PreparedStatement psmt = con.prepareStatement(sql);){
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			ResultSet rs = psmt.executeQuery();
			
			//if(조회된 결과가 있으면)
			// 아이디/비밀번호가 일치하는 회원이 있으면 조회
			if(rs.next()) {
				String loginId = rs.getString("id");
				String name = rs.getString("name");
				String regidate = rs.getString("regidate");
				member = new Member(loginId, "", name, regidate);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return member;
	}
	
	/**
	 * 회원등록
	 * @param member
	 * @return 몇 건이 처리되었는지 반환
	 */
	public int insert(Member member) {
		int i = 0;
		String sql = "insert into member values(?, ?, ?, sysdate)";
		
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setString(1,  member.getId());
			psmt.setString(2,  member.getPass());
			psmt.setString(3,  member.getName());
			
			i = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
}














