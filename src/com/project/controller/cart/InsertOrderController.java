package com.project.controller.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.dao.CartDAO;
import com.project.model.dao.OrderDAO;
import com.project.model.vo.BookVO;
import com.project.model.vo.CartVO;
import com.project.model.vo.MembersVO;
import com.project.model.vo.OrderVO;

@WebServlet("/user/insertOrder")
public class InsertOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
	try {
		HttpSession session = request.getSession();
		MembersVO loginUser = (MembersVO)session.getAttribute("loginUser");
		String memId = loginUser.getMemId();
		
		String rcvName = request.getParameter("rcvName");
	    String rcvAddress = request.getParameter("rcvAddress");
	    String payment = request.getParameter("payment");
	    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
	    int totalCnt = Integer.parseInt(request.getParameter("totalCnt"));
	    String rcvPhone = request.getParameter("rcvPhone");
	    
	    System.out.println("rcvName : " + rcvName);
	    System.out.println("rcvAddress : " + rcvAddress);
	    System.out.println("rcvPhone : " + rcvPhone);
	    System.out.println("totalCnt : " + totalCnt);
	    System.out.println("totalPrice : " + totalPrice);
	    System.out.println("payment : " + payment);
		
	    
	    OrderVO vo = new OrderVO(totalPrice, memId, payment, totalCnt
	    		, rcvPhone, rcvAddress, rcvName);
	    
	    OrderDAO.insertOrder(vo); //결제하기 누르면 vo를 ORDER 테이블에 담고
	    
	    int orderId = OrderDAO.seleteOrderId(memId); //DB에 담은 후 생성된 orderId를 가져온다
	    
	    session.setAttribute("orderId", orderId); //session에 orderId 저장

	    OrderVO orderInfo = OrderDAO.getOrderInfo(orderId);
	    session.setAttribute("orderInfo", orderInfo);
	    
	    request.getRequestDispatcher("insertDetail").forward(request, response);
	    
	 } catch (IOException e) {
         e.printStackTrace();
         response.sendRedirect("error.jsp");
     }

	
}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			System.out.println("> InsertOrderController doPost() 시작");
		    request.setCharacterEncoding("UTF-8");
		    doGet(request, response);
		    System.out.println("> InsertOrderController doPost() 끝");
		} catch (IOException e) {
	         e.printStackTrace();
	         response.sendRedirect("error.jsp");
	    }

	}

}
