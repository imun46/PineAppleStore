package com.itwill.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.itwill.shop.customer.Customer;
import com.itwill.shop.customer.CustomerDao;

public interface CustomerMapper  {
	

	int insertCustomer(Customer customer) throws Exception;

	int countByCustomerId(String customerId) throws Exception;
	 
	int updateCustomer(Customer customer) throws Exception;
	
	int deleteCustomer(Integer customerNo) throws Exception;
	
	Customer findCustomerId(String customerId) throws Exception;
		

	Customer findCustomerNo(Integer customerNo) throws Exception;
	
	List<Customer> customerList() throws Exception;

	
	

}
