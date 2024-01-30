package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;

public class MemberServiceSearchId implements MemberService {
	 public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
	       
	        String name = request.getParameter("name");
	        String hp = request.getParameter("hp");
	        
	        
	        MemberDAO dao = new MemberDAO();
	        String id = dao.searchId(name,hp);
	        
	        ArrayList<MemberDTO> result = new ArrayList<>();

	        if (id != null && !id.isEmpty()) {
	            // 아이디 찾기 성공
	            // 여기에서는 간단하게 alert 창을 띄워 아이디를 알려주는 예시입니다.
	            response.setContentType("text/html; charset=UTF-8");
	            try {
	                response.getWriter().println("<script>alert('아이디는 " + id + " 입니다.'); window.close(); </script>");
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        } else {
	            // 비밀번호 찾기 실패
	            // 여기에서는 적절한 메시지를 설정하여 사용자에게 전달하는 예시입니다.
	            response.setContentType("text/html; charset=UTF-8");
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
