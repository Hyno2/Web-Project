package com.javalex.ex.Session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtil {
	
	public static String getLoginId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (String) session.getAttribute("loginUser");
    }

    public static void setLoginId(HttpServletRequest request, String userId) {
        HttpSession session = request.getSession();
        session.setAttribute("loginUser", userId);
    }

    public static void Logout(HttpServletRequest request) {
        // 세션을 무효화하는 작업을 커밋 이전으로 이동
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }

    public static boolean checkLogin(HttpServletRequest request) {
        return getLoginId(request) != null;
    }
	
}
