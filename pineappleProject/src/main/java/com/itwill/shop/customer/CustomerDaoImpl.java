package com.itwill.shop.customer;


	
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.coupon.Coupon;
import com.itwill.shop.mapper.CustomerCouponsMapper;
import com.itwill.shop.mapper.CustomerMapper;

public class CustomerDaoImpl implements CustomerDao {
		private  SqlSessionFactory sqlSessionFactory;
		
		
		public CustomerDaoImpl()throws Exception{
		this.sqlSessionFactory = 
				new  SqlSessionFactoryBuilder().
				build(Resources.getResourceAsStream("mybatis-config-mapper-interface.xml"));
			
		}
		
		
	@Override
	public int insert(Customer customer) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int insertCount = sqlSession.getMapper(CustomerMapper.class).insertCustomer(customer);
		sqlSession.close();
		return insertCount;
	}

	@Override
	public int update(Customer customer) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int updateCount = sqlSession.getMapper(CustomerMapper.class).updateCustomer(customer);
		sqlSession.close();
		return updateCount;
	}

	@Override
	public int delete(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int deleteCount = sqlSession.getMapper(CustomerMapper.class).deleteCustomer(customerNo);
		sqlSession.commit();
		sqlSession.close();
		return deleteCount;
	}
	
	@Override
	public Customer findCustomerNo(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Customer customer =sqlSession.getMapper(CustomerMapper.class).findCustomerNo(customerNo);
		sqlSession.close();
		return customer;
	}
	
	

	@Override
	public Customer findCustomerId(String customerId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Customer customer =sqlSession.getMapper(CustomerMapper.class).findCustomerId(customerId);
		sqlSession.close();
		return customer;
	}
	
	@Override
	public Customer findCustomerNoListAll(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Customer customer  = sqlSession.getMapper(CustomerMapper.class).findCustomerNoListAll(customerNo);
		return customer;
	}

	@Override
	public int countByCustomerId(String customerId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int countByCustomerId = sqlSession.getMapper(CustomerMapper.class).countByCustomerId(customerId);
		sqlSession.close();
		return countByCustomerId ;
	}
	
	@Override
	public List<Customer> customerList() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Customer> customerList = sqlSession.getMapper(CustomerMapper.class).customerList();
		sqlSession.close();
		return customerList;
	}
	
	
	
	/********* CustomerCoupon 메소드 **********/
	
	/********* (어드민) CustomerCoupon 쿠폰발급(Insert) **********/
	@Override
	public int insertCustomerCoupon(CustomerCoupons customerCoupons) throws Exception {
		System.out.println("CustomerDaoImpl : insertCustomerCoupon");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(CustomerCouponsMapper.class).insertCustomerCoupon(customerCoupons);
		sqlSession.close();
		return rowCount;
	}
	
	/***** 일련번호 입력 시 쿠폰 존재 체크 *****/
	@Override
	public int countByCouponId(String couponId) throws Exception {
		System.out.println("CustomerDaoImpl : countByCouponId");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int countByCouponId = sqlSession.getMapper(CustomerCouponsMapper.class).countByCouponId(couponId);
		sqlSession.close();
		return countByCouponId;
	}
	
	/********** 일련번호 입력 시 쿠폰 정보 가져옴 **********/
	@Override
	public Coupon getCouponId(String couponId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Coupon getCouponId = sqlSession.getMapper(CustomerCouponsMapper.class).getCouponId(couponId);
		sqlSession.close();
		return getCouponId;
	}
	
	/********* 일련번호 입력 시 CustomerCoupon 쿠폰발급(Insert) **********/
	@Override
	public int insertCustomerCouponById(CustomerCoupons customerCoupons) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(CustomerCouponsMapper.class).insertCustomerCouponById(customerCoupons);
		return rowCount;
	}
	
	/********* CustomerCoupon 쿠폰조회(Select) **********/
	@Override
	public CustomerCoupons findCoupon(Integer customerCouponsNo) throws Exception {
		System.out.println("CustomerDaoImpl : findCoupon");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerCoupons customerCoupons = sqlSession.getMapper(CustomerCouponsMapper.class).findCoupon(customerCouponsNo);
		sqlSession.close();
		return customerCoupons;
	}
	
	/********** CustomerCoupon 쿠폰 리스트 조회(Select) **********/
	@Override
	public List<CustomerCoupons> findCouponList(Integer customerNo) throws Exception {
		System.out.println("CustomerDaoImpl : findCouponList");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<CustomerCoupons> customerCoupons = sqlSession.getMapper(CustomerCouponsMapper.class).findCouponList(customerNo);
		sqlSession.close();
		return customerCoupons;
	}
	
	/********* CustomerCoupon 쿠폰 사용완료(Update) **********/
	@Override
	public int updateCoupon(Integer customerCouponsNo) throws Exception {
		System.out.println("CustomerDaoImpl : updateCoupon");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(CustomerCouponsMapper.class).updateCoupon(customerCouponsNo);
		sqlSession.close();
		return rowCount;
	}
	
	/********** CustomerCoupon 쿠폰 보유 개수 조회(Select) **********/
	@Override
	public int getCouponCount(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int getCount = sqlSession.getMapper(CustomerCouponsMapper.class).getCouponCount(customerNo);
		sqlSession.close();	
		return getCount;
	}
	
	/*****사용자 번호로 CustomerCoupons 객체 반환 *****/
	@Override
	public List<CustomerCoupons> findCustomerCouponsByNo(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<CustomerCoupons> customerCouponsList = sqlSession.getMapper(CustomerCouponsMapper.class).findCustomerCouponsByNo(customerNo);
		return customerCouponsList;
	}
	
	@Override
	public List<Customer> findCustomerCouponsByCustomerNo(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Customer> customer = sqlSession.getMapper(CustomerCouponsMapper.class).findCustomerCouponsByCustomerNo(customerNo);
		return customer;
	}
}
