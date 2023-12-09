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

//등록한 유저 아이디로 해당 댓글삭제하기
@WebServlet("/user/deleteReview")
public class BookReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			System.out.println("::: GetJsonMembersController doGet() 실행~~~");
			// 한글깨짐 방지를 위한 문자타입(UTF-8) 처리
			response.setContentType("text/html; charset=UTF-8");

			String memId = request.getParameter("memId");

			// 예제: 리뷰 저장 로직 구현 (실제로는 데이터베이스에 저장해야 함)
			boolean reviewSaved = deleteReviewToDatabase(memId);

			// JSON 응답을 생성합니다.
			String jsonResponse = "{ \"result\": \"" + (reviewSaved ? "success" : "failure") + "\" }";

			// JSON 응답을 클라이언트에 반환
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonResponse);
	        
	        
		} catch (IOException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
	

	// 리뷰를 데이터베이스에 저장하는 메서드 (예제)
	private boolean deleteReviewToDatabase(String memId) {
		userDAO.deleteReview(memId);
		
		return true;

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