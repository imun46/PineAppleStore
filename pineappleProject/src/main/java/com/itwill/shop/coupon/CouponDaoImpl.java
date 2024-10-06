package com.itwill.shop.coupon;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.CouponMapper;
import com.itwill.shop.mapper.CustomerCouponsMapper;

public class CouponDaoImpl implements CouponDao {
	
	private  SqlSessionFactory sqlSessionFactory;
	
	public CouponDaoImpl() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config-mapper-interface.xml"));
	}
	
	/*** 쿠폰 발급 메소드 (어드민용) ***/
	@Override
	public int insertCoupon(Coupon coupon) throws Exception {
		System.out.println("CouponDaoImpl : insert 메소드 호출");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(CouponMapper.class).insertCoupon(coupon);
		return rowCount;
	}
	
	/*** 쿠폰 조회 메소드 (어드민용) ***/
	@Override
	public Coupon findAdminCoupon(Integer couponNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Coupon coupon = sqlSession.getMapper(CouponMapper.class).findAdminCoupon(couponNo);
		return coupon;
	}
	
	/*** 쿠폰 리스트 조회 메소드 (어드민용) ***/
	@Override
	public List<Coupon> findAdminCouponList() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Coupon> couponList = sqlSession.getMapper(CouponMapper.class).findAdminCouponList();
		return couponList;
	}

}
