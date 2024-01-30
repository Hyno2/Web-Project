package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;

public class MemberServiceSearchPw implements MemberService {
	 public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
	        String id = request.getParameter("id");
	        String name = request.getParameter("name");
	        
	        MemberDAO dao = new MemberDAO();
	        String pw = dao.searchPw(id, name);
	        ArrayList<MemberDTO> result = new ArrayList<>();

	        if (pw != null && !pw.isEmpty()) {
	            // 비밀번호 찾기 성공
	            // 여기에서는 간단하게 alert 창을 띄워 비밀번호를 알려주는 예시입니다.
	            response.setContentType("text/html; charset=UTF-8");
	            try {
	                response.getWriter().println("<script>alert('비밀번호는 " + pw + " 입니다.'); window.close(); </script>");
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
