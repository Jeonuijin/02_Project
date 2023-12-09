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
import com.project.model.vo.CartVO;
import com.project.model.vo.MembersVO;
import com.project.model.vo.BookVO;


@WebServlet("/user/addCart")
public class AddCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		response.setContentType("application/json; charset=UTF-8");
		
		//session 저장된 id 받아오기
		HttpSession session = request.getSession();
		
		MembersVO loginUser = (MembersVO) session.getAttribute("loginUser");
		
		String memId = loginUser.getMemId();
		
		System.out.println("addCartController memId : " + memId); 
		
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		System.out.println("addCartController bookId : " + bookId);
		
		BookVO bvo = CartDAO.getInfo(bookId);
		System.out.println(bvo);
		
		String bookName = bvo.getBookName();
		int price = bvo.getPrice();
		
		CartVO vo = new CartVO(memId, bookId, price, bookName); //CartVO 객체 생성
		
		Integer count = CartDAO.checkBook(vo); //Integer타입으로 변경해서 null처리할 수 있도록 함 
		
		if (count >= 1) { //장바구니에 같은 상품이 존재하면
			count = CartDAO.updateCart(vo); //업데이트
		} else {
			count = CartDAO.addCart(vo); //새로 추가
		}		
		//위 데이터 list를 JSON 형식 문자열 만들기
	  	// {"list" : [{}, {}, ... , {}] }
	    String result = makeJson(vo);
	    
	    //클라이언트에게 응답처리
	    PrintWriter out = response.getWriter();
	    out.print(result);
			
	}
	
	private String makeJson(CartVO vo) {
		//JSON 형식 문자열 만들기
		StringBuilder result = new StringBuilder();
		result.append("{ \"vo\" : [");
	    result.append("{");
	    result.append("\"memId\": \"" + vo.getMemId() + "\", "); // 따옴표가 빠졌습니다.
	    result.append("\"bookId\": \"" + vo.getBookId() + "\", "); // 따옴표가 빠졌습니다.
	    result.append("\"price\": " + vo.getPrice() + ", ");
	    result.append("\"bookName\": \"" + vo.getBookName() + "\"");
	    result.append("}");
		result.append("]}");
		
		System.out.println(result.toString());
		return result.toString();
		
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			System.out.println("> AddCartController doPost() 시작");
		    request.setCharacterEncoding("UTF-8");
		    doGet(request, response);
		    System.out.println("> AddCartController doPost() 끝");
		    
		 } catch (IOException e) {
	         e.printStackTrace();
	         response.sendRedirect("error.jsp");
	     }

	}

}
