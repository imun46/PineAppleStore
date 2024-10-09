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
		
		//사용자 전체 정보 번호로 찾기(내정보)
		Customer findCustomerNoListAll(Integer customerNo)throws Exception;
		
		//사용자 아이디 개수 출력(아이디 중복 유효성 체크)
		int countByCustomerId(String customerId) throws Exception;
		
		//(어드민전용) 전체사용자 정보  출력
		List<Customer> customerList () throws Exception;
		
		/********** CustomerCoupon 제어 **********/ 
		
		/***** (어드민) 사용자 쿠폰 발급 *****/
		int insertCustomerCoupon(CustomerCoupons customerCoupons) throws Exception;

		/***** 일련번호 입력 시 쿠폰 존재 체크 *****/
		int countByCouponId(String couponId) throws Exception;
		
		/***** 일련번호 입력 시 CustomerCoupon 쿠폰발급(Insert) *****/
		int insertCustomerCouponById(CustomerCoupons customerCoupons) throws Exception;
		
		/********** 일련번호 입력 시 쿠폰 정보 가져옴 **********/
		Coupon getCouponId(String couponId) throws Exception;
		
		/***** 쿠폰 사용완료 업데이트 *****/
		int updateCoupon(CustomerCoupons customerCoupons) throws Exception;
		
		/***** 쿠폰 개수 가져오기 *****/
		int getCouponCount(Integer customerNo) throws Exception;
		
		/***** 사용자 쿠폰 찾기 *****/
		CustomerCoupons findCoupon(Integer customerCouponsNo) throws Exception;
		
		/***** 사용자 쿠폰 리스트 조회 *****/
		List<CustomerCoupons> findCouponList(Integer customerNo) throws Exception;
		
		/***** 입력한 일련번호가 중복인지 체크 *****/
		int duplicationCouponCheck(CustomerCoupons customerCoupons) throws Exception;
		
		
		
		//사용자 번호로 Customer 객체 반환
		//List<Customer> findCustomerCouponsByCustomerNo(Integer customerNo) throws Exception;
	}
