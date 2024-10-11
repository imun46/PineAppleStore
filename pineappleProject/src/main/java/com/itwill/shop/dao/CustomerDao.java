package com.itwill.shop.dao;

import java.util.List;
import java.util.Map;

import com.itwill.shop.domain.Customer;
import com.itwill.shop.domain.CustomerCoupons;

public interface CustomerDao {
	
	
	// 회원 등록
	int insertCustomer(Customer customer) throws Exception;
	
	// 회원 아이디 중복 체크
	int countCustomerId(String customerId) throws Exception;
	
	// 회원 닉네임 중복 체크
	int countCustomerNickName(String customerNickname) throws Exception;
	
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
	List<Customer> customerList () throws Exception;
		
	/********** CustomerCoupon 제어 **********/ 
		
//	/***** (어드민) 사용자 쿠폰 발급 *****/
//	int insertCustomerCoupon(CustomerCoupons customerCoupons) throws Exception;
//
//	/***** 일련번호 입력 시 쿠폰 존재 체크 *****/
//	int countByCouponId(String couponId) throws Exception;
//		
//	/***** 일련번호 입력 시 CustomerCoupon 쿠폰발급(Insert) *****/
//	int insertCustomerCouponById(CustomerCoupons customerCoupons) throws Exception;
//		
//	/********** 일련번호 입력 시 쿠폰 정보 가져옴 **********/
//	Coupon getCouponId(String couponId) throws Exception;
//		
//	/***** 쿠폰 사용완료 업데이트 *****/
//	int updateCoupon(CustomerCoupons customerCoupons) throws Exception;
//		
//	/***** 쿠폰 개수 가져오기 *****/
//	int getCouponCount(Integer customerNo) throws Exception;
//		
//	/***** 사용자 쿠폰 찾기 *****/
//	CustomerCoupons findCoupon(Integer customerCouponsNo) throws Exception;
//		
//	/***** 사용자 쿠폰 리스트 조회 *****/
//	List<CustomerCoupons> findCouponList(Integer customerNo) throws Exception;
//		
//	/***** 입력한 일련번호가 중복인지 체크 *****/
//	int duplicationCouponCheck(CustomerCoupons customerCoupons) throws Exception;
		
		
	}
