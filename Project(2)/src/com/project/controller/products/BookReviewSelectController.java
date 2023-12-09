package com.project.controller.products;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.dao.adminBookDAO;
import com.project.model.dao.userDAO;
import com.project.model.vo.BookReviewVO;
import com.project.model.vo.BookVO;

//등록된 리뷰조회 컨트롤러
@WebServlet("/user/getBookReview")
public class BookReviewSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			System.out.println("::: GetJsonMembersController doGet() 실행~~~");
			// 한글깨짐 방지를 위한 문자타입(UTF-8) 처리
			response.setContentType("text/html; charset=UTF-8");
			String bookId = request.getParameter("bookId");
			//String memId = request.getParameter("memId");
			System.out.println("> bookId : " + bookId);
			//System.out.println("> bookId : " + memId);
			
			List<BookReviewVO> list = userDAO.getReviewList(bookId /*,memId*/);

			// JSON 형식 문자열 만들고 응답처리
			// {"list" : [{}, {}, ... , {}] }
			String result = makeJson(list);

			// 클라이언트에게 응답처리
			PrintWriter out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	private String makeJson(List<BookReviewVO> list) {
		/*
		 * {"list" : [{}, {}, ... , {}] } { "list" : [ { "idx" : 1, "name" : "홍길동",
		 * "age" : 27, "addr" : "서울", "regdate" : "2023-10-17" }, {}, {}, ...., {} ]}
		 */
		// JSON 형식 문자열 만들기
		StringBuilder result = new StringBuilder();
		result.append("{ \"list\" : [");

		for (BookReviewVO vo : list) {
			result.append("{");
			result.append("\"reviewContent\": \"" + vo.getReviewContent() + "\", ");
			result.append("\"Grade\": \"" + vo.getGrade() + "\", ");
			result.append("\"RegDate\": \"" + vo.getRegdate() + "\", ");
			result.append("\"reviewId\": \"" + vo.getReviewId() + "\", ");
			result.append("\"memId\": \"" + vo.getMemId() + "\" ");
			result.append("}");

			// 마지막 요소인 경우 쉼표를 추가하지 않음
			if (list.indexOf(vo) < list.size() - 1) {
				result.append(", ");
			}
		}

		result.append("]}");

		System.out.println(result.toString());

		return result.toString();
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