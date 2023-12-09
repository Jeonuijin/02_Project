package com.project.controller.products;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.model.dao.adminBookDAO;
import com.project.model.vo.BookVO;

//(관리자) 등록된 책 정보를 수정하는 컨트롤러
@WebServlet("/admin/bookUpdate")
public class BookUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			// 파일 저장위치
			String path = "c:/MyStudy/bookImage";
			MultipartRequest mr = new MultipartRequest(req, path, (10 * 1024 * 1024), "UTF-8",
					new DefaultFileRenamePolicy());

			// 전달받은 데이터 VO에 저장 후 DB에 입력 처리(DB 연동작업)
			BookVO vo = new BookVO();
			vo.setBookId(Integer.parseInt(mr.getParameter("bookId")));
			vo.setBookName(mr.getParameter("bookName"));
			vo.setPrice(Integer.parseInt(mr.getParameter("price")));

			vo.setPublisher(mr.getParameter("publisher"));
			vo.setPubDate(mr.getParameter("pubDate"));
			vo.setAuthor(mr.getParameter("author"));
			vo.setBookCnt(Integer.parseInt(mr.getParameter("bookCnt")));
			vo.setOrderCnt(Integer.parseInt(mr.getParameter("orderCnt")));
			vo.setDetails(mr.getParameter("details"));
			vo.setCategory(mr.getParameter("category"));

			// 파일 업로드 처리
			if (mr.getFile("bookImage") != null) {
				String uploadedFileName = mr.getFile("bookImage").getName();
				vo.setBookImage(uploadedFileName);
			} else {
				// 파일 업로드 실패 또는 파일이 선택 되지 않은 경우 처리
				vo.setBookImage(null);
			}

			System.out.println("> vo datas : " + vo);

			// DB에 입력(저장) 처리
			int result = adminBookDAO.update(vo); // 인서트 메서드 호출 결과를 변수에 저장

			if (result == 1) {
				// 성공했을 때 응답 메시지 출력
				System.out.println("성공했습니다");
				req.setAttribute("fileUpdate", result);
				req.getRequestDispatcher("bookUpdate.jsp").forward(req, resp);
			} else {
				// 실패했을 때 다른 메시지 출력 또는 오류 처리
				resp.sendRedirect("bookUpdate.jsp");
			}

			// 화면전환(목록페이지로 이동 - 첫페이지로 가기) response.sendRedirect("list.jsp");
		} catch (IOException e) {
			e.printStackTrace();
			resp.sendRedirect("error.jsp");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			System.out.println(":: DeptListController doPost() 시작---------");

			req.setCharacterEncoding("UTF-8");
			doGet(req, resp);

			System.out.println(":: DeptListController doPost() 끝---------");
		} catch (IOException e) {
			e.printStackTrace();
			// IOException 처리 코드 추가
			resp.sendRedirect("error.jsp"); // 예외 발생 시 에러 페이지로 이동
		}
	}
}