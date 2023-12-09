package com.project.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.project.model.vo.MembersVO;
import com.project.mybatis.DBService;

public class MembersDAO {
	
	// 회원가입 중 탈퇴한 사람의 아이디를 쓸 수 없도록 해야함
	public static MembersVO search(String memId) {
		MembersVO vo = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			vo = ss.selectOne("members.search", memId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return vo;
	}
	
	// 탈퇴하지 않은 회원(1명)의 정보 조회 (+ 비밀번호 찾기)
	public static MembersVO selectOne(String memId) {
		MembersVO vo = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			vo = ss.selectOne("members.selectOne", memId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return vo;
	}
	
	// 탈퇴하지 않은 회원의 아이디 찾기
	public static MembersVO findID(String name, String phone, String birth, String email) {
		MembersVO vo = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			vo = ss.selectOne("members.findID", new MembersVO(name, phone, birth, email));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return vo;
	}
	
	// 로그인을 위해 아이디, 비밀번호로 회원 조회
	public static MembersVO login(String memId, String memPw) {
		MembersVO vo = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			vo = ss.selectOne("members.login", new MembersVO(memId, memPw));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return vo;
	}
	
	// 회원가입
	public static int signUp(MembersVO vo) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.insert("members.signUp", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}
	
	// 개인 정보 수정
	public static int update(MembersVO vo) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try { 
			result = ss.update("members.update", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}
	
	// 회원 탈퇴 (상태 변경)
	public static int dropOut(String memId, String memPw) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.update("members.dropOut", new MembersVO(memId, memPw));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}
	
}
