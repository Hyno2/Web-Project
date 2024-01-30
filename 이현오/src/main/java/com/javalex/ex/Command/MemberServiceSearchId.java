package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;

public class MemberServiceSearchId implements MemberService {
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
	    MemberDAO userDAO = new MemberDAO();
	    String name = request.getParameter("name");
	    String tel = request.getParameter("hp");
	    return userDAO.IdSearch(name, tel, request, response);
	}
}