package com.project.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.dao.CartDAO;
import com.project.model.vo.CartVO;
import com.project.model.vo.MembersVO;


@WebServlet("/user/deleteSel")
public class DeleteSelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			response.setContentType("application/json; charset=UTF-8");
			
			//session 저장된 id 받아오기
			HttpSession session = request.getSession();
			MembersVO loginUser = (MembersVO)session.getAttribute("loginUser");
			String memId = loginUser.getMemId();
			
			System.out.println(memId);
			
			//선택된 항목의 value(bookId) 받아오고 comma(,) 기준으로 String타입으로 합치기
		    String sel = request.getParameter("selectedItems");
		    String[] selectedItems = sel.split(",");
		    
		    int delResult = 0;
		    
		    //반복문 이용해서 seletedItems에 있는 String을 int로 바꾸고 
		    //CartVO 객체를 만든 후 장바구니에서 삭제
		    for (String sBookId : selectedItems) {
		    	int bookId = Integer.parseInt(sBookId);
		    	CartVO vo = new CartVO(memId, bookId);
		    	
		    	delResult = CartDAO.deleteSel(vo);
		    }
		    
		    List<CartVO> list = CartDAO.checkTotalCart(memId);
		    System.out.println("list : " + list);
		    
		    //위 데이터 list를 JSON 형식 문자열 만들기
		  	// {"list" : [{}, {}, ... , {}] }
		    String result = makeJson(list);
		    
		    //클라이언트에게 응답처리
		    PrintWriter out = response.getWriter();
		    out.print(result);
		
		 } catch (IOException e) {
	         e.printStackTrace();
	         response.sendRedirect("error.jsp");
	     }

	    
	}

	private String makeJson(List<CartVO> list) {
		//JSON 형식 문자열 만들기
		StringBuilder result = new StringBuilder();
		result.append("{ \"list\" : [");

		for (CartVO vo : list) {
		    result.append("{");
		    result.append("\"memId\": \"" + vo.getMemId() + "\", "); // 따옴표가 빠졌습니다.
		    result.append("\"bookId\": \"" + vo.getBookId() + "\", "); // 따옴표가 빠졌습니다.
		    result.append("\"price\": " + vo.getPrice() + ", ");
		    result.append("\"bookName\": \"" + vo.getBookName() + "\"");
		    result.append("},");
		}

		if (!list.isEmpty()) {
		    result.deleteCharAt(result.length() - 1); // 마지막 쉼표 제거
		}

		result.append("]}");
		
		System.out.println(result.toString());
		
		return result.toString();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			System.out.println("> DeleteCartController doPost() 시작");
		    request.setCharacterEncoding("UTF-8");
		    doGet(request, response);
		    System.out.println("> DeleteCartController doPost() 끝");
		    
		 } catch (IOException e) {
	         e.printStackTrace();
	         response.sendRedirect("error.jsp");
		 }

	}
	

}
