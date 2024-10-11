package com.itwill.pineappleTest;

import java.util.List;

import com.itwill.shop.domain.CustomerCoupons;
import com.itwill.shop.service.CustomerCouponsService;

public class CustomerCouponsTest {

	public static void main(String[] args) throws Exception {
		
		CustomerCouponsService customerCouponsService = new CustomerCouponsService();
		
		
		/******************* 회원 쿠폰 발급 ******************/
		// 쿠폰 일련 번호, 회원 번호 지정
//		String couponId 	= "B123456";
//		Integer customerNo 	= 1;
//		
//		// 쿠폰 발급
//		int checkCoupon = customerCouponsService.insertCustomerCoupons(couponId, customerNo);
//		System.out.println("쿠폰 발급 성공 시 1 반환: "+checkCoupon);
		
		
		
		
		
		/******************* 쿠폰 사용 시 상태 변경 **********************/
		// 회원 쿠폰 번호 지정
//		int customerCouponsNo = 7;
//		
//		// 회원 쿠폰 상태 변경
//		int checkChange = customerCouponsService.updateCouponStatusUsed(customerCouponsNo);
//		System.out.println("회원 쿠폰 상태 변경 시 1 반환: "+checkChange);
		
		
		
		
		/***************************** 회원 번호로 회원 리스트 출력 ******************************/
		// 회원 번호 지정
//		int customerNo = 1;
//		
//		// 모든 쿠폰 리스트 출력
//		List<CustomerCoupons> customerCouponsListAll = customerCouponsService.findCustomerCouponsListALL(customerNo);
//		System.out.println("회원 번호: "+customerNo);
//		System.out.println();
//		
//		System.out.println("모든 쿠폰 리스트 출력");
//		for (CustomerCoupons customerCoupons : customerCouponsListAll) {
//			System.out.println(customerCoupons);
//		}
//		
//		// 사용가능 쿠폰 리스트 출력
//		List<CustomerCoupons> customerCouponsListUsable = customerCouponsService.findCustomerCouponsListUsable(customerNo);
//		System.out.println();
//		System.out.println("사용가능 쿠폰 리스트 출력");
//		for (CustomerCoupons customerCoupons : customerCouponsListUsable) {
//			System.out.println(customerCoupons);
//		}
//		// 사용완료 쿠폰 리스트 출력
//		List<CustomerCoupons> customerCouponsListUsed = customerCouponsService.findCustomerCouponsListUsed(customerNo);
//		System.out.println();
//		System.out.println("사용완료 쿠폰 리스트 출력");
//		for (CustomerCoupons customerCoupons : customerCouponsListUsed) {
//			System.out.println(customerCoupons);
//		}
//		
//		// 사용불가 쿠폰 리스트 출력
//		List<CustomerCoupons> customerCouponsListExpired = customerCouponsService.findCustomerCouponsListExpired(customerNo);
//		System.out.println();
//		System.out.println("사용불가 쿠폰 리스트 출력");
//		for (CustomerCoupons customerCoupons : customerCouponsListExpired) {
//			System.out.println(customerCoupons);
//		}
		
		
		
		
		/***********************회원 쿠폰 번호로 쿠폰 정보 출력 ************************/
		// 회원 쿠폰 번호 지정
//		int customerCouponsNo = 1;
//		
//		// 쿠폰 정보 출력
//		CustomerCoupons customerCoupons = customerCouponsService.findCustomerCouponsDetailByNo(customerCouponsNo);
//		System.out.println(customerCoupons);
		
		
		
		
		
		/*************************** 사용 가능한 쿠폰 개수 ****************************/
		// 회원 번호 지정
		int customerNo = 1;
		
		// 사용 가능한 쿠폰 개수 반환
		int usableCoupons = customerCouponsService.findUsableCustomerCouponsQty(customerNo);
		System.out.println("사용 가능한 쿠폰 개수: "+usableCoupons);
		
		
		
		
	}

}
