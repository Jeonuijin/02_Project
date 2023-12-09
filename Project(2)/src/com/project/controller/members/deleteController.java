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

@WebServlet("/members/delete")
public class deleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		String statement = "X";
		// String memId, String memPw, String name, String address, String phone, String birth, String email,
		
		HttpSession session = request.getSession(); // 세션 만들기
		MembersVO loginUser = (MembersVO) session.getAttribute("loginUser");
		
		if (memId.trim().isEmpty() || memPw.trim().isEmpty()) {
			request.setAttribute("error", "입력칸에 공백이 존재합니다.");
		} else if (!memId.equals(loginUser.getMemId()) || !memPw.equals(loginUser.getMemPw())) {
			request.setAttribute("error", "입력하신 아이디 혹은 비밀번호가 기존과 일치하지 않습니다.");
		} else {
			int result = MembersDAO.dropOut(memId, memPw);
		}
		
		request.getRequestDispatcher("06_myPage_delete_ok.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
