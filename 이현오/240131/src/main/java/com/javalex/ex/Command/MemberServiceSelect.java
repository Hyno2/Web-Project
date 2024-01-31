package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;
import com.javalex.ex.Session.SessionUtil;

public class MemberServiceSelect implements MemberService {
    public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();

        // 세션에서 로그인 아이디 가져오기
        String userId = SessionUtil.getLoginId(request);

        // 아이디를 이용하여 DB에서 정보 조회
        if (userId != null) {
            MemberDAO dao = new MemberDAO();
            result = dao.MemberSelectById(userId);
            request.setAttribute("list", result);
        }

        return result;
    }
}
