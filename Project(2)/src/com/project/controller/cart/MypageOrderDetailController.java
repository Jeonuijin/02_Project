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
import com.project.model.vo.DetailVO;
import com.project.model.vo.OrderVO;

@WebServlet("/user/mypageOrderDetail")
public class MypageOrderDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			response.setContentType("application/json; charset=UTF-8");
			
			HttpSession session = request.getSession();
	
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			//int orderId = (int) session.getAttribute("orderId");
			System.out.println("request.orderId" + orderId);
			
			List<DetailVO> detailVOList = OrderDAO.selectDetailByOrderId(orderId);
			session.setAttribute("detailVOList", detailVOList);
			
			OrderVO vo = OrderDAO.getOrderInfo(orderId);
			session.setAttribute("vo", vo);
			
			session.setAttribute("orderId", orderId);
			response.sendRedirect("mypageOrderDetail.jsp");
		
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
