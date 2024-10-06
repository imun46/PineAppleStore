package com.itwill.shop.orders;

import java.util.ArrayList;
import java.util.List;

import com.itwill.shop.cart.Cart;
import com.itwill.shop.cart.CartDao;
import com.itwill.shop.cart.CartDaoImpl;

public class OrdersService {
	private OrdersDao ordersDao;
	private CartDao cartDao;
	
	public OrdersService() throws Exception {
		ordersDao = new OrdersDaoImpl();
		cartDao = new CartDaoImpl();
	}
	
	/*바로 주문 등록*/
	public int insertOrder(Orders order) throws Exception{
		int rowCount = ordersDao.insertOrder(order);
		return rowCount;
	}
	
	/*카트 주문 등록*/
	public int insertOrderCart(Orders order) throws Exception{
		int rowCount = ordersDao.insertOrder(order);
		rowCount += cartDao.deleteByCustomerNo(order.getCustomer().getCustomerNo());
		return rowCount;
	}
	
	/*[어드민]배송상태 변경*/
	public int updateOrderStatus(Orders order) throws Exception{
		return ordersDao.updateOrderStatus(order);
	}
	
	/*[회원]구매확정*/
	public int updateOrderConfirm(Orders order) throws Exception{
		return ordersDao.updateOrderStatus(order);
	}
	
	/*카트주문 등록*/
	
	/* [어드민] 주문 전체 리스트(전체) */
	public List<Orders> finfAll() throws Exception{
		return ordersDao.findAll();
	}
	
	/*주문 + 주문 아이템 전체 리스트(특정 사용자)*/
	public List<Orders> findByOrderNo(int orderNo) throws Exception{
		return ordersDao.findByOrderNo(orderNo);
	}
	
	/*주문 삭제*/
	public int delete(int orderNo) throws Exception{
		return ordersDao.deleteOrder(orderNo);
	}
}
