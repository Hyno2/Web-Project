package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalex.ex.DTO.MemberDTO;
import com.javalex.ex.Session.SessionUtil;

public class MemberServiceLogout implements MemberService {
    @Override
    public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        // 세션을 무효화하여 세션에 저장된 모든 데이터를 삭제합니다.
        SessionUtil.Logout(request);

        try {
            // 로그아웃 후 index 페이지로 리다이렉트합니다.
        	response.sendRedirect("index.jsp?logoutSuccess=true");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
