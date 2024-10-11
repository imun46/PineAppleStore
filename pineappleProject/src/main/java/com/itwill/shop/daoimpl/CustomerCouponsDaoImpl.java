package com.itwill.shop.daoimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.dao.CustomerCouponsDao;
import com.itwill.shop.domain.CustomerCoupons;
import com.itwill.shop.mapper.CustomerCouponsMapper;

public class CustomerCouponsDaoImpl implements CustomerCouponsDao {
	
	private SqlSessionFactory sqlSessionFactory;
	
	public CustomerCouponsDaoImpl() throws Exception{
		this.sqlSessionFactory=new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config-mapper-interface.xml"));
	}
	
	// 회원 쿠폰 발급
	@Override
	public int insertCustomerCoupons(Map<String, Integer> paramMap) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerCouponsMapper customerCouponsMapper = sqlSession.getMapper(CustomerCouponsMapper.class);
		int rowCount = customerCouponsMapper.insertCustomerCoupons(paramMap);
		sqlSession.close();
		return rowCount; 
	}
	
	// 일련 번호 입력 시 쿠폰 번호 반환
	@Override
	public int findCouponNoByCouponId(String couponId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerCouponsMapper customerCouponsMapper = sqlSession.getMapper(CustomerCouponsMapper.class);
		int couponNo = customerCouponsMapper.findCouponNoByCouponId(couponId);
		sqlSession.close();
		return couponNo; 
	}
	
	// 회원 쿠폰 사용 시 상태 '사용완료'로 수정
	@Override
	public int updateCouponStatusUsed(Integer customerCouponsNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerCouponsMapper customerCouponsMapper = sqlSession.getMapper(CustomerCouponsMapper.class);
		int rowCount = customerCouponsMapper.updateCouponStatusUsed(customerCouponsNo);
		sqlSession.close();
		return rowCount; 
	}
	
	// 유효기간 지난 회원 쿠폰 상태 수정 ('사용불가') 
	@Override
	public int updateCouponStatusExpired() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerCouponsMapper customerCouponsMapper = sqlSession.getMapper(CustomerCouponsMapper.class);
		int rowCount = customerCouponsMapper.updateCouponStatusExpired();
		sqlSession.close();
		return rowCount; 
	}
	
	// 회원 번호로 회원 쿠폰 리스트 반환 (사용가능, 사용불가, 사용완료)
	@Override
	public List<CustomerCoupons> findCustomerCouponsListALL(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerCouponsMapper customerCouponsMapper = sqlSession.getMapper(CustomerCouponsMapper.class);
		List<CustomerCoupons> customerCouponsList = customerCouponsMapper.findCustomerCouponsListALL(customerNo);
		sqlSession.close();
		return customerCouponsList; 
	}
	
	// 회원 번호로 회원 쿠폰 리스트 반환 (사용가능)
	@Override
	public List<CustomerCoupons> findCustomerCouponsListUsable(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerCouponsMapper customerCouponsMapper = sqlSession.getMapper(CustomerCouponsMapper.class);
		List<CustomerCoupons> customerCouponsList = customerCouponsMapper.findCustomerCouponsListUsable(customerNo);
		sqlSession.close();
		return customerCouponsList; 
	}
	
	// 회원 번호로 회원 쿠폰 리스트 반환 (사용완료)
	@Override
	public List<CustomerCoupons> findCustomerCouponsListUsed(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerCouponsMapper customerCouponsMapper = sqlSession.getMapper(CustomerCouponsMapper.class);
		List<CustomerCoupons> customerCouponsList = customerCouponsMapper.findCustomerCouponsListUsed(customerNo);
		sqlSession.close();
		return customerCouponsList;
	}

	// 회원 번호로 회원 쿠폰 리스트 반환 (사용불가)
	@Override
	public List<CustomerCoupons> findCustomerCouponsListExpired(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerCouponsMapper customerCouponsMapper = sqlSession.getMapper(CustomerCouponsMapper.class);
		List<CustomerCoupons> customerCouponsList = customerCouponsMapper.findCustomerCouponsListExpired(customerNo);
		sqlSession.close();
		return customerCouponsList;
	}
	
	// 회원 쿠폰 번호로 회원 쿠폰 정보 반환
	@Override
	public CustomerCoupons findCustomerCouponsDetailByNo(Integer customerCouponsNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerCouponsMapper customerCouponsMapper = sqlSession.getMapper(CustomerCouponsMapper.class);
		CustomerCoupons customerCoupons = customerCouponsMapper.findCustomerCouponsDetailByNo(customerCouponsNo);
		sqlSession.close();
		return customerCoupons;
	}

	// 사용 가능한 회원 쿠폰 개수 반환
	@Override
	public int findUsableCustomerCouponsQty(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerCouponsMapper customerCouponsMapper = sqlSession.getMapper(CustomerCouponsMapper.class);
		int usableCustomerCouponsQty = customerCouponsMapper.findUsableCustomerCouponsQty(customerNo);
		sqlSession.close();
		return usableCustomerCouponsQty;
	}
	
	// 쿠폰 일련 번호 존재 여부 체크
	@Override
	public int checkCouponIdIfExistByCouponId(String couponId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerCouponsMapper customerCouponsMapper = sqlSession.getMapper(CustomerCouponsMapper.class);
		int rowCount = customerCouponsMapper.checkCouponIdIfExistByCouponId(couponId);
		sqlSession.close();
		return rowCount;
	}

	// 쿠폰 일련 번호 사용 여부 체크
	@Override
	public int checkCouponIdIfUsedByCouponId(Map<String, Object> paramMap) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerCouponsMapper customerCouponsMapper = sqlSession.getMapper(CustomerCouponsMapper.class);
		int rowCount = customerCouponsMapper.checkCouponIdIfUsedByCouponId(paramMap);
		sqlSession.close();
		return rowCount;
	}

}
