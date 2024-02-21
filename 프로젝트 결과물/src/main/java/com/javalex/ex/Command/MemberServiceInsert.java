package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;

public class MemberServiceInsert implements MemberService {
	// 인터페이스 오버라이딩 해야되서 ArrayList<MemberDTO> 로 가져옴
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response){
		// 데이터 값 초기화
		ArrayList<MemberDTO> dto=null;
	
		// DAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String hp=request.getParameter("hp");
		String emailId=request.getParameter("email_id");
		String emailDomain = request.getParameter("email_domain");
		
		// DB에 email이라고 한 칼럼밖에없으므로 두개를 합쳐준다
		String email=  emailId + "@" + emailDomain;
		
		dao.MemberInsert(id, pw, name,hp, email);
		
		return dto;
	}
}
