package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalex.ex.Session.SessionUtil;
import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;

public class MemberServiceLogin implements MemberService{
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response){
		ArrayList<MemberDTO> dto=null;
		
		// DAO에 있는 insert 메소드만 수행
		MemberDAO dao=new MemberDAO();
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		boolean tf=dao.MemberLogin(id, pw);
		
		System.out.print("로그인 테스트 결과: ");
		if(tf==true) {
			// 로그인 성공시 세션에 사용자 정보 저장
			SessionUtil.setLoginId(request, id);	
			System.out.println("로그인 성공.");
		}
		else {
			System.out.println("로그인 실패.");
		}
		
		return dto;
	}
}
