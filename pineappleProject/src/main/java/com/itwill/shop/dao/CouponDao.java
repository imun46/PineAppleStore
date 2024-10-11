package com.itwill.shop.dao;

import java.util.List;

import com.itwill.shop.domain.Coupon;

public interface CouponDao {
	
	//쿠폰 정보 추가(어드민용 쿠폰 발급)
	int insertCoupon(Coupon coupon) throws Exception;
	
	//쿠폰 조회(어드민용 쿠폰 조회)
	public Coupon findAdminCoupon(Integer couponNo) throws Exception;
	
	//쿠폰 리스트 조회(어드민용 쿠폰 리스트 조회)
	public List<Coupon> findAdminCouponList() throws Exception;
	
}