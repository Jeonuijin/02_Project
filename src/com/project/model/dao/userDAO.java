package com.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.model.vo.BbsVO;
import com.project.model.vo.BookReviewVO;
import com.project.model.vo.BookVO;
import com.project.mybatis.DBService;

public class userDAO {
	//통합검색
	public static List<BookVO> searchAll(String search) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BookVO> list = ss.selectList("Book.searchAll", search);
		ss.close();
		return list;
	}
	//책제목으로 검색
	public static List<BookVO> searchByTitle(String search) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BookVO> list = ss.selectList("Book.searchByTitle", search);
		ss.close();
		return list;
	}
	//작가별검색
	public static List<BookVO> searchByAuthor(String search) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BookVO> list = ss.selectList("Book.searchByAuthor", search);
		ss.close();
		return list;
	}
	//판매수 높은 순으로 도서 카테고리 나열(베스트도서 카테고리) - 종합
	public static List<BookVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BookVO> list = ss.selectList("Book.BestBooklist");
		ss.close();
		return list;
	}
	
	//판매수 높은 순으로 도서 카테고리 나열(베스트도서 카테고리) - 카테고리별
	public static List<BookVO> selectBest(String category) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BookVO> list = ss.selectList("Book.BestBookOne", category);
		ss.close();
		return list;
	}
	//신간도서 카테고리 나열(베스트도서 카테고리) - 종합
	public static List<BookVO> getNewList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BookVO> list = ss.selectList("Book.NewBooklist");
		ss.close();
		return list;
	}
	//신간도서 카테고리 나열(베스트도서 카테고리) - 카테고리별
	public static List<BookVO> selectNew(String category) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BookVO> list = ss.selectList("Book.NewBookOne", category);
		ss.close();
		return list;
	}
	//------------------리뷰-----------
	
	//리뷰,평점 등록
	public static int review(BookReviewVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("Book.review", vo);
		ss.close();
		return result;
	}

	//리뷰,평점 조회
	public static List<BookReviewVO> getReviewList(String bookId/* , String memId */) {
		SqlSession ss = DBService.getFactory().openSession();
		//Map<String, String> map = new HashMap<>();
		//map.put("bookId", bookId);
		//map.put("memId", memId);
		
		List<BookReviewVO> list = ss.selectList("Book.Reviewlist", bookId);
		//List<BookReviewVO> list = ss.selectList("Book.Reviewlist", map);
		ss.close();
		return list;
		
	}
	
	//id값 받아서 자신이 작성한 리뷰 삭제
	public static int deleteReview(String memId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("Book.deleteReview", memId);
		ss.close();
		return result;
	}

	//리뷰,평점 수정
	public static int reviewUpdate(BookReviewVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("Book.reviewUpdate", vo);
		ss.close();
		return result;
	}
}