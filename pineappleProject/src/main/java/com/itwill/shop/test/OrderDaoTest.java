package com.itwill.shop.test;

import java.util.ArrayList;
import java.util.List;

import com.itwill.shop.customer.Customer;
import com.itwill.shop.customer.CustomerCoupons;
import com.itwill.shop.orders.Orders;
import com.itwill.shop.orders.OrdersDao;
import com.itwill.shop.orders.OrdersDaoImpl;
import com.itwill.shop.orders.OrdersItems;
import com.itwill.shop.product.Product;

public class OrderDaoTest {
	
	public static void main(String[] args) throws Exception {
		OrdersDao ordersDao = new OrdersDaoImpl();
		
		/************insert*************/
		List<OrdersItems> newOrderItemsList = new ArrayList<>();
		
		newOrderItemsList.add(new OrdersItems(1,5000,35000,5,"색상: 검정, 용량: 256gb", Orders.builder().ordersNo(13).build(), Product.builder().productNo(1).build()));
		newOrderItemsList.add(new OrdersItems(1,5000,35000,5,"색상: 노랑, 용량: 256gb", Orders.builder().ordersNo(13).build(), Product.builder().productNo(1).build()));
		newOrderItemsList.add(new OrdersItems(1,5000,35000,5,"색상: 빨강, 용량: 256gb", Orders.builder().ordersNo(13).build(), Product.builder().productNo(1).build()));
		
		Orders newOrder = Orders.builder()
							.ordersTotprice(50000)
							.ordersFinalprice(450000)
							.ordersTotqty(6)
							.ordersAddress("주소일걸요")
							.ordersStatus("배송중")
							.orderItemList(newOrderItemsList)
							.customer(Customer.builder().customerNo(1).build())
							.customerCoupons(CustomerCoupons.builder().customerCouponsNo(1).build())
							.build();
		
//		System.out.println(ordersDao.insertOrder(newOrder));
		
		
		/************delete*************/
//		System.out.println(ordersDao.deleteOrder(4));
		
//		System.out.println(ordersDao.findAll());
		
		/************select*************/
		System.out.println(ordersDao.findByOrderNo(5));
	}
}
