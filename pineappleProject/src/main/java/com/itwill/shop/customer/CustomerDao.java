package com.itwill.shop.customer;

public interface CustomerDao {
	
	//사용자 정보 추가(회원 가입)
	int insert(Customer customer) throws Exception;
	
	//사용자 정보 수정(회원 정보 수정)
	int update(Customer customer) throws Exception;
	
	//사용자 정보 삭제(회원 탈퇴)
	int delete(Integer customerNo) throws Exception;
	
	//사용자 정보 조회(내 정보)
	Customer findCustomer(String customerId) throws Exception;
	
	//사용자 아이디 개수 출력(아이디 중복 유효성 체크)
	int countByCustomerId(String customerId) throws Exception;
	
}
