package com.project.controller.products;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.dao.adminBookDAO;
import com.project.model.vo.BookVO;

@WebServlet("/admin/bookDelete")
public class BookDeleteController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String bookId = request.getParameter("bookId");
		
		//2. DB에서 해당 아이디(bookId) 책정보 조회(DAO사용)
		
		
		//or
		// DB에 입력(저장) 처리 
		int result = adminBookDAO.stateUpdate(bookId); // 인서트 메서드 호출 결과를 변수에 저장
		
		if (result == 1) {
		    // 성공했을 때 응답 메시지 출력
		    System.out.println("성공했습니다");
		    request.setAttribute("fileDelete", result);
		    request.getRequestDispatcher("bookDelete.jsp").forward(request, response);
		} else {
		    // 실패했을 때 다른 메시지 출력 또는 오류 처리
		    response.sendRedirect("bookDelete.jsp");
		}
		} catch (IOException e) {
			 e.printStackTrace();
			 response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		System.out.println("> ListController doPost() 시작");
		
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		System.out.println("> ListController doPost() 끝");
		}catch (IOException e) {
			 e.printStackTrace();
			 response.sendRedirect("error.jsp");
		}
	}
}