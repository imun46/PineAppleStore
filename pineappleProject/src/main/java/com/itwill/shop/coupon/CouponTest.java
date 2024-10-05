package com.itwill.shop.coupon;

public class CouponTest {

	public static void main(String[] args) throws Exception {
		CouponService couponService = new CouponService();
		
		/********** (어드민) 쿠폰 추가(insert) **********/
		couponService.insertCoupon(Coupon.builder()
				.couponName("1% 할인쿠폰")
				.couponId("A11111")
				.couponDiscount("1")
				.couponDesc("전자제품 전 품목 1% 할인 쿠폰입니다")
				.build());
	}

}
