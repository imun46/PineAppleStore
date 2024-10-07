package com.itwill.pineappleTest;

import java.util.Date;

import com.itwill.shop.customer.Customer;
import com.itwill.shop.orders.Orders;
import com.itwill.shop.orders.OrdersDao;
import com.itwill.shop.orders.OrdersDaoImpl;
import com.itwill.shop.orders.OrdersService;

public class OrderServiceTest {
	public static void main(String[] args) throws Exception {
		OrdersService ordersService = new OrdersService();
		
		
		/* 주문 바로 등록 출력 */
		Orders newOrder = Orders.builder()
						.ordersTotprice(50000)
						.ordersFinalprice(45000)
						.ordersTotqty(5)
						.ordersAddress("서울시 강남구")
						.ordersStatus("배송중")
						.customer(Customer.builder().customerNo(2).build())
						.build();
		System.out.println("주문등록 완료 : " + ordersService.insertOrder(newOrder));
		
		/* 주문 바로 등록 출력 */
		Orders cartOrder = Orders.builder()
				.ordersTotprice(50000)
				.ordersFinalprice(45000)
				.ordersTotqty(5)
				.ordersAddress("서울시 강남구")
				.ordersStatus("배송중")
				.build();
		System.out.println("주문등록 완료 : " + ordersService.insertOrder(cartOrder));
		
		
		/*배송 상태 변경*/
//		Orders orderStatus = Orders.builder()
//							.ordersNo(1)
//							.ordersStatus("배송중")
//							.build();
//		
//		System.out.println("배송 상태 변경 : " + ordersService.updateOrderStatus(orderStatus));
		
		/*배송 상태 변경*/
//		Orders orderConfirm = Orders.builder()
//				.ordersNo(1)
//				.ordersArrivaldate(new Date())
//				.ordersStatus("구매확정")
//				.build();
//		System.out.println("배송 상태 변경 : " + ordersService.updateOrderStatus(orderConfirm));
		

		/* 주문 삭제 (전체) */
//		System.out.println("주문 삭제 : " + ordersService.delete(1));
		
		/* 전체 리스트 출력 */
//		System.out.println(ordersService.finfAll());
		
		/* 주문+주문 아이템 리스트 출력(특정사용자) */
//		System.out.println(ordersService.findByOrderNo(3));
		
		
	}
}
