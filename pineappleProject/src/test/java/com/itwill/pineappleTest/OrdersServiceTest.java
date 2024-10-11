package com.itwill.pineappleTest;

import java.util.ArrayList;
import java.util.List;

import com.itwill.shop.domain.Coupon;
import com.itwill.shop.domain.Customer;
import com.itwill.shop.domain.CustomerCoupons;
import com.itwill.shop.domain.Orders;
import com.itwill.shop.domain.OrdersItems;
import com.itwill.shop.domain.Product;
import com.itwill.shop.domain.ProductImage;
import com.itwill.shop.service.OrdersService;

public class OrdersServiceTest {

	public static void main(String[] args) throws Exception {
		
		OrdersService ordersService = new OrdersService();
		
		/**************** 바로 주문 등록 *******************/
//		
//		// 기타 정보 지정
//		int customerNo = 1;
//		int productNo1 = 1;
//		int productNo2 = 2;
//		
//		// 주문 아이템 사진 리스트 생성
//		List<ProductImage> productImageList1 = new ArrayList<>();
//		productImageList1.add(ProductImage.builder()
//				.productImageFile("image1")
//				.build());
//		List<ProductImage> productImageList2 = new ArrayList<>();
//		productImageList2.add(ProductImage.builder()
//				.productImageFile("image2")
//				.build());
//		
//		// 주문 아이템 리스트 생성
//		List<OrdersItems> ordersItemsList1 = new ArrayList<>();
//		OrdersItems ordersItems1 = OrdersItems.builder()
//				.ordersItemsPrice(20000)
//				.ordersItemsFinalprice(10000)
//				.ordersItemsQty(1)
//				.ordersItemsOptions("List of descriptions")
//				.product(Product.builder()
//						.productNo(productNo1)
//						.productName("아이폰14")
//						.productImageList(productImageList1)
//						.build())
//				.build();
//
//		ordersItemsList1.add(ordersItems1);
//		
//		
//		// 주문 아이템 생성
//		Orders newOrders = Orders.builder()
//				.ordersTotprice(20000)
//				.ordersFinalprice(10000)
//				.ordersTotqty(1)
//				.ordersAddress("회원 주소 배송지")
//				.ordersStatus("배송전")
//				.ordersItemsList(ordersItemsList1)
//				.customer(Customer.builder().customerNo(customerNo).build())
//				.customerCoupons(CustomerCoupons.builder()
//						.customerCouponsNo(1)
//						.coupon(Coupon.builder().couponName("사용한 쿠폰 이름").build())
//						.build())
//				.build();
//		
//		// 바로 주문
//		int rowCount = ordersService.insertOrders(newOrders);
//		System.out.println(rowCount);
		
		
		
		
		/**************** 카트 주문 등록 *******************/
//		
//		// 기타 정보 지정
//		int customerNo = 1;
//		int productNo1 = 1;
//		int productNo2 = 2;
//		
//		// 주문 아이템 사진 리스트 생성
//		List<ProductImage> productImageList1 = new ArrayList<>();
//		productImageList1.add(ProductImage.builder()
//				.productImageFile("image1")
//				.build());
//		List<ProductImage> productImageList2 = new ArrayList<>();
//		productImageList2.add(ProductImage.builder()
//				.productImageFile("image2")
//				.build());
//		
//		// 주문 아이템 리스트 생성
//		List<OrdersItems> ordersItemsList1 = new ArrayList<>();
//		OrdersItems ordersItems1 = OrdersItems.builder()
//				.ordersItemsPrice(20000)
//				.ordersItemsFinalprice(10000)
//				.ordersItemsQty(1)
//				.ordersItemsOptions("List of descriptions")
//				.product(Product.builder()
//						.productNo(productNo1)
//						.productName("아이폰14")
//						.productImageList(productImageList1)
//						.build())
//				.build();
//		OrdersItems ordersItems2 = OrdersItems.builder()
//				.ordersItemsPrice(30000)
//				.ordersItemsFinalprice(15000)
//				.ordersItemsQty(1)
//				.ordersItemsOptions("List of descriptions2")
//				.product(Product.builder()
//						.productNo(productNo2)
//						.productName("아이폰15")
//						.productImageList(productImageList2)
//						.build())
//				.build();
//		ordersItemsList1.add(ordersItems1);
//		ordersItemsList1.add(ordersItems2);
//		
//
//		
//		// 주문 아이템 생성
//		Orders newOrdersCart = Orders.builder()
//				.ordersTotprice(50000)
//				.ordersFinalprice(25000)
//				.ordersTotqty(2)
//				.ordersAddress("회원 주소 배송지")
//				.ordersStatus("배송전")
//				.ordersItemsList(ordersItemsList1)
//				.customer(Customer.builder().customerNo(customerNo).build())
//				.customerCoupons(CustomerCoupons.builder()
//						.customerCouponsNo(1)
//						.coupon(Coupon.builder().couponName("사용한 쿠폰 이름").build())
//						.build())
//				.build();
//		
//		// 바로 주문
//		int rowCount = ordersService.insertOrdersCart(newOrdersCart);
//		System.out.println(rowCount);
		
		
		
		
		
		/**************** 배송 상태 변경 *****************/
		// 주문 번호 및 배송 상태 지정
//		String ordersStatus = "배송중";
//		int ordersNo = 15;
//		
//		int rowCount = ordersService.updateOrdersStatus(ordersStatus, ordersNo);
//		System.out.println(rowCount);
		
		
		
		
		
		/**************** 구매 확정 (회원) *****************/
		// 주문 번호 지정
//		int ordersNo = 11;
//		
//		int rowCount = ordersService.updateOrdersConfirm(ordersNo);
//		System.out.println(rowCount);
		


		
		/************** 주문 번호로 주문 + 주문 아이템 리스트 반환 *************/
		// 주문 번호 지정
//		int ordersNo = 15;
//		
//		List<Orders> ordersList = ordersService.findByOrdersNo(ordersNo);
//		
//		for (Orders orders : ordersList) {
//			System.out.println("주문");
//			System.out.println("ordersNo="+orders.getOrdersNo());
//			System.out.println("ordersArrivaldate="+orders.getOrdersArrivaldate());
//			System.out.println("ordersTotprice="+orders.getOrdersTotprice());
//			System.out.println("ordersFinalprice="+orders.getOrdersFinalprice());
//			System.out.println("ordersTotqty="+orders.getOrdersTotqty());
//			System.out.println("ordersAddress="+orders.getOrdersAddress());
//			System.out.println("ordersStatus="+orders.getOrdersStatus());
//			for (OrdersItems ordersItems : orders.getOrdersItemsList()) {
//				System.out.println("주문 아이템");
//				System.out.println("ordersItemsNo="+ordersItems.getOrdersItemsNo());
//				System.out.println("ordersItemsPrice="+ordersItems.getOrdersItemsPrice());
//				System.out.println("ordersItemsFinalprice="+ordersItems.getOrdersItemsFinalprice());
//				System.out.println("ordersItemsQty="+ordersItems.getOrdersItemsQty());
//				System.out.println("ordersItemsOptions="+ordersItems.getOrdersItemsOptions());
//			}
//		}
		
		
		
		
		/************** 회원 번호로 주문 + 주문 아이템 리스트 반환 *************/
//		int customerNo = 1;
//		
//		List<Orders> ordersList = ordersService.findByCustomerNo(customerNo);
//		for (Orders orders : ordersList) {
//			System.out.println("주문");
//			System.out.println("ordersNo="+orders.getOrdersNo());
//			System.out.println("ordersArrivaldate="+orders.getOrdersArrivaldate());
//			System.out.println("ordersTotprice="+orders.getOrdersTotprice());
//			System.out.println("ordersFinalprice="+orders.getOrdersFinalprice());
//			System.out.println("ordersTotqty="+orders.getOrdersTotqty());
//			System.out.println("ordersAddress="+orders.getOrdersAddress());
//			System.out.println("ordersStatus="+orders.getOrdersStatus());
//			for (OrdersItems ordersItems : orders.getOrdersItemsList()) {
//				System.out.println("주문 아이템");
//				System.out.println("ordersItemsNo="+ordersItems.getOrdersItemsNo());
//				System.out.println("ordersItemsPrice="+ordersItems.getOrdersItemsPrice());
//				System.out.println("ordersItemsFinalprice="+ordersItems.getOrdersItemsFinalprice());
//				System.out.println("ordersItemsQty="+ordersItems.getOrdersItemsQty());
//				System.out.println("ordersItemsOptions="+ordersItems.getOrdersItemsOptions());
//			}
//			System.out.println("**************************");
//		}
		
		
		
		
		
		/********* 주문 번호로 주문 삭제 ************/
		// 주문 번호 지정
//		int ordersNo = 90;
//		
//		int rowCount = ordersService.deleteByOrdersNo(ordersNo);
//		System.out.println(rowCount);

		
		
		
		/************** 주문 취소 *******************/
		// 주문 번호 지정
//		int ordersNo = 2;
//		
//		int rowCount = ordersService.cancelOrdersByOrdersNo(ordersNo);
//		System.out.println(rowCount);
		
		
		
		
		
		
		
	}

}
