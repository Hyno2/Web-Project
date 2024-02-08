package com.javalex.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalex.ex.DAO.MemberDAO;
import com.javalex.ex.DTO.MemberDTO;
import com.javalex.ex.Session.SessionUtil;

public class MemberServiceSelect implements MemberService {
    public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
    	
    	// 결과변수를 ArrayList<MemberDTD> 형태로 만든 객체 생성
        ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();

        // 세션에서 로그인 아이디 가져오기
        String userId = SessionUtil.getLoginId(request);

        // dao 객체 생성
        MemberDAO dao = new MemberDAO();
        
        // 아이디를 이용하여 DB에서 정보 조회
        if (userId != null) {
        	
            // result값에 dao에있는 id를 통해 조회하는 명령문 넣기
            result = dao.MemberSelectById(userId);
            
            request.setAttribute("list", result);
        }
        return result;
    }
}
