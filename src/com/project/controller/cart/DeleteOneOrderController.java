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
import com.project.model.dao.OrderDAO;
import com.project.model.dao.adminBookDAO;
import com.project.model.vo.CartVO;
import com.project.model.vo.DetailVO;
import com.project.model.vo.OrderVO;


@WebServlet("/user/deleteOneOrder") //주문 내역에서 삭제하기
public class DeleteOneOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		//String bookId = request.getParameter("bookId");
		
		
		HttpSession session = request.getSession();
		int orderId = (int) session.getAttribute("orderId");
		
	    System.out.println("orderId : " + orderId);
	    //System.out.println("bookId : " + bookId);
	    
	    
	    List<Integer> bookIds = new ArrayList<>(); // 책 ID들을 저장할 리스트

	    List<DetailVO> list = OrderDAO.selectDetailByOrderId(orderId);
	    for (DetailVO vo : list) {
	        int bookId = vo.getBookId();
	        
	        adminBookDAO.orderCntMinus(bookId, vo.getBookCnt());
	        adminBookDAO.bookCntMinus(bookId, vo.getBookCnt());
	        
	        //bookIds.add(bookId); // 책 ID를 리스트에 추가
	        //System.out.println("주문한 정보 리스트: " + vo);
	    }

	    // 모든 bookId 출력, 주문취소하면 book테이블의 주문수량이 감소
//	    for (int bookId : bookIds) {
//		    adminBookDAO.orderCntMinus(bookId);
//		    adminBookDAO.bookCntMinus(bookId);
//	    }
		
	    //주문 취소하기
	    int result = OrderDAO.deleteOneOrder(orderId);
	    

	    //취소 후 주문 내역으로 돌아가기
	    //request.getRequestDispatcher("mypageOrder.jsp").forward(request, response);
	    response.sendRedirect("mypageOrder");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> DeleteOneOrder doPost() 시작");
	    request.setCharacterEncoding("UTF-8");
	    doGet(request, response);
	    System.out.println("> DeleteOneOrder doPost() 끝");
	}
	

}
