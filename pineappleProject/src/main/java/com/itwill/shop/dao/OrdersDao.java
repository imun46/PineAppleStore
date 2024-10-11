package com.itwill.shop.dao;

import java.util.List;
import java.util.Map;

import com.itwill.shop.domain.Orders;
import com.itwill.shop.domain.OrdersItems;

public interface OrdersDao {
	
	// 주문 등록
	int insertOrders(Orders order) throws Exception;
	
	// 주문 아이템 등록
	int insertOrdersItems(OrdersItems ordersItems) throws Exception;
	
	//배송 상태 변경 (어드민)
	int updateOrdersStatus(Map<String, Object> paramMap) throws Exception;

	// 배송 시작 여부 확인
	int checkOrdersStatusNotArrived(Integer ordersNo) throws Exception;
		
	// 주문 취소 (회원)
	int cancelOrdersByOrdersNo(Integer ordersNo) throws Exception;
	
	// 구매 확정 (회원) 
	int updateOrdersConfirm(Integer ordersNo) throws Exception; 
	
	// 주문 전체 리스트 반환 (어드민) (추후 구현 예정)(추후 구현 예정)
	List<Orders> findAll() throws Exception;
	
	// 주문 번호로 주문 + 주문 아이템 전체 리스트 반환
	List<Orders> findByOrdersNo(Integer orderNo) throws Exception;
	
	// 회원 번호로 주문 + 주문 아이템 전체 리스트 반환
	List<Orders> findByCustomerNo(Integer orderNo) throws Exception;
	
	// 주문 번호로 주문 삭제
	int deleteByOrdersNo(Integer orderNo) throws Exception;
}
