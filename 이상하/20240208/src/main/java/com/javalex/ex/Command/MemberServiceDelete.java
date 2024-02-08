package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;
import com.javalex.ex.Session.SessionUtil;


public class MemberServiceDelete implements MemberService {
    public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        MemberDAO dao = new MemberDAO();
        dao.MemberDelete(id);
        
        // 회원탈퇴후 Logout 실행
        SessionUtil.Logout(request);
        
        // 삭제 후의 회원 정보를 반환하지 않음 (null 또는 빈 리스트 반환 가능)
        return new ArrayList<>();
    }
}
