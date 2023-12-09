package com.project.controller.members;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.dao.MembersDAO;
import com.project.model.vo.MembersVO;

@WebServlet("/members/signup")
public class signupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 값 받기
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		String memPw2 = request.getParameter("memPw2");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		// 가입 시도
		if (memPw.trim().isEmpty()
				|| memPw2.trim().isEmpty()
				|| name.trim().isEmpty()
				|| birth.trim().isEmpty()
                || phone.trim().isEmpty()
                || address.trim().isEmpty()
                || email.trim().isEmpty()) { // 입력칸에 공백이 존재할 때
			request.setAttribute("error", "입력칸에 공백이 존재합니다.");
		} else { // 공백이 존재하지 않을 때
			String id = "-";
			try {
				id = MembersDAO.search(memId).getMemId();
			} catch (NullPointerException n) {
				System.out.println("사용 가능한 아이디라는 뜻");
			}
			if (memId.equals(id)) { // 중복 아이디가 존재할 때
				request.setAttribute("error", "사용할 수 없는 아이디입니다.");
			} else if (!memPw.equals(memPw2)) { // 비번1과 비번2가 일치하지 않을 때
				request.setAttribute("error", "비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			} else if (birth.length() != 8) {
				request.setAttribute("error", "생년월일 확인 후 다시 입력해주세요. (YYYYMMDD)");
			} else { // 회원가입 성공
				MembersVO vo = new MembersVO(memId, memPw, name, address, phone, birth, email);
				int result = MembersDAO.signUp(vo);
			}
		}
		
		request.getRequestDispatcher("03_signUp_ok.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
