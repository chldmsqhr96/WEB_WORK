package test.users.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	// 스태틱 필드에 private(외부에서 객체 생성안되게)로 dao 필드 생성
	private static UsersDao dao;
	// 기본 생성자 생성
	private UsersDao () {}
	
	// 참조값을 리턴해주는 스태틱 메소드 생성
	public static UsersDao getIns() {
		if(dao==null) {
			dao=new UsersDao();
		}
		return dao;
	}
	
	//인자로 전달되는 dto 에 있는 아이디와, 비밀번호를 이용해서 해당 정보가 유효한 정보인지 여부를 리턴하는 메소드 
	public boolean isValid(UsersDto dto) {
	      
	    //아이디 비밀번호 유효성 여부를 담을 변수 만들고 초기값 false 부여하기
	    boolean isValid=false;
	      
	    //필요한 객체를 담을 지역변수를 미리 만들어 둔다. 
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	         //Connection Pool 에서 Connection 객체를 하나 얻어온다.
	         conn = new DbcpBean().getConn();
	         //실행할 sql 문의 뼈대 구성하기
	         String sql = "SELECT id"
	               + " FROM users"
	               + " WHERE id=? AND pwd=?";
	         //sql 문의 ? 에 바인딩 할게 있으면 한다
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getId());
	         pstmt.setString(2, dto.getPwd());
	         //SELECT 문을 수행하고 결과값을 받아온다.
	         rs = pstmt.executeQuery();
	         //SELECT 된 ROW 가 있는지 확인해 본다.
	         if (rs.next()) {
	            //SELECT 된 row 가 있다면 유효한 정보가 맞다.
	            isValid=true;
	         }
	    } catch (Exception e) {
	         e.printStackTrace();
	    } finally {
	         try {
	            if (rs != null)
	               rs.close();
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close(); //Connection Pool 에 Connection 반납하기
	         } catch (Exception e) {
	         }
	    }
	    return isValid;
	}
	
	public boolean insert(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO users"
					   + " (id, pwd, email, regdate)"
					   + " VALUES(?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public UsersDto getData(String id) {
		UsersDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT pwd, email, profile, regdate"
					   + " FROM users"
					   + " WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegdate(rs.getString("regdate"));
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	public boolean updateProfile(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE users SET profile = ? WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getProfile());
			pstmt.setString(2, dto.getId());
			rowCount = pstmt.executeUpdate();
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean updatePwd(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE users SET pwd = ? WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getId());
			rowCount = pstmt.executeUpdate();
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE users SET email = ?, profile = ? WHERE id = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getProfile());
			pstmt.setString(3, dto.getId());

			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
}