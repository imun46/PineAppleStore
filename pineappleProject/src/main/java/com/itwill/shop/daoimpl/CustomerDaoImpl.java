package com.itwill.shop.daoimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.dao.CustomerDao;
import com.itwill.shop.domain.Customer;
import com.itwill.shop.mapper.CartMapper;
import com.itwill.shop.mapper.CustomerMapper;

public class CustomerDaoImpl implements CustomerDao {
	
	private SqlSessionFactory sqlSessionFactory;
	
	public CustomerDaoImpl() throws Exception {
		this.sqlSessionFactory=new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config-mapper-interface.xml"));
	}
	
	// 회원 등록
	@Override
	public int insertCustomer(Customer customer) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		int rowCount = customerMapper.insertCustomer(customer);
		sqlSession.close();
		return rowCount;
	}
	
	// 회원 아이디 중복 체크
	@Override
	public int countCustomerId(String customerId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		int rowCount = customerMapper.countCustomerId(customerId);
		sqlSession.close();
		return rowCount;
	}
	
	// 회원 닉네임 중복 체크
	@Override
	public int countCustomerNickName(String customerNickname) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		int rowCount = customerMapper.countCustomerNickname(customerNickname);
		sqlSession.close();
		return rowCount;
	}
	
	// 회원 핸드폰 번호 중복 체크
	@Override
	public int countCustomerPhone(String customerPhone) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		int rowCount = customerMapper.countCustomerPhone(customerPhone);
		sqlSession.close();
		return rowCount;
	}
	
	// 회원 아이디/비밀번호 일치 여부 체크 후 회원 번호 반환 (실패 시 NULL 반환)
	@Override
	public Integer getCustomerNoIfValidLogin(Map<String, Object> paramMap) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		Integer customerNo = customerMapper.getCustomerNoIfValidLogin(paramMap);
		return customerNo;
	}
	
	// 회원 아이디로 회원 정보 반환
	@Override
	public Customer findCustomerById(String customerId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		Customer customer = customerMapper.findCustomerById(customerId);
		sqlSession.close();
		return customer;
	}
	
	// 회원 번호로 회원 정보 반환
	@Override
	public Customer findCustomerByNo(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		Customer customer = customerMapper.findCustomerByNo(customerNo);
		sqlSession.close();
		return customer;
	}
	
	// 회원 정보 수정
	@Override
	public int updateCustomer(Customer customer) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		int rowCount = customerMapper.updateCustomer(customer);
		return rowCount;
	}
	
	// 회원 삭제
	@Override
	public int deleteCustomer(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		int rowCount = customerMapper.deleteCustomer(customerNo);
		return rowCount;
	}
	
	// 전체 회원 리스트 반환 (어드민)
	@Override
	public List<Customer> customerList() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		List<Customer> customerList = customerMapper.customerList();
		sqlSession.close();
		return customerList;
	}

}
