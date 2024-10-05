package com.itwill.shop.coupon;


public interface CouponDao {
	
	//쿠폰 정보 추가(어드민용 쿠폰 발급)
	int insertCoupon(Coupon coupon) throws Exception;
	
	
	
}