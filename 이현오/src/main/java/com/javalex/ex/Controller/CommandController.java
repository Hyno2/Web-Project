package com.javalex.ex.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalex.ex.Command.*;
import com.javalex.ex.Session.*;
import com.javalex.ex.DTO.MemberDTO;

/**
 * Servlet implementation class CommandController
 */
@WebServlet("*.do")
public class CommandController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommandController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri=request.getRequestURI();
			// 사용자가 불러온 링크를 반환	
		String conPath=request.getContextPath();	// 프로젝트명 반환
		String command=uri.substring(conPath.length());
			// insert.do, delete.do ... 형식으로 저장
		
		// View(jsp), Controller(프론트컨트롤러, 커맨드)
		MemberService mService=null;		// 객체 생성X, 타입 구성만 한 것
		
		// 회원가입
		if(command.equals("/insert.do")) {	// "회원 추가" 수행을 요청할 시
			System.out.println("<회원 추가>를 수행합니다.");
			mService = new MemberServiceInsert();
			response.sendRedirect("login.html");
		}
		
		// 회원삭제 아직 안쓰는중
		if(command.equals("/delete.do")) {
			System.out.println("회원 제거중...");
			mService = new MemberServiceDelete();
		}
		
		// 로그인
		if(command.equals("/login.do")) {
			System.out.println("로그인 테스트중...");
			mService = new MemberServiceLogin();
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			// 로그인이 성공했을 때만 로그인 상태를 세션에 저장
            HttpSession session = request.getSession();
            boolean loggedIn = session.getAttribute("loggedIn") != null
                    && (boolean) session.getAttribute("loggedIn");

            if (loggedIn) {
                // 로그인 성공한 경우에만 로그인 상태를 세션에 저장
                session.setAttribute("loggedIn", true);
            }
		}
		
		// 회원가입시 아이디 중복체크
		if (command.equals("/checkID.do")) {
		    System.out.println("아이디 중복 확인 중...");
		    String idToCheck = request.getParameter("id");
		    System.out.println("Check ID: " + idToCheck);
		    mService = new MemberServiceCheckId();
		}
		
		
//		// 아이디찾기
//		if (command.equals("/searchID.do")) {
//		    System.out.println("회원 아이디를 찾는 중입니다...");
//		    mService = new MemberServiceSearchId();
//		    ArrayList<MemberDTO> resultList = mService.execute(request, response);
//
//		    // 결과가 있다면 클라이언트로 전송
//		    if (resultList != null && !resultList.isEmpty()) {
//		        // 여기서 추가적인 처리를 하고 싶다면 추가 가능
//		        // 예: 첫 번째 아이디만 사용하거나, 특정 필드만 사용하는 등
//		        // 클라이언트에서는 단순히 결과가 있다는 사실만 알려주면 됨
//		    	String foundId = resultList.get(0).getId();
//		        response.getWriter().write(foundId);
//		        
//		    } else {
//		        // 결과가 없는 경우에 대한 응답
//		        response.getWriter().write("No matching IDs found.");
//		    }
//		}
		// 아이디 찾기 테스트
		if (command.equals("/searchID.do")) {
		    System.out.println("아이디찾기 찾기 중...");
		    mService = new MemberServiceSearchId();
		}
		
		// 비밀번호 찾기
		if (command.equals("/searchPW2.do")) {
		    System.out.println("비밀번호 찾기 중...");
		    mService = new MemberServiceSearchPw();
		}
		
		
		
		
		if(command.equals("/select.do")) {
			System.out.println("회원 전체 출력을 수행합니다.");
			mService = new MemberServiceSelect();
			
		}
		
		mService.execute(request, response);
		
		
		//response.sendRedirect("index.html");
	}
}
