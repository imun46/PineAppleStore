package com.itwill.shop.customer;

import java.util.List;

import com.itwill.shop.coupon.Coupon;

public interface CustomerDao {
	
	
	//사용자 정보 추가(회원 가입)
	int insert(Customer customer) throws Exception;
	
	//사용자 정보 수정(회원 정보 수정)
	int update(Customer customer) throws Exception;
	
	//사용자 정보 삭제(회원 탈퇴)
	int delete(Integer customerNo) throws Exception;
	
	//사용자 정보 번호로 찾기(내 정보)
	Customer findCustomerNo(Integer customerNo) throws Exception;
	
	//사용자 정보 아이디로 찾기(내 정보)
	Customer findCustomerId(String customerId) throws Exception;
	
	//사용자 아이디 개수 출력(아이디 중복 유효성 체크)
	int countByCustomerId(String customerId) throws Exception;
	
	//(어드민전용) 전체사용자 정보  출력
	List<Customer> customerList () throws Exception;
	
	/*** CustomerCoupon 제어 ***/ 
	//(어드민) 쿠폰 발급
	int insertCustomerCoupon(CustomerCoupons customerCoupons) throws Exception;
	
	//쿠폰 사용완료로 업데이트
	int updateCoupon(Integer customerCouponsNo) throws Exception;
			
	//사용자 쿠폰 조회
	CustomerCoupons findCoupon(Integer customerNo) throws Exception;
	
	

}
