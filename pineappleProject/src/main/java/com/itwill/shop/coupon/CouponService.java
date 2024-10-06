package com.itwill.shop.coupon;

import java.util.List;

public class CouponService {
	private CouponDao couponDao;
	
	public CouponService() throws Exception {
		this.couponDao = new CouponDaoImpl();
	}
	
	public int insertCoupon(Coupon coupon) throws Exception {
		return couponDao.insertCoupon(coupon);
	}
	
	public Coupon findAdminCoupon(Integer couponNo) throws Exception {
		return couponDao.findAdminCoupon(couponNo);
	}
	
	public List<Coupon> findAdminCouponList() throws Exception {
		return couponDao.findAdminCouponList();
	}
}
