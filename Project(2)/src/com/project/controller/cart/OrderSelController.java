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


@WebServlet("/user/orderSel")
public class OrderSelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			
			response.setContentType("application/json; charset=UTF-8");
			
			//session 저장된 id 받아오기
			HttpSession session = request.getSession();

			MembersVO loginUser = (MembersVO)session.getAttribute("loginUser");

			String memId = loginUser.getMemId();

			System.out.println("주문하는 사람 아이디 : " + memId);
			
			//선택된 항목의 value(bookId) 받아오고 comma(,)를 기준으로 String타입으로 합치기
			
			
			String sel = request.getParameter("selectedItems");
			System.out.println("sel" + sel);
			
				String[] selectedItems = sel.split(",");
		    
		    //controller에서 목록을 어케 만들어서 전해줘요????
		    System.out.println("selectedItems" + selectedItems);
		    
		    
		    List<CartVO> list = new ArrayList<CartVO>();
		    
		    for (String sBookId : selectedItems) {
		    	int bookId = Integer.parseInt(sBookId); //sBookId int로 변환
		    	
		    	CartVO vo = CartDAO.getCartInfo(memId, bookId);  //bookId로 책 정보 받아와서 list에 저장
		    	
		    	//주문하면 book테이블의 주문수량이증가
		    	adminBookDAO.orderCnt(bookId, vo.getBookCnt());
		    	
		    	//주문하면 book테이블의 재고가 마이너스
		    	adminBookDAO.bookCnt(bookId, vo.getBookCnt());
		    	
		    	list.add(vo);
	
		    }
			
		    session.setAttribute("list", list);
		    //request.getSession().setAttribute("list", list); //request.getSession을 통해 session에 setAttribute 호출 가능
			
		    //3. 페이지 전환 - 응답할 페이지(order.jsp)로 포워딩(위임,전가)
		    request.getRequestDispatcher("order.jsp").forward(request, response);
		    
		    
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
