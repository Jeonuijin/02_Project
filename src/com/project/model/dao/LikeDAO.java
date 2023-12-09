package com.project.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.model.vo.LikeVO;
import com.project.mybatis.DBService;

public class LikeDAO {

	//찜 목록에 해당 상품이 있는지 조회
	public static int checkLike(LikeVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		Integer result = ss.selectOne("project.checkLike", vo);
		ss.close();
		return result != null ? result : 0;
	}

	//찜 목록에 추가
	public static int addLike(LikeVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("project.addLike", vo);
		ss.close();
		return result;
	}

	//찜 목록 조회하기
	public static List<LikeVO> checkTotalLike(String memId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<LikeVO> list = ss.selectList("project.checkTotalLike", memId);
		ss.close();
		return list;
	}
	
	//찜 목록에서 삭제
	public static int deleteLike(LikeVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("project.deleteLike", vo);
		ss.close();
		return result;
	}

}
