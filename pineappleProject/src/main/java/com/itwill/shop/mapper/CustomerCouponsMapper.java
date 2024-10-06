package com.itwill.shop.mapper;

import java.util.List;

import com.itwill.shop.coupon.Coupon;
import com.itwill.shop.customer.Customer;
import com.itwill.shop.customer.CustomerCoupons;

public interface CustomerCouponsMapper {
		
		/***** (어드민) 사용자 쿠폰 발급 *****/
		int insertCustomerCoupon(CustomerCoupons customerCoupons) throws Exception;
	
		/***** 쿠폰 사용완료 업데이트 *****/
		int updateCoupon(Integer customerCouponsNo) throws Exception;
		
		/***** 사용자 쿠폰 조회 *****/
		List<CustomerCoupons> findCouponList(Integer customerNo) throws Exception;
		
}
