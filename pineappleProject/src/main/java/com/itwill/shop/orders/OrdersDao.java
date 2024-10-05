package com.itwill.shop.orders;

import java.util.List;

public interface OrdersDao {
	//주문 등록
	int insertOrder(Orders order) throws Exception;
	
	//주문 전체 리스트(특정 사용자)
	List<Orders> findAll() throws Exception;
	
	//주문+주문 아이템(특정사용자, 특정 주문)
	List<Orders> findOrderByOrderItems() throws Exception;
	
	// 주문 1건 삭제(특정 주문)
	int deleteOrder(int orderNo) throws Exception;
	
}
