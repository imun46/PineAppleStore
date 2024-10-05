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
	
					/*** 쿠폰 발급 메소드 (어드민용)***/
	@Override
	public int insert(Coupon coupon) throws Exception {
		System.out.println("CouponDaoImpl : insert 메소드 호출");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return 0;
	}
	
	@Override
	public int update(Coupon coupon) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Integer couponNo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Coupon findCoupon(Integer customerNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
