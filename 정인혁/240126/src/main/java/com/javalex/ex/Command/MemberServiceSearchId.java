package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;

public class MemberServiceSearchId implements MemberService {
    public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String hp = request.getParameter("hp");
        ArrayList<MemberDTO> dtoList = null;

        // MemberDAO를 생성하고, 해당 DAO를 사용하여 아이디를 찾습니다.
        MemberDAO dao = new MemberDAO();
        String searchId = dao.IdSearch(name, hp);
        System.out.println(searchId);
        // 검색 결과가 null 또는 비어있으면 아이디가 일치하지 않는 것으로 처리
        if (searchId == null || searchId.isEmpty()) {
            // 아이디가 일치하지 않는 경우
            // 여기에 알림 또는 처리를 추가합니다.
            System.out.println("일치하는 아이디 없음");
        } else {
            // 아이디가 일치하는 경우
            // 여기에 추가적인 처리를 할 수 있습니다.
            System.out.println("일치하는 아이디: " + searchId);

            HttpSession session=request.getSession();
            session.setAttribute("id", searchId);
        }
  
        return dtoList;
    }
}
