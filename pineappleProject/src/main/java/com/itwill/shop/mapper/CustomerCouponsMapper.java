package com.itwill.shop.mapper;

import java.util.List;
import java.util.Map;

import com.itwill.shop.domain.Coupon;
import com.itwill.shop.domain.CustomerCoupons;

public interface CustomerCouponsMapper {
	
	// 회원 쿠폰 발급
	int insertCustomerCoupons(Map<String, Integer> paramMap) throws Exception;
	
	// 일련 번호 입력 시 쿠폰 번호 반환
	int findCouponNoByCouponId(String couponId) throws Exception;
	
	// 회원 쿠폰 사용 시 상태 '사용완료'로 수정
	int updateCouponStatusUsed(Integer customerCouponsNo) throws Exception;
	
	// 유효기간 지난 회원 쿠폰 상태 수정 ('사용불가') 
	int updateCouponStatusExpired() throws Exception;
	
	// 회원 번호로 회원 쿠폰 리스트 반환 (사용가능, 사용불가, 사용완료)
	List<CustomerCoupons> findCustomerCouponsListALL(Integer customerNo) throws Exception;
	
	// 회원 번호로 회원 쿠폰 리스트 반환 (사용가능)
	List<CustomerCoupons> findCustomerCouponsListUsable(Integer customerNo) throws Exception;
	
	// 회원 번호로 회원 쿠폰 리스트 반환 (사용완료)
	List<CustomerCoupons> findCustomerCouponsListUsed(Integer customerNo) throws Exception;
	
	// 회원 번호로 회원 쿠폰 리스트 반환 (사용불가)
	List<CustomerCoupons> findCustomerCouponsListExpired(Integer customerNo) throws Exception;
	
	// 회원 쿠폰 번호로 회원 쿠폰 정보 반환
	CustomerCoupons findCustomerCouponsDetailByNo(Integer customerCouponsNo) throws Exception;
	
	// 사용 가능한 회원 쿠폰 개수 반환
	int findUsableCustomerCouponsQty(Integer customerNo) throws Exception;
	
	// 쿠폰 일련 번호 존재 여부 체크
	int checkCouponIdIfExistByCouponId(String couponId) throws Exception;
	
	// 쿠폰 일련 번호 사용 여부 체크
	int checkCouponIdIfUsedByCouponId(Map<String, Object> paramMap) throws Exception;
	
	
}
