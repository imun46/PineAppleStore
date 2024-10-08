package com.itwill.shop.mapper;

import java.util.List;

import com.itwill.shop.coupon.Coupon;
import com.itwill.shop.customer.Customer;
import com.itwill.shop.customer.CustomerCoupons;

public interface CustomerCouponsMapper {
		
		/***** (어드민) 사용자 쿠폰 발급 *****/
		int insertCustomerCoupon(CustomerCoupons customerCoupons) throws Exception;
	
		/***** 일련번호 입력 시 쿠폰 존재 체크 *****/
		int countByCouponId(String couponId) throws Exception;
		
		/***** 일련번호 입력 시 CustomerCoupon 쿠폰발급(Insert) *****/
		int insertCustomerCouponById(CustomerCoupons customerCoupons) throws Exception;
		
		/********** 일련번호 입력 시 쿠폰 정보 가져옴 **********/
		Coupon getCouponId(String couponId) throws Exception;
		
		/***** 쿠폰 사용완료 업데이트 *****/
		int updateCoupon(Integer customerCouponsNo) throws Exception;
		
		/***** 쿠폰 개수 가져오기 *****/
		int getCouponCount(Integer customerNo) throws Exception;
		
		/***** 사용자 쿠폰 찾기 *****/
		CustomerCoupons findCoupon(Integer customerCouponsNo) throws Exception;
		
		/***** 사용자 쿠폰 리스트 조회 *****/
		List<CustomerCoupons> findCouponList(Integer customerNo) throws Exception;
		
		/*****사용자 번호로 CustomerCoupons 객체 반환 *****/
		CustomerCoupons findCustomerCouponsByNo(Integer customerNo) throws Exception;
}
