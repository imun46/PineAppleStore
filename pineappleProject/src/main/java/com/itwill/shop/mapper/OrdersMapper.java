package com.itwill.shop.mapper;

import java.util.List;

import com.itwill.shop.orders.Orders;
import com.itwill.shop.orders.OrdersItems;

public interface OrdersMapper {
	//주문 등록
	int insertOrder(Orders order) throws Exception;
	int insertOrderItem(OrdersItems orderItems) throws Exception;
	
	//[어드민]배송상태 변경
	int updateOrderStatus(Orders orders) throws Exception;
	
	//[회원]구매확정 
	int updateOrderConfirm(Orders orders) throws Exception; 
	
	//주문 전체 리스트(전체) 어드민
	List<Orders> selectAll() throws Exception;
	
	//주문+주문리스트 전체 리스트(특정 사용자)
	List<Orders> selectByOrderNo(int orderNo) throws Exception;
	
	// 주문 1건 삭제(특정 주문)
	int delete(int orderNo) throws Exception;
}
