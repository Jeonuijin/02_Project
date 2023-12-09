package com.project.controller.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.dao.MembersDAO;
import com.project.model.vo.MembersVO;

@WebServlet("/members/login")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달받은 파라미터 값
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		
		// 로그인
		MembersVO vo = MembersDAO.login(memId, memPw);
		
		System.out.println(memId);
		System.out.println(memPw);
		System.out.println(vo);
		
		if (vo == null) { // 로그인 불가능
			if (memId.trim().isEmpty()) { // 아이디를 입력하지 않았을 때
				request.setAttribute("error", "아이디를 입력하지 않았습니다.");
			} else if (memPw.trim().isEmpty()) { // 비밀번호를 입력하지 않았을 때
				request.setAttribute("error", "비밀번호를 입력하지 않았습니다.");
			} else { // 아이디, 비밀번호 입력했지만 로그인 정보가 없을 때
				request.setAttribute("error", "아이디 혹은 비밀번호가 정확하지 않습니다.");
			}
		} else { // (vo != null) // 로그인 가능
			HttpSession session = request.getSession(); // 세션 만들기
			session.setAttribute("loginUser", vo);
		}
		
		// 처리
		request.getRequestDispatcher("02_login_ok.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
