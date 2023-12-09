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

import com.project.model.dao.CartDAO;
import com.project.model.dao.OrderDAO;
import com.project.model.vo.BookVO;
import com.project.model.vo.CartVO;
import com.project.model.vo.DetailVO;
import com.project.model.vo.MembersVO;
import com.project.model.vo.OrderVO;

@WebServlet("/user/insertDetail")
public class InsertDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            MembersVO loginUser = (MembersVO) session.getAttribute("loginUser");
            String memId = loginUser.getMemId();

            int orderId = (int) session.getAttribute("orderId");

            // "list" 세션 속성에서 객체를 가져온 후 안전하게 형변환
            Object listObject = session.getAttribute("list");
            List<CartVO> list = new ArrayList<CartVO>();
            if (listObject instanceof List<?>) {
                List<?> rawList = (List<?>) listObject;
                for (Object item : rawList) {
                    if (item instanceof CartVO) {
                        list.add((CartVO) item);
                    }
                }
            }

            List<DetailVO> detailList = new ArrayList<>();

            for (CartVO vo : list) {
                DetailVO detailvo = new DetailVO(orderId, memId, vo.getBookId(), vo.getBookName(), vo.getBookCnt(), vo.getPrice());
                detailList.add(detailvo);
            }

            // 주문한 도서 정보 담은 detailList (bookId, bookName 등등)
            session.setAttribute("detailList", detailList);

            for (DetailVO vo : detailList) {
                OrderDAO.insertDetail(vo);
            }

            // 결제한 상품 장바구니에서 삭제
            for (CartVO vo : list) {
                CartDAO.deleteSel(vo);
            }
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println("> InsertDetailController doPost() 시작");
            request.setCharacterEncoding("UTF-8");
            doGet(request, response);
            System.out.println("> InsertDetailController doPost() 끝");
        } catch (IOException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}