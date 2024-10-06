package com.itwill.shop.mapper;

import java.util.List;

import com.itwill.shop.coupon.Coupon;
import com.itwill.shop.customer.Customer;

public interface CouponMapper {
	
	//(어드민전용) 쿠폰 추가
	int insertCoupon(Coupon coupon) throws Exception;
	
	//(어드민전용) 쿠폰 조회
	public Coupon findAdminCoupon(Integer couponNo) throws Exception;
	
	//(어드민전용) 쿠폰 리스트 조회
	public List<Coupon> findAdminCouponList() throws Exception;
}
