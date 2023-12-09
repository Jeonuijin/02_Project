package com.project.controller.cart;

import java.io.IOException;
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


@WebServlet("/user/checkCart")
public class CheckCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		try {
			//장바구니 목록 조회하기 위해 session에서 memId를 가져옴
			HttpSession session = request.getSession();
			MembersVO loginUser = (MembersVO)session.getAttribute("loginUser");
			String memId = loginUser.getMemId();
			
			
			//1. 전달받은 파라미터값(addCart) 추출(확인)
			//String memId = request.getParameter("memId");
			int bookId = Integer.parseInt(request.getParameter("bookId"));
			int price = Integer.parseInt(request.getParameter("price"));
			
			//1-1. 출력해보기
			System.out.println(memId);
			System.out.println(bookId);
			System.out.println(price);
		
			List<CartVO> cartList = CartDAO.checkTotalCart(memId); //memId를 활용해서 장바구니 check
	
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		
		} catch (IOException e) {
	         e.printStackTrace();
	         response.sendRedirect("error.jsp");
	    }

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
