package com.javalex.ex.DAO;

import java.sql.*;
import javax.sql.DataSource;

import com.javalex.ex.DTO.MemberDTO;

import java.util.*;
import javax.naming.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDAO {
	private Connection conn = null;
	private Statement st = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	private DataSource ds = null;
	
	public MemberDAO() {
		try {
			// jdbc 드라이버 로드
			Context ctx=new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		}catch(Exception e) {
			System.out.println("MemberDAO 생성자 에러");
			e.printStackTrace();
		}
	}
	
	public void MemberInsert(String id, String pw, String name, String hp, String email) {
		conn = null;
		ps = null;
		// ds는 초기화하면 DB 접속에 문제가 생김...
		try {
			// DB 접속
			conn = ds.getConnection();
			
			// INSERT 구문 수행
			String query="INSERT INTO user VALUES (?,?,?,?,?)";
			ps=conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setString(4, hp);
			ps.setString(5, email);
			
			ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("Insert 쿼리 수행 실패");
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				conn.close();
			} catch(Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}
	
	public void MemberDelete(String id) {
		conn = null;
		ps = null;
		try {
			// DB 접속
			conn = ds.getConnection();
			
			// DELETE 구문 수행
			String query="DELETE FROM user WHERE id= ?";
			ps=conn.prepareStatement(query);
			ps.setString(1, id);
			ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("Delete 쿼리 수행 실패");
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				conn.close();
			} catch(Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}
	

	public ArrayList<MemberDTO> MemberSelectById(String userId) {
	    ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        conn = ds.getConnection();
	        String query = "SELECT * FROM user WHERE id=?";
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, userId);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            MemberDTO element = new MemberDTO();
	            element.setId(rs.getString("id"));
	            element.setPw(rs.getString("pw"));
	            element.setName(rs.getString("name"));
	            element.setHp(rs.getString("hp"));
	            element.setEmail(rs.getString("email"));

	            result.add(element);
	        }
	    } catch (Exception e) {
	        System.out.println("SELECT 쿼리 수행 실패");
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            System.out.println("객체 닫기 실패");
	            e.printStackTrace();
	        }
	    }
	    return result;
	}
	
	public boolean MemberLogin(String id, String pw) {
		conn=null;
		ps=null;
		rs=null;
		
		try {
			conn=ds.getConnection();
			
			String query="SELECT * FROM user WHERE id=? AND pw=?";
			ps=conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			
			if(rs.next()) {return true;}
			else {return false;}
			
		}catch(Exception e) {
			System.out.println("Login 테스트 실패");
			e.printStackTrace();
			return false;
		} finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			}catch(Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}
	
	public int selectAllId(String id) {
		int result = -1;
		conn=null;
		ps=null;
		rs=null;
		
		try {
			conn=ds.getConnection();
			
			String query = "SELECT id from user where id=?";
			ps=conn.prepareStatement(query);
			ps.setString(1, id);
			rs= ps.executeQuery();
			if(rs.next()) {
				result=1;
			}
			else {
				result=0;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				ps.close();
				rs.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	// 아이디 찾기 
		public String searchId(String name, String hp) {
	        conn = null;
	        ps = null;
	        rs = null;
	        String id = null;

	        try {
	            conn = ds.getConnection();
	            String query = "SELECT id FROM user WHERE name=? AND hp=?";
	            ps = conn.prepareStatement(query);
	            ps.setString(1, name);
	            ps.setString(2, hp);
	            rs = ps.executeQuery();

	            if (rs.next()) {
	                id = rs.getString("id");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                conn.close();
	                ps.close();
	                rs.close();
	            } catch (Exception e2) {
	                e2.printStackTrace();
	            }
	        }

	        return id;
	    }
	
	// 비밀번호 찾기 
		public String searchPw(String id, String name) {
	        conn = null;
	        ps = null;
	        rs = null;
	        String pw = null;

	        try {
	            conn = ds.getConnection();
	            String query = "SELECT pw FROM user WHERE id=? AND name=?";
	            ps = conn.prepareStatement(query);
	            ps.setString(1, id);
	            ps.setString(2, name);
	            rs = ps.executeQuery();

	            if (rs.next()) {
	                pw = rs.getString("pw");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                conn.close();
	                ps.close();
	                rs.close();
	            } catch (Exception e2) {
	                e2.printStackTrace();
	            }
	        }

	        return pw;
	    }
		
		// 수정하기
		public void updateUserInfo(String userId, String newPassword, String newName, String newHp, String newEmail) {
		    conn = null;
		    ps = null;

		    try {
		        conn = ds.getConnection();

		        String sql = "UPDATE user SET pw=?, name=?, hp=?, email=? WHERE id=?";

		        ps = conn.prepareStatement(sql);
		        ps.setString(1, newPassword);
		        ps.setString(2, newName);
		        ps.setString(3, newHp);
		        ps.setString(4, newEmail);
		        ps.setString(5, userId);

		        ps.executeUpdate();
		     
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        try {
		            conn.close();
		            ps.close();
		        } catch (Exception e2) {
		            e2.printStackTrace();
		        }
		    }
		}
}
