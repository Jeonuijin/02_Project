package com.project.controller.members;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.dao.MembersDAO;
import com.project.model.vo.MembersVO;

@WebServlet("/members/findPw")
public class findPwController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		MembersVO vo = MembersDAO.selectOne(memId);
		
		if (vo == null) { // 아이디가 엄따
			request.setAttribute("error", "찾으시는 아이디가 존재하지 않습니다.");
		} else if (!vo.getName().equals(name)
				|| !vo.getBirth().equals(birth)
				|| !vo.getPhone().equals(phone)
				|| !vo.getEmail().equals(email)) { // 아이디는 있는데 정보가 틀리당
			request.setAttribute("error", "입력하신 정보와 일치하는 회원정보가 존재하지 않습니다.");
		} else { // 아이디도 있고 아무 문제 엄따
			request.setAttribute("vo", vo);
		}
		
		request.getRequestDispatcher("04_find_pw_ok.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
