package com.itwill.shop.mapper;

import com.itwill.shop.coupon.Coupon;
import com.itwill.shop.customer.Customer;

public interface CouponMapper {
	
		//(어드민전용) 쿠폰 추가
		int insert(Coupon coupon) throws Exception;
	
}
