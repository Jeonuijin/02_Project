package com.project.controller.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.dao.OrderDAO;
import com.project.model.vo.MembersVO;
import com.project.model.vo.OrderVO;

@WebServlet("/user/mypageOrder")
public class MypageOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		
			response.setContentType("application/json; charset=UTF-8");
			
			HttpSession session = request.getSession();
			MembersVO loginUser = (MembersVO)session.getAttribute("loginUser");
			String memId = loginUser.getMemId();
			String bookId = request.getParameter("bookId");
			
			//memId로 내가 주문한 목록(orderId)을 list에 모두 가져오고
			List<Integer> orderAllId = OrderDAO.selectOrderAllId(memId);
			System.out.println("MypageOrderController의 orderAllId : " + orderAllId);
			
			//OrderVO타입 담을 List 생성
			List<OrderVO> orderVOList = new ArrayList<>();
			
			for (Integer orderOneID : orderAllId) {
				System.out.println("orderOneID : " + orderOneID);
				
				OrderVO ovo = OrderDAO.getOrderInfo(orderOneID); //orderId를 하나씩 가지고 와서 주문 정보가 담긴 OrderVO 만들기
				
				orderVOList.add(ovo); //List<OrderVO>에 담기
			}
			
			session.setAttribute("orderVOList", orderVOList);
			
			response.sendRedirect("mypageOrder.jsp?bookId="+bookId);
			
	  	 } catch (IOException e) {
	         e.printStackTrace();
	         response.sendRedirect("error.jsp");
	     }

		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			System.out.println("> MypageOrderController doPost() 시작");
		    request.setCharacterEncoding("UTF-8");
		    doGet(request, response);
		    System.out.println("> MypageOrderController doPost() 끝");
		    
		} catch (IOException e) {
			
	         e.printStackTrace();
	         response.sendRedirect("error.jsp");
	    }

	}
	

}
