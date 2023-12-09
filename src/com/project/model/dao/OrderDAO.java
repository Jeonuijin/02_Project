package com.project.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.model.vo.CartVO;
import com.project.model.vo.DetailVO;
import com.project.model.vo.OrderVO;
import com.project.mybatis.DBService;

public class OrderDAO {

	
	//주문하기 누르면 전체 상품 주문 목록에 담기---------버려도 될 듯...?
	public static List<OrderVO> orderAll(String memId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<OrderVO> list = ss.selectList("project.orderAll", memId);
		ss.close();
		return list;
	}
	
	//결제하기 누르면 ORDER_ID 가져오기(SELECT)
	public static int seleteOrderId(String memId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.selectOne("project.seleteOrderId", memId);
		ss.close();
		return result;
	}
	
	//결제하기 누르면 ORDERS 테이블에 결제정보 저장
	public static int insertOrder(OrderVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("project.insertOrder", vo);
		ss.close();
		return result;
	}
	
	//결제하기 누르면 DETAILS 테이블에 상세정보 저장
	public static int insertDetail(DetailVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("project.insertDetail", vo);
		ss.close();
		return result;
	}
	
	//orderId로 주문 정보 가져오는 기능
	public static OrderVO getOrderInfo(int orderId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		OrderVO vo = ss.selectOne("project.getOrderInfo", orderId);
		ss.close();
		return vo;
	}
	
	//memId로 내 모든 orderId 가져오는 기능
	public static List<Integer> selectOrderAllId(String memId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<Integer> vo = ss.selectList("project.selectOrderAllId", memId);
		ss.close();
		return vo;
		
	}
	
	//orderId에 해당하는 모든 상세 정보 가져오기(책 목록, 가격, 수량)
	public static List<DetailVO> selectDetailByOrderId(int orderId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<DetailVO> list = ss.selectList("project.selectDetailByOrderId", orderId);
		ss.close();
		return list;
	}

	public static int deleteOneOrder(int orderId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("project.deleteOneOrder", orderId);
		ss.close();
		return result;
	}
	
	public static int deleteOneDetail(int orderId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("project.deleteOneDetail", orderId);
		ss.close();
		return result;
	}
	
	//(관리자)주문 내역조회
		public static List<OrderVO> checkUserOrder(String memId) {
			SqlSession ss = DBService.getFactory().openSession(true);
			List<OrderVO> list = ss.selectList("project.checkUserOrder", memId);
			ss.close();
			return list;
		}

	
}
