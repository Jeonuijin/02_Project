package com.project.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
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
import com.project.model.vo.BookVO;


@WebServlet("/user/addLike")
public class AddLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		response.setContentType("application/json; charset=UTF-8");
		
		//session 저장된 id 받아오기
		HttpSession session = request.getSession();
		
		MembersVO loginUser = (MembersVO) session.getAttribute("loginUser");
		
		String memId = loginUser.getMemId();
		
		System.out.println("addCartController memId : " + memId); 
		
		if (memId == null) {
            // 사용자가 로그인하지 않은 경우를 처리합니다.
            // 오류를 반환하거나 로그인 페이지로 리디렉션할 수 있습니다.
            return;
        }
		
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		System.out.println("addCartController bookId : " + bookId);
		
		BookVO bvo = CartDAO.getInfo(bookId);
		System.out.println(bvo);
		
		String bookName = bvo.getBookName();
		String bookImage = bvo.getBookImage();
		int price = bvo.getPrice();
		
		LikeVO vo = new LikeVO(bookId, memId, price, bookName, bookImage); //LikeVO 객체 생성
		
		Integer count = LikeDAO.checkLike(vo); //Integer타입으로 변경해서 null처리할 수 있도록 함 
		
		if (count == null || count < 1) { //찜 목록에 같은 상품이 없으면
			LikeDAO.addLike(vo); //찜 목록에 추가
		}
		
		//위 데이터 list를 JSON 형식 문자열 만들기
	  	// {"list" : [{}, {}, ... , {}] }
	    String result = makeJson(count);
	    
	    //클라이언트에게 응답처리
	    PrintWriter out = response.getWriter();
	    out.print(result);;
			
	}
	
	private String makeJson(int count) {
		//JSON 형식 문자열 만들기
		String result = "{\"count\":" + count + "}";
		
		System.out.println(result);
		return result;
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			System.out.println("> AddLikeController doPost() 시작");
		    request.setCharacterEncoding("UTF-8");
		    doGet(request, response);
		    System.out.println("> AddLikeController doPost() 끝");
		    
		 } catch (IOException e) {
	         e.printStackTrace();
	         response.sendRedirect("error.jsp");
	     }

	}

}
