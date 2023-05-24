package test.guest.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import test.guest.dto.GuestDto;
import test.util.DbcpBean;

public class GuestDao {
	private static GuestDao dao;
	private GuestDao() {}
	public static GuestDao getIns() {
	   if(dao==null) {
	      dao=new GuestDao();
	   }
	   return dao;
	}
	
	public List<GuestDto> getList(){
		List<GuestDto> list=new ArrayList<>();	   
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		   try {
		      conn=new DbcpBean().getConn();
		      
		      String sql="SELECT num, writer, content, regdate"
		        		+" FROM board_guest"
		        		+" ORDER BY num ASC";
		      
		      pstmt=conn.prepareStatement(sql);
		      rs=pstmt.executeQuery();
		         
		      while(rs.next()) { 
		    	  GuestDto dto = new GuestDto();
		    	  dto.setNum(rs.getInt("num"));
		    	  dto.setWriter(rs.getString("writer"));
		    	  dto.setContent(rs.getString("content"));
		    	  dto.setRegdate(rs.getString("regdate"));  
		    	  list.add(dto);
		      }
		   } catch(SQLException se) {
		         se.printStackTrace();
		   } finally {
		         try {
		            if(rs!=null)rs.close();
		            if(pstmt!=null)pstmt.close();
		            if(conn!=null)conn.close();
		         } catch(Exception e) {}
		   }
		return list;
	}
	
	public boolean delete(int num, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_guest WHERE num = ? AND pwd = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, pwd);

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
	
	public boolean insert(GuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_guest"
					   + " (num, writer, content, pwd, regdate)"
					   + " VALUES(board_guest_seq.NEXTVAL, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPwd());

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
	
	public GuestDto getData(int num) {
		GuestDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT writer, content" + " FROM board_guest" + " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new GuestDto();
				dto.setNum(num); 
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	public boolean update(GuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_guest SET writer = ?, content = ? WHERE num = ? AND pwd = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			pstmt.setString(4, dto.getPwd());

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
