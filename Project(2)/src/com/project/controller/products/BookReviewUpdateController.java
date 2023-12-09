package com.project.controller.products;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.model.dao.adminBookDAO;
import com.project.model.dao.userDAO;
import com.project.model.vo.BookReviewVO;
import com.project.model.vo.BookVO;

//(유저) 책 리뷰와 평점을 저장하는 컨트롤러
@WebServlet("/user/ReviewUpdate")
public class BookReviewUpdateController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int reviewId = Integer.parseInt(request.getParameter("reviewId"));
			String reviewContent = request.getParameter("reviewContent");
			int grade = Integer.parseInt(request.getParameter("grade"));
			
			//System.out.println(reviewId + ", "+reviewContent + ", "+grade);
			// 여기에서 리뷰를 데이터베이스에 저장하도록 코드를 작성하세요.
			// 리뷰 저장에 성공하면 "success"를 반환하고, 실패하면 "failure"를 반환합니다.

			// 예제: 리뷰 저장 로직 구현 (실제로는 데이터베이스에 저장해야 함)
			boolean reviewSaved = saveReviewToDatabase(reviewId, grade, reviewContent);

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
	private boolean saveReviewToDatabase(int reviewId, int grade, String reviewContent) {

		BookReviewVO vo = new BookReviewVO();
		vo.setReviewId(reviewId);
		vo.setReviewContent(reviewContent);
		vo.setGrade(grade);
		userDAO.reviewUpdate(vo);
		// System.out.println( "vo : " + vo);
		return true;

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			req.setCharacterEncoding("UTF-8");
			doGet(req, resp);
		} catch (IOException e) {
			e.printStackTrace();
			// IOException 처리 코드 추가
			resp.sendRedirect("error.jsp"); // 예외 발생 시 에러 페이지로 이동
		}
	}
}