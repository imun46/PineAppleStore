package com.itwill.shop.mapper;

import java.util.List;

import com.itwill.shop.orders.Orders;
import com.itwill.shop.orders.OrdersItems;

public interface OrdersMapper {
	//주문 등록
	int insertOrder(Orders order) throws Exception;
	int insertOrderItem(OrdersItems orderItems) throws Exception;
	
	//주문 전체 리스트(특정 사용자)
	List<Orders> selectAll() throws Exception;
	
	//주문+주문 아이템(특정사용자, 특정 주문)
	
	//주문 1개 
}
