package com.project.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.dao.CartDAO;
import com.project.model.dao.LikeDAO;
import com.project.model.vo.CartVO;
import com.project.model.vo.LikeVO;
import com.project.model.vo.MembersVO;


@WebServlet("/user/deleteLike")
public class DeleteLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		
		//session 저장된 id 받아오기
		HttpSession session = request.getSession();

		MembersVO loginUser = (MembersVO)session.getAttribute("loginUser");

		String memId = loginUser.getMemId();

		System.out.println(memId);
		
		//삭제 버튼 클릭시 전달받은 bookId 추출
	    int bookId = Integer.parseInt(request.getParameter("bookId"));
	    System.out.println(bookId);
	    
	    //LikeVO객체 생성하고 LikeDAO.deleteLike를 이용해 LIKES 테이블에서 삭제
	    LikeVO vo = new LikeVO(memId, bookId);
	    
	    int delResult = LikeDAO.deleteLike(vo);
	    
	    List<LikeVO> list = LikeDAO.checkTotalLike(memId);
	    System.out.println("list : " + list);
	    
	    //위 데이터 list를 JSON 형식 문자열 만들기
	  	// {"list" : [{}, {}, ... , {}] }
	    String result = makeJson(list);
	    
	    //클라이언트에게 응답처리
	    PrintWriter out = response.getWriter();
	    out.print(result);
	    
	}

	private String makeJson(List<LikeVO> list) {
		//JSON 형식 문자열 만들기
		StringBuilder result = new StringBuilder();
		result.append("{ \"list\" : [");

		for (LikeVO vo : list) {
		    result.append("{");
		    result.append("\"bookId\": \"" + vo.getBookId() + "\", "); // 따옴표가 빠졌습니다.
		    result.append("\"memId\": \"" + vo.getMemId() + "\", "); // 따옴표가 빠졌습니다.
		    result.append("\"price\": " + vo.getPrice() + ", ");
		    result.append("\"bookName\": \"" + vo.getBookName() + "\", "); // 따옴표가 빠졌습니다.
		    result.append("\"bookImage\": \"" + vo.getBookImage() + "\"");
		    result.append("},");
		}

		if (!list.isEmpty()) {
		    result.deleteCharAt(result.length() - 1); // 마지막 쉼표 제거
		}

		result.append("]}");
		
		System.out.println(result.toString());
		
		return result.toString();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> DeleteCartController doPost() 시작");
	    request.setCharacterEncoding("UTF-8");
	    doGet(request, response);
	    System.out.println("> DeleteCartController doPost() 끝");

	}
	

}
