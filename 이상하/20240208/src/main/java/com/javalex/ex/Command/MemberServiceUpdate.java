package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;

public class MemberServiceUpdate implements MemberService {
    private MemberDAO dao;

    @Override
    public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
    
    	// 회원이 수정한 각각의 값들 가져오기
        String userId = request.getParameter("id");
        String newPassword = request.getParameter("pw");
        String newName = request.getParameter("name");
        String newHp = request.getParameter("hp");
        String newEmail = request.getParameter("email");

        // dao에 값들을 업데이트
        dao.updateUserInfo(userId, newPassword, newName, newHp, newEmail);

        // 업데이트된 사용자 정보를 반환
        return dao.MemberSelectById(userId);
    }
    
    public MemberServiceUpdate() {
        this.dao = new MemberDAO();
    }
}
