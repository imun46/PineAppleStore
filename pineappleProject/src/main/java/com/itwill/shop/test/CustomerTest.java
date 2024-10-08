package com.itwill.shop.test;

import com.itwill.shop.coupon.Coupon;
import com.itwill.shop.customer.Customer;
import com.itwill.shop.customer.CustomerCoupons;
import com.itwill.shop.customer.CustomerService;

public class CustomerTest {

	public static void main(String[] args) throws Exception {
		CustomerService customerService = new CustomerService();
		//System.out.println(customerService.findCoupon(1));
		
//		Coupon coupon = Coupon.builder()
//				.couponNo(1)
//				.couponName("30% 할인쿠폰")
//				.couponId("A123456")
//				.couponDiscount("30")
//				.couponDesc("전자제품 전 품목 30% 할인 쿠폰입니다")
//				.build();
//		System.out.println("coupon.getCouponNo() : " + coupon.getCouponNo());
		
		/********** 일련번호 입력 시 CustomerCoupon 쿠폰 발급(Insert) *********/
		customerService.insertCustomerCouponById("A123456", 
				CustomerCoupons.builder()
								.customer(new Customer().builder()
									.customerNo(2)
									.build())
								.build());
		String customerId = "IDEX1";
		System.out.println(customerService.findCustomerNo(11));
		
		
		/****************************CustomerCoupon**********************************/
		
		/********** CustomerCoupon 사용자가 보유한 쿠폰 리스트 조회(Select) 매개변수 : customerNo(사용자 번호)*********/
//		List<CustomerCoupons> customerCouponsList = customerService.findCouponList(4);
//		System.out.println("customerCouponsList : " + customerCouponsList);
//		for (CustomerCoupons customerCoupons : customerCouponsList) {
//			System.out.println("쿠폰 이름 : " + customerCoupons.getCoupon().getCouponName());
//			System.out.println("쿠폰 내용 : " + customerCoupons.getCoupon().getCouponDesc());
//			System.out.println("쿠폰 상태 : " + customerCoupons.getCustomerCouponsStatus());
//			System.out.println("쿠폰 종료 날짜 : " + customerCoupons.getCustomerCouponsEnddate());
//			System.out.println("customerCoupons.getCoupon().getCouponNo() : " + customerCoupons.getCoupon().getCouponNo());
//			System.out.println("customerCoupons.getCoupon().getCouponId() : " + customerCoupons.getCoupon().getCouponId());
//			System.out.println("customerCoupons.getCoupon().getCouponDiscount() : " + customerCoupons.getCoupon().getCouponDiscount());
////			CustomerNo(사용자 번호)로 찾는데 이걸 여기 담을 이유는 없어 보임
////			System.out.println("customerCoupons.getCustomer().getCustomerNo() : " + customerCoupons.getCustomer().getCustomerNo());  
//			System.out.println("customerCoupons.getCustomerCouponsNo() : " + customerCoupons.getCustomerCouponsNo());
//		}
//		
//		CustomerCoupons customerCoupons = customerService.findCoupon(1);
//		
//		/********** CustomerCoupon 사용자가 보유한 쿠폰 조회(Select) 매개변수 : customerCouponNo(사용자 번호)*********/
//		System.out.println(customerCoupons);
//		System.out.println("쿠폰 이름 : " + customerCoupons.getCoupon().getCouponName());
//		System.out.println("쿠폰 내용 : " + customerCoupons.getCoupon().getCouponDesc());
//		System.out.println("쿠폰 상태 : " + customerCoupons.getCustomerCouponsStatus());
//		System.out.println("쿠폰 종료 날짜 : " + customerCoupons.getCustomerCouponsEnddate());
//		
//		/********** CustomerCoupon 쿠폰 업데이트(Update) 매개변수 : customer_coupons_no *********/
//		System.out.println(customerService.updateCoupon(3));
		
		
	}

}
