package com.project.controller.members;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.dao.MembersDAO;
import com.project.model.vo.MembersVO;

@WebServlet("/members/findId")
public class findIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		
		MembersVO vo = MembersDAO.findID(name, phone, birth, email);
		if (vo == null) {
			request.setAttribute("error", "입력하신 정보에 해당하는 아이디가 없습니다.");
		} else {
			request.setAttribute("vo", vo);
		}
		
		request.getRequestDispatcher("04_find_id_ok.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
