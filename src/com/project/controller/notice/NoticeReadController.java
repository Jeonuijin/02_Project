
package com.project.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.dao.NoticeBoardDAO;
import com.project.model.vo.NoticeBoardVO;

@WebServlet("/notice/noticeread")
public class NoticeReadController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		System.out.println("> getOneController doGet() 시작");

    	response.setContentType("text/html;charset=UTF-8");
    	
		System.out.println(">>> doGet 업무처리 ~~~~");
		
		int nbIdx = Integer.parseInt(request.getParameter("nbIdx"));
		System.out.println(nbIdx);
		
		NoticeBoardVO vo = NoticeBoardDAO.getOne(nbIdx);
		
		request.setAttribute("vo", vo);
		request.getRequestDispatcher("noticeread.jsp").forward(request, response);
		
    }
   
}
