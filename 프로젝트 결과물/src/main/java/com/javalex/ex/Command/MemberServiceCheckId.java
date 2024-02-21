package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;

public class MemberServiceCheckId implements MemberService {
    public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<MemberDTO> result = new ArrayList<>();

        // dao객체 생성
        MemberDAO dao = new MemberDAO();
        // 아이디 중복체크를 위해 값 가져오기
        String id = request.getParameter("id");

        try {
            // dao.selectAllId 호출
            int idCheckResult = dao.selectAllId(id);

            // idCheckResult에 따라 클라이언트에게 응답
            if (idCheckResult == 1) {
            	
                // 이미 사용 중인 아이디
                response.getWriter().write("1");
            } else if (idCheckResult == 0) {
            	
                // 사용 가능한 아이디
                response.getWriter().write("0");
            } else {
            	
                // 오류 발생
                response.getWriter().write("-1");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}