package com.itwill.shop.mapper;

import java.util.List;

import com.itwill.shop.orders.Orders;

public interface OrdersMapper {
	//주문 등록
	int insert(Orders order) throws Exception;
	
	//주문 전체 리스트(특정 사용자)
	List<Orders> selectAll() throws Exception;
	
	//주문+주문 아이템(특정사용자, 특정 주문)
	List<Orders> selectOrderByOrderItems() throws Exception;
	
	// 주문 1건 삭제(특정 주문)
	int delete(int orderNo) throws Exception;
}
