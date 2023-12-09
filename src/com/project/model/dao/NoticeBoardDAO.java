package com.project.model.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.model.vo.NoticeBoardVO;
import com.project.mybatis.DBService;


public class NoticeBoardDAO {

	//전체 게시글 조회 
		public static List<NoticeBoardVO> getList() {
			SqlSession ss = DBService.getFactory().openSession();
			List<NoticeBoardVO> list = ss.selectList("NOTICEBOARD.list");
			ss.close();
			return list;
		} 		
		
	// 게시글 1개 조회
		public static NoticeBoardVO getOne(int nbIdx) {
			SqlSession ss = DBService.getFactory().openSession();
			NoticeBoardVO vo = ss.selectOne("NOTICEBOARD.one", nbIdx);
			ss.close();
			return vo;
		}
		
	// 게시글 작성
		public static int insert(NoticeBoardVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("NOTICEBOARD.insert", vo);
			ss.close();
			
			return result;
		}
		
	// 게시글 수정
		public static int update(NoticeBoardVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("NOTICEBOARD.upd", vo);
			ss.close();
			
			return result;
		}
		
	// 게시글 삭제
		public static int delete(int nbIdx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("NOTICEBOARD.del", nbIdx);
			ss.close();
			
			return result;
		}
//		
//		//페이지에 해당하는 글목록(게시글) 가져오기(조회)
//		public static List<PagingVO> getList(int begin, int end) {
//			Map<String, Integer> map = new HashMap<>();
//			map.put("begin", begin);
//			map.put("end", end);
//			
//			SqlSession ss = DBService.getFactory().openSession();
//			List<PagingVO> list = ss.selectList("NOTICEBOARD.paging", map);
//			ss.close();
//			
//			return list;
//		}
		
		
		
		
}
