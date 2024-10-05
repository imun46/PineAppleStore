package com.itwill.shop.coupon;

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


}
