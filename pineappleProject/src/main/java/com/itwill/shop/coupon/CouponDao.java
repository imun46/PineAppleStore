package com.itwill.shop.coupon;


public interface CouponDao {
	
	//쿠폰 정보 추가(어드민용 쿠폰 발급)
	int insert(Coupon coupon) throws Exception;
	
	//쿠폰 사용 여부(쿠폰 사용시 사용불가 혹은 완료 상태로 변경)
	int update(Coupon coupon) throws Exception;
	
	//쿠폰 삭제(보류)
	int delete(Integer couponNo) throws Exception;
	
	//쿠폰 조회(사용자 번호로 쿠폰 번호 조회)
	Coupon selectCoupon(Integer customerNo) throws Exception;
	
}