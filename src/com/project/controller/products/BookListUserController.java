package com.project.controller.products;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.dao.adminBookDAO;
import com.project.model.dao.userDAO;
import com.project.model.vo.BookVO;

//(유저) 책 상세정보 보기
@WebServlet("/user/bookListOne")
public class BookListUserController extends HttpServlet {
	// ...
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String bookId = request.getParameter("bookId");

			// 2. DB에서 해당 아이디(bookId) 책정보 조회(DAO사용)
			List<BookVO> list = adminBookDAO.selectBookId(bookId);

			// 2. 응답페이지(list.jsp)에 전달
			request.setAttribute("list", list);

			// 3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(위임,전가)
			request.getRequestDispatcher("bookDetail.jsp").forward(request, response);
		} catch (IOException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("> ListController doPost() 시작");
			request.setCharacterEncoding("UTF-8");
			doGet(request, response);
			System.out.println("> ListController doPost() 끝");
		} catch (IOException e) {
			e.printStackTrace();
			// IOException 처리 코드 추가
			response.sendRedirect("error.jsp"); // 예외 발생 시 에러 페이지로 이동
		}
	}
}