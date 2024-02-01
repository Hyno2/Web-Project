package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalex.ex.Session.SessionUtil;
import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;

public class MemberServiceLogin implements MemberService {
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<MemberDTO> dto = null;

		// DAO에 있는 insert 메소드만 수행
		MemberDAO dao = new MemberDAO();
		// 로그인시 필요한 id pw 만 가져온다
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		boolean tf = dao.MemberLogin(id, pw);

		// 로그인 성공 시 세션에 사용자 정보 저장
		if (tf) {

			SessionUtil.setLoginId(request, id);
			System.out.println("로그인 성공.");
			try {
				// 로그인 성공 시 index.html 페이지로 리다이렉트
				response.sendRedirect("index.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("로그인 실패.");
			try {
				// 로그인 실패 시 login.jsp 페이지로 리다이렉트
				response.sendRedirect("login.jsp?loginError=true");
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}
}
