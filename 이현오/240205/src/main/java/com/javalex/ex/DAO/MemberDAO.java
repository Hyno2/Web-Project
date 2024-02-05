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
	// DB에 연결하기 위한 필드들 초기화
	private Connection conn = null;
	private Statement st = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;

	private DataSource ds = null;

	// jdbc 드라이버로 mysql 연결
	public MemberDAO() {
		try {
			// jdbc 드라이버 로드
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			System.out.println("MemberDAO 생성자 에러");
			e.printStackTrace();
		}
	}

	// 회원가입
	public void MemberInsert(String id, String pw, String name, String hp, String email) {
		conn = null;
		ps = null;

		try {
			// DB 연결
			conn = ds.getConnection();

			// INSERT 구문 수행
			String query = "INSERT INTO user VALUES (?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setString(4, hp);
			ps.setString(5, email);

			// DB에 쿼리문 업데이트
			ps.executeUpdate();
			// 예외 처리
		} catch (Exception e) {
			System.out.println("Insert 쿼리 수행 실패");
			e.printStackTrace();
		} finally {
			try {
				// 객체를 닫아서 초기화시켜줘야 꼬임 방지
				ps.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}

	// 회원탈퇴
	public void MemberDelete(String id) {
		conn = null;
		ps = null;
		try {
			// DB 연결
			conn = ds.getConnection();

			// DELETE 구문 수행
			String query = "DELETE FROM user WHERE id= ?";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			// DB에 쿼리문 업데이트
			ps.executeUpdate();
			// 예외 처리
		} catch (Exception e) {
			System.out.println("Delete 쿼리 수행 실패");
			e.printStackTrace();
		} finally {
			try {
				// 객체를 닫아서 초기화시켜줘야 꼬임 방지
				ps.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}

	// 마이페이지에서 아이디로 회원정보들 출력
	public ArrayList<MemberDTO> MemberSelectById(String userId) {
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		conn = null;
		ps = null;
		rs = null;

		try {
			// DB 연결
			conn = ds.getConnection();

			// SELECT WHERE 구문 실행
			String query = "SELECT * FROM user WHERE id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, userId);
			// DB에 쿼리문 업데이트
			rs = ps.executeQuery();

			// .next() : 다음 행이 존재하는지 확인하고, 행이 있으면 반복
			while (rs.next()) {
				// dto 객체 생성
				MemberDTO dto = new MemberDTO();

				// rs에서 각 컬럼의 값들을 가져온뒤 dto에 설정
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setHp(rs.getString("hp"));
				dto.setEmail(rs.getString("email"));

				// 리스트인 result에 각 값들을 추가
				result.add(dto);
			}
			// 예외처리
		} catch (Exception e) {
			System.out.println("SELECT 쿼리 수행 실패");
			e.printStackTrace();
		} finally {
			try {
				// 객체를 닫아서 초기화시켜줘야 꼬임 방지
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("객체 닫기 실패");
				e.printStackTrace();
			}
		}
		return result;
	}

	
	public boolean MemberLogin(String id, String pw) {
		
		conn = null;
		ps = null;
		rs = null;

		try {
			// DB 연결
			conn = ds.getConnection();
			
			// SELECT WHERE 구문 실행
			String query = "SELECT * FROM user WHERE id=? AND pw=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, pw);
			// DB에 쿼리문 업데이트
			rs = ps.executeQuery();

			// DB에 값있을경우 true 없을경우 false 반환
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
			// 예외처리
		} catch (Exception e) {
			System.out.println("Login 테스트 실패");
			e.printStackTrace();
			return false;
		} finally {
			try {
				// 객체를 닫아서 초기화시켜줘야 꼬임 방지
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}

	
	
	public int selectAllId(String id) {
		int result = -1;
		conn = null;
		ps = null;
		rs = null;

		try {
			// DB 연결
			conn = ds.getConnection();
			// SELECT WHERE 구문 실행
			String query = "SELECT id from user where id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			
			// DB에 쿼리문 업데이트
			rs = ps.executeQuery();
			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
			// 예외처리
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 객체를 닫아서 초기화시켜줘야 꼬임 방지
				conn.close();
				ps.close();
				rs.close();
			} catch (Exception e2) {
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
			// DB 연결
			conn = ds.getConnection();
			// SELECT WHERE 구문 실행
			String query = "SELECT id FROM user WHERE name=? AND hp=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, hp);
			// DB에 쿼리문 업데이트
			rs = ps.executeQuery();
			
			// DB에 순차적으로 id값 확인
			if (rs.next()) {
				id = rs.getString("id");
			}
			// 예외 처리
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 객체를 닫아서 초기화시켜줘야 꼬임 방지
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
			// DB 연결
			conn = ds.getConnection();
			// SELECT WHERE 구문 실행
			String query = "SELECT pw FROM user WHERE id=? AND name=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, name);
			// DB에 쿼리문 업데이트
			rs = ps.executeQuery();
			
			// DB에 순차적으로 pw값 확인
			if (rs.next()) {
				pw = rs.getString("pw");
			}
			// 예외 처리
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 객체를 닫아서 초기화시켜줘야 꼬임 방지
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
			// DB 연결
			conn = ds.getConnection();
			// UPDATE 구문 실행
			String query = "UPDATE user SET pw=?, name=?, hp=?, email=? WHERE id=?";

			ps = conn.prepareStatement(query);
			ps.setString(1, newPassword);
			ps.setString(2, newName);
			ps.setString(3, newHp);
			ps.setString(4, newEmail);
			ps.setString(5, userId);
			// DB에 쿼리문 업데이트
			ps.executeUpdate();
			// 예외 처리
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				// 객체를 닫아서 초기화시켜줘야 꼬임 방지
				conn.close();
				ps.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	// 게스트 이메일 저장하는 메소드
	public void GuestInsert(String guestEmail) {
		conn = null;
		ps = null;

		try {
			// DB 연결
			conn = ds.getConnection();

			// 게스트 이메일 INSERT 구문 수행
			String query = "INSERT INTO guest VALUES (?)";
			ps = conn.prepareStatement(query);
			
			ps.setString(1, guestEmail);

			// DB에 쿼리문 업데이트
			ps.executeUpdate();
			
			// 예외 처리
		} catch (Exception e) {
			System.out.println("Insert 쿼리 수행 실패");
			e.printStackTrace();
		} finally {
			try {
				// 객체를 닫아서 초기화시켜줘야 꼬임 방지
				ps.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}
	
	
	
	
	
}
