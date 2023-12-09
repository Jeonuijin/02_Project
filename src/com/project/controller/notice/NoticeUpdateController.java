
package com.project.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.dao.NoticeBoardDAO;
import com.project.model.vo.NoticeBoardVO;

@WebServlet("/notice/noticeupdate")
public class NoticeUpdateController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // POST 요청 처리 (게시글 작성 등)
    	request.setCharacterEncoding("UTF-8");  	
    	 	
        // 요청 파라미터 값 가져오기	
    	String nbIdx = request.getParameter("nbIdx");
    	String type = request.getParameter("type");
        String title = request.getParameter("title");
        String contents = request.getParameter("contents");
		
		// 게시글 객체 생성 및 값 설정
        NoticeBoardVO vo = new NoticeBoardVO(nbIdx, type, title, contents);
        vo.setNbIdx(nbIdx);
        vo.setType(type);
        vo.setTitle(title);
        vo.setContents(contents);
       
        System.out.println(vo);
        
        int result = NoticeBoardDAO.update(vo);
		System.out.println("등록완료 : " + result);
		
		response.sendRedirect("noticeboardadmin");
    }
    	
}
