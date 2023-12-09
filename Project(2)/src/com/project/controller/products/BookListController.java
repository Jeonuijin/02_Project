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

//(관리자) 책 전체 리스트 조회 컨트롤러
@WebServlet("/admin/bookList")
public class BookListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// DB에서 데이터 가져와서 list.jsp 페이지에서 사용토록 전달
		try {
			// 1. DB연결하고 데이터 가져오기
			List<BookVO> list = adminBookDAO.getList();

			// 2. 응답페이지(list.jsp)에 전달
			request.setAttribute("list", list);

			// 3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(위임,전가)
			request.getRequestDispatcher("bookList.jsp").forward(request, response);
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