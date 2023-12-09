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

//카테고리별로 검색하기 컨트롤러
@WebServlet("/user/searchAll")
public class SearchAllController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String search = request.getParameter("search");
			String cPage = request.getParameter("cPage");
			String searchOption = request.getParameter("searchOption");

			System.out.println("검색한 값 :::" + search);
			System.out.println("cPage :::" + cPage);
			System.out.println("searchOption :::" + searchOption);
			List<BookVO> list = null;

			if (search != null && !search.isEmpty()) {
				if ("all".equals(searchOption)) {
					// 통합검색을 수행하는 메서드 호출
					list = userDAO.searchAll(search);
				} else if ("title".equals(searchOption)) {
					// 제목으로 검색을 수행하는 메서드 호출
					list = userDAO.searchByTitle(search);
				} else if ("author".equals(searchOption)) {
					// 작가별 검색을 수행하는 메서드 호출
					list = userDAO.searchByAuthor(search);
				}
			}

			System.out.println("검색한 값 으로 정보출력" + list);
			
			if (list != null) {
				request.setAttribute("size", list.size());	
				System.out.println("리스트 사이즈 : " + list.size());
			}
			// 2. 응답페이지(list.jsp)에 전달
			request.setAttribute("list", list);
			
			request.setAttribute("search", search);
			request.setAttribute("cPage", cPage);
			request.setAttribute("searchOption", searchOption);
			
			

			// 3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(위임,전가)
			request.getRequestDispatcher("searchAllResult.jsp").forward(request, response);
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