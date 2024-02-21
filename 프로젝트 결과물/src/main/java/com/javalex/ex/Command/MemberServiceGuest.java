
package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;

public class MemberServiceGuest implements MemberService {
	// 인터페이스 오버라이딩 해야되서 ArrayList<MemberDTO> 로 가져옴
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response){
		// 데이터 값 초기화
		ArrayList<MemberDTO> dto=null;
	
		// DAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		String guestEmail =request.getParameter("guestEmail");
		
		
		
		dao.GuestInsert(guestEmail);
		
		return dto;
	}
}
