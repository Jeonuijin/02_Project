package com.project.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.model.vo.BookVO;
import com.project.model.vo.CartVO;
import com.project.model.vo.OrderVO;
import com.project.mybatis.DBService;


public class CartDAO {

	//장바구니에 해당 상품이 있는지 조회
	public static int checkBook(CartVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		Integer result = ss.selectOne("project.checkBook", vo);
		ss.close();
		return result != null ? result : 0;
	}
	
	//장바구니에 해당 상품이 없으면 추가하도록
	public static int addCart(CartVO vo){
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("project.addCart", vo);
		ss.close();
		return result;
	}
	
	//장바구니에 해당 상품이 있으면 업데이트
	public static int updateCart(CartVO vo){
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("project.updateCart", vo);
		ss.close();
		return result;
	}
	
	//장바구니 목록 조회
	public static List<CartVO> checkTotalCart(String memId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<CartVO> list = ss.selectList("project.checkTotalCart", memId);
		ss.close();
		return list;
	}
	
	//책 정보 가져오기
	public static BookVO getInfo(int bookId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		//System.out.println(bookId);
		BookVO bvo = ss.selectOne("project.getInfo", bookId);
		ss.close();
		return bvo;
	}
	
	//상품 하나 장바구니에서 삭제하기
	public static int deleteOne(CartVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("project.deleteOne", vo);
		ss.close();
		return result;
	}
	
	//선택한(selected)한 상품 장바구니에서 삭제하기
	public static int deleteSel(CartVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("project.deleteSel", vo);
		ss.close();
		return result;
	}
	
	//장바구니 목록 비우기
	public static int deleteAll(String memId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("project.deleteAll", memId);
		ss.close();
		return result;
	}
	
	//memId와 bookId를 이용해서 Cart테이블에 담긴 데이터 가져오기
	public static CartVO getCartInfo(int bookId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		CartVO vo = ss.selectOne("project.getBook", bookId);
		ss.close();
		return vo;
	}
	
	//바로 결제를 위해 책정보 가져오기
		public static CartVO getCartInfo(String memId, int bookId) {
			SqlSession ss = DBService.getFactory().openSession(true);
			CartVO vo = ss.selectOne("project.getCartInfo", Map.of("memId", memId, "bookId", bookId));
			ss.close();
			return vo;
		}

	public static void minusCnt(CartVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("project.minusCnt", Map.of("memId", vo.memId, "bookId", vo.bookId, "bookCnt", vo.bookCnt));
		ss.close();
		return;
		
	}

	public static void plusCnt(CartVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("project.plusCnt", Map.of("memId", vo.memId, "bookId", vo.bookId, "bookCnt", vo.bookCnt));
		ss.close();
		return;
		
	}
	
	
	
	
}
	


