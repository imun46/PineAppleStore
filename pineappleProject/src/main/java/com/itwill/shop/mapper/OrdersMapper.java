package com.itwill.shop.mapper;

import java.util.List;

import com.itwill.shop.orders.Orders;
import com.itwill.shop.orders.OrdersItems;

public interface OrdersMapper {
	//주문 등록
	int insertOrder(Orders order) throws Exception;
	int insertOrderItem(OrdersItems orderItems) throws Exception;
	
	//주문 전체 리스트(전체) 어드민
	List<Orders> selectAll() throws Exception;
	
	//주문+주문리스트 전체 리스트(특정 사용자)
	List<Orders> selectByOrderNo(int orderNo) throws Exception;
	
<<<<<<< Upstream, based on origin/Ateam/기현
	//주문+주문 아이템(특정사용자, 특정 주문)
<<<<<<< Upstream, based on origin/Ateam/기현
=======
	List<Orders> selectOrderByOrderItems(int customerNo, int orderNo) throws Exception;
>>>>>>> bf33bf1 orders delete 완료
	
	//주문 1개 
=======
	// 주문 1건 삭제(특정 주문)
	int delete(int orderNo) throws Exception;
>>>>>>> 5ede523 orders select 완성 , service 구현 완료
}
