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


@WebServlet("/user/updateCnt")
public class UpdateCntController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();

			MembersVO loginUser = (MembersVO)session.getAttribute("loginUser");

			String memId = loginUser.getMemId();

			System.out.println(memId);
			
	        // 클라이언트에서 전송한 bookId와 동작(increment 또는 decrement)을 가져옴
	        int bookId = Integer.parseInt(request.getParameter("bookId"));
	        System.out.println("bookId여기가 문제임" + bookId);
	        
	        String action = request.getParameter("action");
	        
	        CartVO vo = CartDAO.getCartInfo(memId, bookId);
	        
	        if (vo != null) {
	        	if ("plus".equals(action)) {
	        		CartDAO.plusCnt(vo);
	        	} else if ("minus".equals(action)) {
	        		if (vo.bookCnt > 1) {
	        			CartDAO.minusCnt(vo);
	        		} else { 
	        			
	        		}
	        		
	        	}
	        	//plus, minus 후 업데이트 된 데이터 불러오기
	        	vo = CartDAO.getCartInfo(memId, bookId);
	        }
	        
	        //위 데이터 list를 JSON 형식 문자열 만들기
		  	// {"list" : [{}, {}, ... , {}] }
		    String result = makeJson(vo);
		    
		    //클라이언트에게 응답처리
		    PrintWriter out = response.getWriter();
		    out.print(result);
		} catch (IOException e) {
	        e.printStackTrace();
	        response.sendRedirect("error.jsp");
	    }
	}
	
	private String makeJson(CartVO vo) {
		//JSON 형식 문자열 만들기
		StringBuilder result = new StringBuilder();
		result.append("{ \"vo\" : [");
	    result.append("{");
	    result.append("\"memId\": \"" + vo.getMemId() + "\", "); 
	    result.append("\"bookId\": \"" + vo.getBookId() + "\", ");
	    result.append("\"bookCnt\": \"" + vo.getBookCnt() + "\", ");
	    result.append("\"price\": " + vo.getPrice() + ", ");
	    result.append("\"bookName\": \"" + vo.getBookName() + "\"");
	    result.append("}");
		result.append("]}");
		
		System.out.println(result.toString());
		return result.toString();
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			System.out.println("> UpdateQuantityController doPost() 시작");
		    request.setCharacterEncoding("UTF-8");
		    doGet(request, response);
		    System.out.println("> UpdateQuantityController doPost() 끝");
		    
		 } catch (IOException e) {
			 
	         e.printStackTrace();
	         response.sendRedirect("error.jsp");
	     }

	}

}
