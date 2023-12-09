package com.project.model.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.model.vo.BbsVO;
import com.project.model.vo.BookVO;
import com.project.model.vo.MembersVO;
import com.project.mybatis.DBService;

public class adminBookDAO {

	//게시글(BBS) 전체 건수 조회
		public static int getTotalCount() {
			int totalCount = 0;
			
			SqlSession ss = DBService.getFactory().openSession();
			try {
				totalCount = ss.selectOne("Book.totalCount");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ss.close();
			}
			
			return totalCount;
		}
		//페이지에 해당하는 글목록(게시글) 가져오기(조회)
		public static List<BbsVO> getPageList(int begin, int end) {
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			
			SqlSession ss = DBService.getFactory().openSession();
			List<BbsVO> list = ss.selectList("Book.Pagelist", map);
			ss.close();
			
			return list;
		}
	//상품등록(입력처리)
	public static int insert (BookVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("Book.insert", vo);
		ss.close();
		return result;
	}
	 
	//상품리스트 조회
	public static List<BookVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BookVO> list = ss.selectList("Book.list");
		ss.close();
		return list;
	}
	
	//상품리스트 책 아이디로 조회
		public static List<BookVO> selectBookId(String bookId) {
			SqlSession ss = DBService.getFactory().openSession();
			List<BookVO> list = ss.selectList("Book.selectBookId", bookId);
			ss.close();
			return list;
		}
		
	//상품정보수정
	public static int update(BookVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("Book.update", vo);
		ss.close();
		return result;
	}
	
	//상품삭제
	public static int stateUpdate(String bookId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("Book.stateUpdate", bookId);
		ss.close();
		return result;
	}
	//
	public static int orderCnt(int bookId, int bookCnt) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("Book.orderCnt", Map.of("bookId", bookId, "bookCnt", bookCnt));
		ss.close();
		return result;
		
	}
	public static int orderCntMinus(int bookId, int bookCnt) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("Book.orderCntMinus", Map.of("bookId", bookId, "bookCnt", bookCnt));
		ss.close();
		return result;
		
	}
	public static int bookCnt(int bookId, int bookCnt) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("Book.bookCnt", Map.of("bookId", bookId, "bookCnt", bookCnt));
		ss.close();
		return result;
		
	}
	
	public static int bookCntMinus(int bookId, int bookCnt) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("Book.bookCntMinus", Map.of("bookId", bookId, "bookCnt", bookCnt));
		ss.close();
		return result;
		
	}
	
	
	//----------------------------------------------------
	//(관리자)회원관리에서 전체회원정보 보기
	public static List<MembersVO> memberList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<MembersVO> list = ss.selectList("members.listAll");
		ss.close();
		return list;
	
	}
}





