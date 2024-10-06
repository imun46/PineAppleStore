package com.itwill.pineappleTest;

import java.util.Date;
import java.util.List;

import com.itwill.shop.coupon.Coupon;
import com.itwill.shop.customer.Customer;
import com.itwill.shop.customer.CustomerCoupons;
import com.itwill.shop.customer.CustomerService;
import com.itwill.shop.orders.Orders;
import com.itwill.shop.review.Review;

public class CustomerTest {

	public static void main(String[] args) throws Exception {
		CustomerService customerService = new CustomerService();
		
//		/*********** insert ********************/
//	System.out.println(customerService.create(Customer.builder()
//				.customerName("이민용")
//				.customerAddress("주소입니다")
//				.customerDob(new Date())
//				.customerEmail("alsdyd0506@naver.com")
//				.customerId("lee44")
//				.customerGender("M")
//				.customerPassword("123123")
//				.customerPhone("010-4141-2323")
//				.customerNickname("야오밍2")
//				.build()));
//		/*********** update ********************/
//		System.out.println(customerService.updateCustomerId(Customer.builder()
//				.customerPassword("123123")
//				.customerAddress("1주소입니다2")
//				.customerGender("F")
//				.customerPhone("010-4141-23232")
//				.customerEmail("alsdyd0@naver.com")
//				.customerNickname("야오밍2")
//				.customerNo(18)
//				.build()));
//		
//		/*********** select ********************/
//		System.out.println(customerService.findCustomerNo(2));
		
//		/*********** select all *******************/
		Customer customer = customerService.findCustomerNoListAll(2);
		System.out.println(customer.getCustomerNo());
		System.out.println(customer.getCustomerId());
		System.out.println(customer.getCustomerPassword());
		System.out.println(customer.getCustomerEmail());
		System.out.println(customer.getCustomerAddress());
		System.out.println(customer.getCustomerGender());
		System.out.println(customer.getCustomerNickname());
		System.out.println(customer.getCustomerPhone());
		System.out.println(customer.getCustomerDob());
		System.out.println(customer.getCustomerName());
		System.out.println(customer.getCustomerJoindate());
		
		List<CustomerCoupons> customerCouponList = customer.getCustomerCouponList();
		if (customerCouponList != null) {
		    for (CustomerCoupons customerCoupons : customerCouponList) {
		        System.out.println("/****************쿠폰 번호*************************/");
		        System.out.println(customerCoupons.getCustomerCouponsNo());
		        System.out.println(customerCoupons.getCustomerCouponsStatus());
		        System.out.println(customerCoupons.getCustomerCouponsEnddate());
		        System.out.println("/****************쿠폰 정보*************************/");
		        System.out.println(customerCoupons.getCoupon().getCouponId());
		        System.out.println(customerCoupons.getCoupon().getCouponDiscount());
		        System.out.println(customerCoupons.getCoupon().getCouponName());
		        System.out.println(customerCoupons.getCoupon().getCouponDesc());
		    }
		}

		List<Review> customerReviewList = customer.getReviewList();
		if (customerReviewList != null) {
		    for (Review reviewList : customerReviewList) {
		        System.out.println("**************** 고객 리뷰 정보*********************");
		        System.out.println(reviewList.getReviewNo());
		        System.out.println(reviewList.getReviewTitle());
		        System.out.println(reviewList.getReviewContent());
		        System.out.println(reviewList.getReviewImage());
		        System.out.println(reviewList.getReviewRating());
		    }
		}
		
		
		List<Orders> customerOrderList = customer.getOrdersList();
		
		if(customerOrderList != null) {
			for (Orders orderList : customerOrderList) {
				System.out.println("************** 오더 정보 *******************");
				System.out.println(orderList.getOrdersNo());
				System.out.println(orderList.getOrdersStatus());
				System.out.println(orderList.getOrdersTotprice());
				System.out.println(orderList.getOrdersTotqty());
				System.out.println(orderList.getOrdersArrivaldate());
				System.out.println(orderList.getOrdersDate());
				System.out.println(orderList.getOrdersFinalprice());
				
			
				
				
			}
			
			
			
			
			
		}
		System.out.println("오더 리스트 크기: " + customer.getOrdersList().size());
		System.out.println("쿠폰 리스트 크기: " + customer.getCustomerCouponList().size());
		System.out.println("리뷰 리스트 크기: " + customer.getReviewList().size());
		
		
		
		
		
		
		
		
////	
//		
//		/*********** delete ********************/
//		System.out.println(customerService.deleteCustomerNo(2));
		
		
		
		
		
		
		
		
		
		
		/****************************CustomerCoupon**********************************/
		
		/********** CustomerCoupon 사용자가 보유한 쿠폰 리스트 조회(Select) 매개변수 : customerNo(사용자 번호)*********/
		List<CustomerCoupons> customerCouponsList = customerService.findCouponList(4);
		System.out.println("customerCouponsList : " + customerCouponsList);
		for (CustomerCoupons customerCoupons : customerCouponsList) {
			System.out.println("쿠폰 이름 : " + customerCoupons.getCoupon().getCouponName());
			System.out.println("쿠폰 내용 : " + customerCoupons.getCoupon().getCouponDesc());
			System.out.println("쿠폰 상태 : " + customerCoupons.getCustomerCouponsStatus());
			System.out.println("쿠폰 종료 날짜 : " + customerCoupons.getCustomerCouponsEnddate());
			System.out.println("customerCoupons.getCoupon().getCouponNo() : " + customerCoupons.getCoupon().getCouponNo());
			System.out.println("customerCoupons.getCoupon().getCouponId() : " + customerCoupons.getCoupon().getCouponId());
			System.out.println("customerCoupons.getCoupon().getCouponDiscount() : " + customerCoupons.getCoupon().getCouponDiscount());
//			CustomerNo(사용자 번호)로 찾는데 이걸 여기 담을 이유는 없어 보임
//			System.out.println("customerCoupons.getCustomer().getCustomerNo() : " + customerCoupons.getCustomer().getCustomerNo());  
			System.out.println("customerCoupons.getCustomerCouponsNo() : " + customerCoupons.getCustomerCouponsNo());
		}
		
		CustomerCoupons customerCoupons = customerService.findCoupon(1);
		
		/********** CustomerCoupon 사용자가 보유한 쿠폰 조회(Select) 매개변수 : customerCouponNo(사용자 번호)*********/
//		System.out.println(customerCoupons);
//		System.out.println("쿠폰 이름 : " + customerCoupons.getCoupon().getCouponName());
//		System.out.println("쿠폰 내용 : " + customerCoupons.getCoupon().getCouponDesc());
//		System.out.println("쿠폰 상태 : " + customerCoupons.getCustomerCouponsStatus());
//		System.out.println("쿠폰 종료 날짜 : " + customerCoupons.getCustomerCouponsEnddate());
		
		/********** CustomerCoupon 쿠폰 업데이트(Update) 매개변수 : customer_coupons_no *********/
//		System.out.println(customerService.updateCoupon(3));
		
		/********** CustomerCoupon 쿠폰 발급(Insert) *********/
//		customerService.insertCustomerCoupon(CustomerCoupons.builder()
//				.customerCouponsStatus("사용가능")
//				.customerCouponsNo(1)
//				.coupon(new Coupon().builder()
//						.couponNo(4)
//						.build())
//				.customer(new Customer().builder()
//						.customerNo(3)
//						.build())
//				.build());
		
		/********** 일련번호 입력 시 CustomerCoupon 쿠폰 발급(Insert) *********/
		customerService.insertCustomerCouponById("1123456", 
				CustomerCoupons.builder()
								.coupon(new Coupon().builder()
									.couponNo(1)
									.build())
								.customer(new Customer().builder()
									.customerNo(1)
									.build())
								.build());
	}
	
	

}
