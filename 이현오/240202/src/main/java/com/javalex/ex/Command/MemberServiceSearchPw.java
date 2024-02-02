package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;

public class MemberServiceSearchPw implements MemberService {
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setContentType("text/html; charset=UTF-8");
		
		// 아이디 ,이름
		String id = request.getParameter("id");
		String name = request.getParameter("name");

		// dao 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// dao에 pw찾는 메소드(searchPw) 아이디와 이름에 대입하여 실행
		String pw = dao.searchPw(id, name);
		
		// 결과변수를 ArrayList<MemberDTD> 형태로 만든 객체 생성
		ArrayList<MemberDTO> result = new ArrayList<>();

		// 비밀번호 찾기 성공
		if (pw != null && !pw.isEmpty()) {
			try {
				response.getWriter().println("<script>alert('비밀번호는 " + pw + " 입니다.'); window.close(); </script>");
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 비밀번호 찾기 실패
		} else {
			try {
				response.getWriter().println("<script>alert('일치하는 정보가 없습니다.'); window.close(); </script>");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 결과 리스트를 반환
		return result;
	}

}
