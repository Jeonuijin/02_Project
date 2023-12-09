package com.project.controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.dao.NoticeBoardDAO;
import com.project.model.vo.NoticeBoardVO;

@WebServlet("/notice/noticeboardadmin")
public class NoticeBoardAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ListController doGet() 시작");

		response.setContentType("text/html;charset=UTF-8");
		
		System.out.println(">>> doGet 업무처리 ~~~~");
		String cPage = request.getParameter("cPage");
		System.out.println("cPage :::" + cPage);
		
		// 1. DB연결하고 데이터 가져오기
		List<NoticeBoardVO> list = NoticeBoardDAO.getList();
		
		System.out.println(list);
		
		if (list != null) {
			request.setAttribute("size", list.size());	
			System.out.println("리스트 사이즈 : " + list.size());
		}
		
		// 2. 응답페이지(board.jsp)에 전달
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);

		// 3. 페이지 전환 - 응답할 페이지(board.jsp)로 포워딩(위임,전가)
		request.getRequestDispatcher("noticeboardadmin.jsp").forward(request, response);
				
		System.out.println("> ListController doGet() 끝");
	}

}
