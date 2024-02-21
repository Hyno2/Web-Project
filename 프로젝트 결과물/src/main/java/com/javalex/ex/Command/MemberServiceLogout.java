package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalex.ex.DTO.MemberDTO;
import com.javalex.ex.Session.SessionUtil;

public class MemberServiceLogout implements MemberService {
	@Override
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
	    // 로그아웃 (세션무효화)
	    SessionUtil.Logout(request);

	    // 클라이언트 측에서 index 페이지로 이동하는 JS코드
	    String redirectScript = "<script>window.location.href='index.jsp?logoutSuccess=true';</script>";
	    try {
	    	// 세션이 겹치는 경우가있어 리다이렉트를 안쓰고 이동하는 js코드 사용
	        response.getWriter().print(redirectScript);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return null;
	}
}
