package com.itwill.shop.customer;

import java.util.Date;
import java.util.List;

import com.itwill.shop.coupon.Coupon;

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
		}
		
		/********** CustomerCoupon 사용자가 보유한 쿠폰 리스트 조회(Select) 매개변수 : customerNo(사용자 번호)*********/
		
		/********** CustomerCoupon 쿠폰 업데이트(Update) *********/
		//System.out.println(customerService.updateCoupon(6));
		
		/********** CustomerCoupon 쿠폰 발급(Insert) *********/
//		customerService.insertCustomerCoupon(CustomerCoupons.builder()
//				.customerCouponsStatus("사용가능")
//				.customerCouponsNo(1)
//				.couponNo(new Coupon().builder()
//						.couponNo(5)
//						.build())
//				.customerNo(new Customer().builder()
//						.customerNo(5)
//						.build())
//				.build());
	}

}
