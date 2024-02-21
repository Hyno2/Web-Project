package com.javalex.ex.Session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtil {
	
	// 로그인되있는 상태에서 세션에 있는 id 값을 가져오는 메소드
	public static String getLoginId(HttpServletRequest request) {
		// 세션 객체 생성
        HttpSession session = request.getSession();
        // 문자열 형태 반환 
        return (String) session.getAttribute("loginUser");
    }
	
	// 로그인상태에 세션에 id값 설정 메소드
    public static void setLoginId(HttpServletRequest request, String userId) {
    	// 세션 객체 생성
        HttpSession session = request.getSession();
        // 세션에 아이디값을 저장
        session.setAttribute("loginUser", userId);
    }

    // 로그아웃 메소드
    public static void Logout(HttpServletRequest request) {
        // 세션을 무효화하는 작업을 커밋 이전에 실행
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
            
        }
    }

    // 로그인되있나 상태 true false 확인 메소드
    public static boolean checkLogin(HttpServletRequest request) {
        return getLoginId(request) != null;
    }
	
}
