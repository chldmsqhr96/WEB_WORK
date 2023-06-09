package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	private static FileDao dao;
	private FileDao(){}
	public static FileDao getIns() {
		if(dao==null) {
			dao=new FileDao();
		}
		return dao;
	}
	//업로드된 파일 정보를 DB 에 저장하는 메소드
	public boolean insert(FileDto dto) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    int rowCount = 0;
	    try {
	         conn = new DbcpBean().getConn();
	         String sql = "INSERT INTO board_file"
	               + " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
	               + " VALUES(board_file_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩할게 있으면 해주고
	         pstmt.setString(1, dto.getWriter());
	         pstmt.setString(2, dto.getTitle());
	         pstmt.setString(3, dto.getOrgFileName());
	         pstmt.setString(4, dto.getSaveFileName());
	         pstmt.setLong(5, dto.getFileSize());
	         // INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
	         rowCount = pstmt.executeUpdate();
	         } catch (Exception e) {
	        	 e.printStackTrace();
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
	
	public List<FileDto> getListALL() {
		List<FileDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = new DbcpBean().getConn();
			String sql = " SELECT num, writer, title, orgFileName, saveFileName, fileSize, regdate"
					   + " FROM board_file"
					   + " ORDER BY num DESC";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				FileDto dto = new FileDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				list.add(dto);
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
		return list;
	}
	
	public int getCount() {
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT MAX(ROWNUM) as num FROM board_file";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count=rs.getInt("num");
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
		return count;
	}
	
	public List<FileDto> getList(FileDto dto) {
		List<FileDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = new DbcpBean().getConn();
			String sql = " SELECT * FROM"
	                   + " (SELECT res1.*, rownum as rnum FROM"
	                   + " (SELECT num, writer, title, orgFileName, saveFileName, fileSize, regdate"
	                   + " FROM board_file"
	                   + " ORDER BY num DESC) res1)"
	                   + " WHERE rnum BETWEEN ? AND ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum()); 
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new FileDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				list.add(dto);
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
		return list;
	}
	
	public FileDto getData(int num) {
		FileDto dto = null; // 참조값을 담을 객체를 미리 생성
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT writer, title, orgFileName, saveFileName, fileSize, regdate"
					   + " FROM board_file"
					   + " WHERE num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new FileDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
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
		return dto; // FileDto로 생성되었기 때문에 FileDto 타입으로 리턴이 되야만 한다.
	}
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
	    int rowCount = 0;
		
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_file"
					   + " WHERE num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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