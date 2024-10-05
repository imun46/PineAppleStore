package com.itwill.shop.coupon;

public class CouponService {
	private CouponDao couponDao;
	
	public CouponService() throws Exception {
		this.couponDao = new CouponDaoImpl();
	}
	
	public int insertCoupon(Coupon coupon) throws Exception {
		return couponDao.insertCoupon(coupon);
	}
}
