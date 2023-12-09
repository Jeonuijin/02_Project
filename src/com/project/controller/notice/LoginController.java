//package com.project.controller.notice;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.project.model.dao.MemberDAO;
//import com.project.model.dao.MembersDAO;
//import com.project.model.vo.MemberVO;
//import com.project.model.vo.MembersVO;
//
//
//@WebServlet("/login")
//public class LoginController extends HttpServlet {
//	
//	private static final long serialVersionUID = 1L;
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		
//		System.out.println("> doPost() 실행");
//
//		HttpSession session = request.getSession();
//		//1. 클라이언트가 요청한 값을 한글로 처리
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
//		
//		//2. 로그인 값 파라미터 확인
//		String id = request.getParameter("id");
//		String pw = request.getParameter("pw");
//		
//		//3. 로그인 정보 확인
//		try {
//			MembersVO vo = MembersDAO.selectOne(id, pw);
//			System.out.println(vo.getMemId());
//			System.out.println(vo.getMemPw());
//			
//			session.setAttribute("id", id);
//		
//			request.getRequestDispatcher("loginsucess.jsp").forward(request, response);	 
//					
//		} 
//		catch (NullPointerException e) {
//			System.out.println("NullPointerException 예외발생");
//			request.getRequestDispatcher("loginfail.jsp").forward(request, response);	 
//		} finally {
//			System.out.println("성공");
//		}	  
//		System.out.println("> doPost() 끝");
//	}
//
//}
