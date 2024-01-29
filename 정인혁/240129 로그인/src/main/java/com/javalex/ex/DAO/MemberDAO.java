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
	
	public ArrayList<MemberDTO> MemberSelect(){
		ArrayList<MemberDTO> result=new ArrayList<MemberDTO>();
		conn=null;
		st=null;
		rs=null;
		
		try {
			conn = ds.getConnection();
			
			String query="SELECT * FROM user";
			st = conn.createStatement();
			rs = st.executeQuery(query);
			
			while(rs.next()) {
				MemberDTO element = new MemberDTO();
				element.setId(rs.getString("id"));
				element.setPw(rs.getString("pw"));
				element.setName(rs.getString("name"));
				element.setName(rs.getString("hp"));
				element.setName(rs.getString("email"));
				
				// element 객체에 데이터 한 묶음식 저장하기
				result.add(element);
			}			
		}catch(Exception e) {
			System.out.println("SELECT 쿼리 수행 실패");
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				st.close();
				rs.close();
			} catch(Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
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
	
	public ArrayList<MemberDTO> IdSearch(String name, String hp, HttpServletRequest request, HttpServletResponse response) {
	    ArrayList<MemberDTO> resultList = new ArrayList<>();

	    try {
	        conn = ds.getConnection();

	        // 이름 또는 휴대폰 번호가 빈 칸인 경우 처리
	        if (name == null || name.isEmpty() || hp == null || hp.isEmpty()) {
	            // 빈 칸이 있는 경우에 대한 처리 (예: 적절한 메시지 설정)
	            System.out.println("이름 또는 휴대폰 번호가 입력되지 않았습니다.");
	        } else {
	            String query = "SELECT id FROM user WHERE name=? AND hp=?";
	            ps = conn.prepareStatement(query);
	            ps.setString(1, name);
	            ps.setString(2, hp);
	            rs = ps.executeQuery();

	            while (rs.next()) {
	                // 검색 결과가 있을 때 MemberDTO 객체를 생성하여 resultList에 추가
	                MemberDTO member = new MemberDTO();
	                member.setId(rs.getString("id"));
	                resultList.add(member);
	            }

	            if (resultList.isEmpty()) {
	                // 검색 결과가 없는 경우에 대한 처리 (예: 적절한 메시지 설정)
	                System.out.println("일치하는 아이디 없음");
	            }
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

	    return resultList;
	}
}
