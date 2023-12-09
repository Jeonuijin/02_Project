package com.project.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.dao.CartDAO;
import com.project.model.dao.adminBookDAO;
import com.project.model.vo.BookVO;
import com.project.model.vo.CartVO;
import com.project.model.vo.MembersVO;


@WebServlet("/user/orderSelNow")
public class OrderSelController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			
			response.setContentType("application/json; charset=UTF-8");
			
			//session 저장된 id 받아오기
			HttpSession session = request.getSession();

			MembersVO loginUser = (MembersVO)session.getAttribute("loginUser");

			String memId = loginUser.getMemId();

			System.out.println("주문하는 사람 아이디 : " + memId);
			int bookCnt = Integer.parseInt(request.getParameter("quantity"));
			int bookId = Integer.parseInt(request.getParameter("bookId"));
			
			System.out.println("주문한 책 수량 ::: " + bookCnt);
			System.out.println("주문한 책 아이디 ::: " + bookId);
			
			List<BookVO> list = new ArrayList<BookVO>();
			  
			BookVO vo = CartDAO.getInfo(bookId);
			//주문하면 book테이블의 주문수량이증가 
			adminBookDAO.orderCnt(bookId, bookCnt);
			//주문하면 book테이블의 재고가 마이너스 
			adminBookDAO.bookCnt(bookId, bookCnt);
		    
		    
			list.add(vo);
			System.out.println("list : " + list);
		    session.setAttribute("list", list);
		    session.setAttribute("bookCnt", bookCnt);
		    //request.getSession().setAttribute("list", list); //request.getSession을 통해 session에 setAttribute 호출 가능
			System.out.println(list);
		    //3. 페이지 전환 - 응답할 페이지(order.jsp)로 포워딩(위임,전가)
		    request.getRequestDispatcher("order2.jsp").forward(request, response);
		    
		    
		} catch (IOException e) {
	        e.printStackTrace();
	        response.sendRedirect("error.jsp");
	    }

	    	  
	}
	
	private String makeJson(int count) {
		//JSON 형식 문자열 만들기
		String result = "{\"count\":" + count + "}";
		
		System.out.println(result);
		return result;
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		
			System.out.println("> OrderAllController doGet() 시작");
		    request.setCharacterEncoding("UTF-8");
		    doGet(request, response);
		    System.out.println("> OrderAllController doGet() 끝");
	    
		} catch (IOException e) {
	        e.printStackTrace();
	        response.sendRedirect("error.jsp");
	    }


	}
	

}
