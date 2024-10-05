package com.itwill.shop.customer;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Customer customer =sqlSession.getMapper(CustomerMapper.class).findCustomerNo(customerNo);
		sqlSession.close();
		return customer;
	}
	
	

	@Override
	public Customer findCustomerId(String customerId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Customer customer =sqlSession.getMapper(CustomerMapper.class).findCustomerId(customerId);
		sqlSession.close();
		return customer;
	}

	@Override
	public int countByCustomerId(String customerId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int countByCustomerId = sqlSession.getMapper(CustomerMapper.class).countByCustomerId(customerId);
		sqlSession.close();
		return countByCustomerId ;
	}
	
	@Override
	public List<Customer> customerList() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Customer> customerList = sqlSession.getMapper(CustomerMapper.class).customerList();
		sqlSession.close();
	return customerList;
	}


	

}
