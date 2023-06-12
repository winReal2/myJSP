package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class ConnectionUtil {

	public ConnectionUtil() {
		
	}

	/**
	 * DB Connection을 반환합니다.
	 * @return
	 */
	public static Connection getConnection() {
		// 대부분 설정정보를 소스안에 넣는걸 좋아하지 않음 (이런걸 하드코딩) 그래서 설정파일을 외부로 뺀다
		// 시스템에서 변경될 수 있는 정보들
		
		// '접속정보'를 알아야 데이터베이스에 접근할 수 있다  @ ip : port : sid
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "jsp";
		String pw = "1234";
	
		Connection conn = null;

		//커넥션 생성 로직 작성
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 커넥션 생성 
			conn = DriverManager.getConnection(url, id, pw);
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.err.println("라이브러리 로드중 오류가 발생 하였습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return conn;
	}
	//=====================================================
	// 접속정보를 설정파일에 심어놓고 설정파일을 가져다 쓰는 방법도 공부
	/**
	 * web.xml파일의 컨텍스트 초기화 매개변수를 읽어서 
	 * DB접속정보를 설정
	 * @param application
	 * @return
	 */
	//application을 매개변수로 받는다
	//(application은 웹서버(톰캣)이 실행된 다음 설정파일 읽어서 그 내용을 읽어들인다)
	public static Connection getConnection(ServletContext application) {
		Connection conn = null;
		
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleUrl");
		String id = application.getInitParameter("OracleId");
		String pw = application.getInitParameter("OraclePw");
		
		/*
		System.out.println(driver);
		System.out.println(url);
		System.out.println(id);
		System.out.println(pw);
		*/
		
		
		

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,id, pw);
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.err.println("라이브러리 로드 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
		return conn;
	}
	
	
	
//========================================================================	
	//메인메서드로 실행(우클릭 > 런애즈 > 자바 어플리케이션)
	/**
	 * 커넥션 생성 테스트
	 * @param args
	 */
	public static void main(String[] args) {
		String sql = "select to_char(sysdate, 'yyyy-mm-dd') today from dual";
		
		//자원생성을 자동으로 닫게끔 try옆 괄호에 넣어줌
		try(Connection con = getConnection();
				PreparedStatement psmt = con.prepareStatement(sql);) {
			
			ResultSet rs = psmt.executeQuery();   // 쿼리문 실행
			
			rs.next();
			String today = rs.getString(1);
			// rs.getString("today"); => 문자나 숫자를 넣어줄 수 있음
			
			System.out.println("오늘 날짜 : " + today);
			
			rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//클로즈 메서드!
	public static void close(Connection conn) {
			try {
				if(conn != null && !conn.isClosed()) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	//state는 sql로 임포트 받아야함
	public static void close(Connection conn, Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) stmt.close();
			if(conn != null && !conn.isClosed()) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs != null && !rs.isClosed()) rs.close();
			if(stmt != null && !stmt.isClosed()) stmt.close();
			if(conn != null && !conn.isClosed()) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

















