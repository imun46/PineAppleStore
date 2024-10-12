package com.itwill.shop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itwill.shop.dao.CartDao;
import com.itwill.shop.dao.OrdersDao;
import com.itwill.shop.daoimpl.CartDaoImpl;
import com.itwill.shop.daoimpl.OrdersDaoImpl;
import com.itwill.shop.domain.Orders;
import com.itwill.shop.domain.OrdersItems;

public class OrdersService {
	private OrdersDao ordersDao;
	private CartDao cartDao;
	
	public OrdersService() throws Exception {
		ordersDao = new OrdersDaoImpl();
		cartDao = new CartDaoImpl();
	}
	
	// 바로 주문 등록
	public int insertOrders(Orders orders) throws Exception{
		// 주문+주문 아이템 하나 등록
		int rowCount = ordersDao.insertOrders(orders);
		ordersDao.insertOrdersItems(orders.getOrdersItemsList().get(0));
		return rowCount;
	}
	
	// 카트 주문 등록 (회원 번호 orders의 멤버 필드인 customer 객체에 꼭 넣어줘야함)
	public int insertOrdersCart(Orders orders, List<Integer> cartNoList) throws Exception{
		// 주문 등록
		int rowCount = ordersDao.insertOrders(orders);
		// 주문 아이템 리스트 등록
		for (OrdersItems ordersItems : orders.getOrdersItemsList()) {
			ordersDao.insertOrdersItems(ordersItems);
		}
		// 회원 번호로 카트 비우기
		for(Integer cartNo : cartNoList) {
			cartDao.deleteByCartNo(cartNo);
		}
		return rowCount;
	}
	
	// 배송 상태 변경
	// 배송 전, 배송 중, 배송 완료, 주문 취소
	public int updateOrdersStatus(String ordersStatus, Integer ordersNo) throws Exception{
		// 해시맵 생성
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ordersStatus", ordersStatus);
		paramMap.put("ordersNo", ordersNo);
		return ordersDao.updateOrdersStatus(paramMap);
	}
	
	// 주문 취소 (회원)
	public int cancelOrdersByOrdersNo(Integer ordersNo) throws Exception {
		// 배송 시작 여부 확인
		if(ordersDao.checkOrdersStatusNotArrived(ordersNo)==1) {
			// 배송 시작 전이면 주문 취소 처리
			ordersDao.cancelOrdersByOrdersNo(ordersNo);
			return 1;
		}
		// 배송 시작했으면 주문 취소 불가
		return 0;
	}
	
	
	// 구매 확정 (회원)
	public int updateOrdersConfirm(Integer ordersNo) throws Exception{
		return ordersDao.updateOrdersConfirm(ordersNo);
	}
	
	// 전체 주문 리스트 반환 (어드민) (추후 구현 예정)
	public List<Orders> findAll() throws Exception{
		return null;
	}
	
	// 주문 번호로 주문 + 주문 아이템 리스트 반환
	public List<Orders> findByOrdersNo(int orderNo) throws Exception{
		return ordersDao.findByOrdersNo(orderNo);
	}
	
	// 회원 번호로 주문 + 주문 아이템 리스트 반환
	public List<Orders> findByCustomerNo(Integer customerNo) throws Exception {
		return ordersDao.findByCustomerNo(customerNo);
	}
	
	
	// 주문 삭제
	public int deleteByOrdersNo(Integer orderNo) throws Exception{
		return ordersDao.deleteByOrdersNo(orderNo);
	}
	
}
