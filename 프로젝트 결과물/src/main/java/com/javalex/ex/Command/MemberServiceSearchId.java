package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;

public class MemberServiceSearchId implements MemberService {
	 public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		 	response.setContentType("text/html; charset=UTF-8");
		 	// 이름, 폰번호
	        String name = request.getParameter("name");
	        String hp = request.getParameter("hp");

	        // dao 객체 생성
	        MemberDAO dao = new MemberDAO();
	        
	        // dao에 id찾는 메소드(searchId) 이름과 폰번호 대입하여 실행
	        String id = dao.searchId(name,hp);
	        
	        // 결과변수를 ArrayList<MemberDTD> 형태로 만든 객체 생성
	        ArrayList<MemberDTO> result = new ArrayList<>();

	         // 아이디가 빈값이 아닐경우 (아이디 찾기 성공 했을 경우)
	        if (id != null && !id.isEmpty()) {
	            
	            try {
	            	// alert로 띄워줌
	                response.getWriter().println("<script>alert('아이디는 " + id + " 입니다.'); window.close(); </script>");
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	            // 아이디 찾기 실패 했을 경우
	        } else {        
	            try {
	            	// alert로 띄워줌
	                response.getWriter().println("<script>alert('일치하는 정보가 없습니다.'); window.close(); </script>");
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	        // 결과 list를 반환반환
	        return result;
	    }
	
}
