package com.itwill.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itwill.shop.dao.CustomerCouponsDao;
import com.itwill.shop.daoimpl.CustomerCouponsDaoImpl;
import com.itwill.shop.domain.CustomerCoupons;

public class CustomerCouponsService {
	
	private CustomerCouponsDao customerCouponsDao;
	
	public CustomerCouponsService() throws Exception {
		this.customerCouponsDao = new CustomerCouponsDaoImpl();
	}
	
	// 일련 번호로 회원 쿠폰 발급
	public int insertCustomerCoupons(String couponId, Integer customerNo) throws Exception {
		// 쿠폰 일련 번호 존재 여부 체크
		if(customerCouponsDao.checkCouponIdIfExistByCouponId(couponId)==0) {
			return 0;
		}
		// 쿠폰 일련 번호 사용 여부 확인을 위한 해시맵 생성
		Map<String, Object> paramMapCheck = new HashMap<>();
		paramMapCheck.put("couponId", couponId);
		paramMapCheck.put("customerNo", customerNo);
		
		
		// 쿠폰 일련 번호 사용 여부 체크
		if(customerCouponsDao.checkCouponIdIfUsedByCouponId(paramMapCheck)==1) {
			return 0;
		}
		
		// 쿠폰 일련 번호로 쿠폰 번호 반환
		Integer couponNo = customerCouponsDao.findCouponNoByCouponId(couponId);
		
		// couponNo, customerNo 해시맵 생성 및 입력
		Map<String, Integer> paramMap = new HashMap<>();
		paramMap.put("couponNo", couponNo);
		paramMap.put("customerNo", customerNo);
		
		// 회원 쿠폰 입력
		int rowCount = customerCouponsDao.insertCustomerCoupons(paramMap);
		return rowCount;
	}

	// 쿠폰 사용시 사용완료 상태 변경
	public int updateCouponStatusUsed(Integer customerCouponsNo) throws Exception {
		return customerCouponsDao.updateCouponStatusUsed(customerCouponsNo);
	}
	
	// 회원 번호로 전체 회원 쿠폰 리스트 출력 (사용가능, 사용불가, 사용 완료)
	public List<CustomerCoupons> findCustomerCouponsListALL(Integer customerNo) throws Exception {
		// 유효기간 지난 회원 쿠폰 상태 수정
		customerCouponsDao.updateCouponStatusExpired();
		
		// 전체 회원 쿠폰 리스트 출력 (모든 상태)
		return customerCouponsDao.findCustomerCouponsListALL(customerNo);
	}
	
	
	// 회원 번호로 전체 회원 쿠폰 리스트 출력 (사용가능)
	public List<CustomerCoupons> findCustomerCouponsListUsable(Integer customerNo) throws Exception {
		// 유효기간 지난 회원 쿠폰 상태 수정
		customerCouponsDao.updateCouponStatusExpired();
		
		// 전체 회원 쿠폰 리스트 출력 (사용가능)
		return customerCouponsDao.findCustomerCouponsListUsable(customerNo);
	}
	
	// 회원 번호로 전체 회원 쿠폰 리스트 출력 (사용완료)
	public List<CustomerCoupons> findCustomerCouponsListUsed(Integer customerNo) throws Exception {
		// 유효기간 지난 회원 쿠폰 상태 수정
		customerCouponsDao.updateCouponStatusExpired();
		
		// 전체 회원 쿠폰 리스트 출력 (사용가능)
		return customerCouponsDao.findCustomerCouponsListUsed(customerNo);
	}
	
	// 회원 번호로 전체 회원 쿠폰 리스트 출력 (사용불가)
	public List<CustomerCoupons> findCustomerCouponsListExpired(Integer customerNo) throws Exception {
		// 유효기간 지난 회원 쿠폰 상태 수정
		customerCouponsDao.updateCouponStatusExpired();
		
		// 전체 회원 쿠폰 리스트 출력 (사용가능)
		return customerCouponsDao.findCustomerCouponsListExpired(customerNo);
	}
	
	// 회원 쿠폰 번호로 회원 쿠폰 정보 출력
	public CustomerCoupons findCustomerCouponsDetailByNo(Integer customerCouponsNo) throws Exception {
		return customerCouponsDao.findCustomerCouponsDetailByNo(customerCouponsNo);
	}
	
	// 회원 번호로 사용 가능한 쿠폰 개수 출력
	public int findUsableCustomerCouponsQty(Integer customerNo) throws Exception {
		return customerCouponsDao.findUsableCustomerCouponsQty(customerNo);
	}
	
	
	
	
}
