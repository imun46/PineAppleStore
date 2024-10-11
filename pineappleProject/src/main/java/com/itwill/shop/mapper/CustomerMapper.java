package com.itwill.shop.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.itwill.shop.domain.Customer;
import com.itwill.shop.dao.CustomerDao;

public interface CustomerMapper  {
	
	// 회원 등록
	int insertCustomer(Customer customer) throws Exception;

	// 회원 아이디 중복 체크
	int countCustomerId(String customerId) throws Exception;
	
	// 회원 닉네임 중복 체크
	int countCustomerNickname(String customerNickname) throws Exception;
	
	// 회원 핸드폰 번호 중복 체크
	int countCustomerPhone(String customerPhone) throws Exception;
	
	// 회원 아이디/비밀번호 일치 여부 체크 후 회원 번호 반환 (실패 시 NULL 반환)
	Integer getCustomerNoIfValidLogin(Map<String, Object> paramMap) throws Exception;
	
	// 회원 아이디로 회원 정보 반환
	Customer findCustomerById(String customerId) throws Exception;
	
	// 회원 번호로 회원 정보 반환
	Customer findCustomerByNo(Integer customerNo) throws Exception;
	
	// 회원 정보 수정
	int updateCustomer(Customer customer) throws Exception;
	
	// 회원 삭제
	int deleteCustomer(Integer customerNo) throws Exception;
	
	// 전체 회원 리스트 반환 (어드민)
	List<Customer> customerList() throws Exception;

	
	

}
