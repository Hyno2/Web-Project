package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;

public class MemberServiceInsert implements MemberService {
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response){
		ArrayList<MemberDTO> dto=null;
	
		// DAO에 있는 insert 메소드만 수행
		MemberDAO dao = new MemberDAO();
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String hp=request.getParameter("hp");
		String emailId=request.getParameter("email_id");
		String emailDomain = request.getParameter("email_domain");
		String email=  emailId + "@" + emailDomain;
		dao.MemberInsert(id, pw, name,hp, email);
		
		return dto;
	}
}
