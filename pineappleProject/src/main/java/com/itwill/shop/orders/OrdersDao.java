package com.itwill.shop.orders;

import java.util.List;

public interface OrdersDao {
	//주문 등록
<<<<<<< Upstream, based on origin/Ateam/기현
	int insert(Orders order) throws Exception;

=======
	int insertOrder(Orders order) throws Exception;
>>>>>>> 02c44db orders insert 완성
	
	//주문 전체 리스트(전체) 어드민
	List<Orders> findAll() throws Exception;
	
	//주문 전체 리스트(특정 사용자)
	List<Orders> findByOrderNo(int orderNo) throws Exception;
	
	//주문+주문 아이템(특정사용자, 특정 주문)
	List<Orders> findOrderByOrderItems(int customerNo, int orderNo) throws Exception;
	
	// 주문 1건 삭제(특정 주문)
	int deleteOrder(int orderNo) throws Exception;
	
}
