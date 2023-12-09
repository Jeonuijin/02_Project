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

@WebServlet("/members/update")
public class updateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); // 세션 만들기
		MembersVO loginUser = (MembersVO) session.getAttribute("loginUser");
		
		String memId = loginUser.getMemId();
		String memPw = request.getParameter("memPw");
		String memPw2 = request.getParameter("memPw2");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		if (memPw.trim().isEmpty()
				|| memPw2.trim().isEmpty()
				|| name.trim().isEmpty()
				|| birth.trim().isEmpty()
				|| phone.trim().isEmpty()
				|| address.trim().isEmpty()
				|| email.trim().isEmpty()) {
			request.setAttribute("error", "입력칸에 공백이 존재합니다.");
		} else {
			if (!memPw.equals(memPw2)) { // 비번1과 비번2가 일치하지 않을 때
				request.setAttribute("error", "비밀번호가 일치하지 않습니다.");
			} else if (birth.length() != 8) { // 생년월일이 8자리가 아닐 때
				request.setAttribute("error", "생년월일 확인 후 다시 입력해주세요. (YYYYMMDD)");
			} else { // 회원가입 성공
				MembersVO vo = new MembersVO(memId, memPw, name, address, phone, birth, email);
				int result = MembersDAO.update(vo);
				session.setAttribute("loginUser", vo);
			}
		}
		
		request.getRequestDispatcher("06_myPage_update_ok.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
