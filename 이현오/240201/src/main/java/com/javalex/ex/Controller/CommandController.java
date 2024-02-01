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
// 프론트 컨트롤러 서블릿
// @mapping(*.do) *.do는 모든것의.do 를 포함한다는말이다
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// doGet 이나 , doPost 어느곳이든 doAction으로 넘어가게 해줬다
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 문자열들을 UTF-8로 모두 인코딩 요청
		request.setCharacterEncoding("UTF-8");
		// uri변수에 uri 겟 요청함
		String uri = request.getRequestURI();

		// 사용자가 불러온 링크를 반환
		String conPath = request.getContextPath(); // 프로젝트명 반환
		String command = uri.substring(conPath.length());

		// insert.do, delete.do ... 형식으로 저장
		// View(jsp), Controller(프론트컨트롤러, 커맨드)

		// 객체 생성X, 타입 구성만 한 것
		// 인터페이스 초기화 초기화로 늘 실행됨으로 꼬이는일이 적어짐
		MemberService mService = null;

		// 회원가입
		if (command.equals("/insert.do")) {
			System.out.println("<회원 추가>를 수행합니다.");
			// MemberServiceInsert() 클래스
			mService = new MemberServiceInsert();
			// 회원 가입 후 로그인 페이지로 리다이렉트
			response.sendRedirect("login.jsp");
		}

		// 회원 탈퇴
		if (command.equals("/delete.do")) {
			System.out.println("회원 제거 중...");
			mService = new MemberServiceDelete();
			mService.execute(request, response);

			// 회원 탈퇴 후 메인 페이지로 리다이렉트
			response.sendRedirect("index.jsp");
		}

		// 회원 로그인
		if (command.equals("/login.do")) {
			System.out.println("로그인 테스트중...");
			mService = new MemberServiceLogin();

			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			HttpSession session = request.getSession();

			boolean loggedIn = session.getAttribute("loggedIn") != null && (boolean) session.getAttribute("loggedIn");

			// 로그인 성공한 경우에만 로그인 상태를 세션에 저장
			if (loggedIn) {
				session.setAttribute("loggedIn", true);
			}
		}

		// 회원가입시 아이디 중복 체크
		if (command.equals("/checkID.do")) {
			System.out.println("아이디 중복 확인 중...");

			String idToCheck = request.getParameter("id");
			System.out.println("Check ID: " + idToCheck);

			mService = new MemberServiceCheckId();
		}

		// 아이디 찾기
		if (command.equals("/searchID.do")) {
			System.out.println("아이디찾기 찾기 중...");
			mService = new MemberServiceSearchId();
		}

		// 비밀번호 찾기
		if (command.equals("/searchPW.do")) {
			System.out.println("비밀번호 찾기 중...");
			mService = new MemberServiceSearchPw();
		}

		// logout.do에 대한 서블릿, 컨트롤러에서 세션을 해제하고 메인페이지로 리다이렉트
		if (command.equals("/logout.do")) {
			mService = new MemberServiceLogout();
		}

		// 마이페이지 회원 정보 출력
		if (command.equals("/select.do")) {
			mService = new MemberServiceSelect();
			mService.execute(request, response);

			// 마이페이지로 포워딩
			RequestDispatcher dispatcher = request.getRequestDispatcher("myPage.jsp");
			dispatcher.forward(request, response);
		}

		// 마이페이지에서 회원정보 수정
		if (command.equals("/update.do")) {
			System.out.println("회원정보 수정중...");

			mService = new MemberServiceUpdate();

			// 업데이트된 사용자 정보를 반환하므로 이를 request에 저장
			ArrayList<MemberDTO> updatedUserInfo = mService.execute(request, response);

			request.setAttribute("userInfo", updatedUserInfo);

			// 리다이렉트를 사용하여 다시 myPage.jsp로 이동
			response.sendRedirect("myPage.jsp?updateSuccess=true");
		}

		// 게스트 이메일 저장
		if (command.equals("/guest.do")) {
			System.out.println("<게스트 이메일 추가>를 수행합니다.");
			// MemberServiceGuest() 클래스
			mService = new MemberServiceGuest();
			// 회원 가입 후 로그인 페이지로 리다이렉트
			response.sendRedirect("index.jsp");
		}

		mService.execute(request, response);

	}
}
