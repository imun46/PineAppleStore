package com.itwill.shop.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itwill.shop.dao.CustomerDao;
import com.itwill.shop.daoimpl.CustomerDaoImpl;
import com.itwill.shop.domain.Customer;
import com.itwill.shop.domain.CustomerCoupons;


public class CustomerService {

	private CustomerDao customerDao;

	public CustomerService() throws Exception {
		this.customerDao = new CustomerDaoImpl();
	}

	// 회원가입
	public int createId(Customer customer) throws Exception {
		// 아이디, 닉네임, 핸드폰 번호 중복체크
		if (customerDao.countCustomerId(customer.getCustomerId())==1 ||
			customerDao.countCustomerNickName(customer.getCustomerNickname())==1 ||
			customerDao.countCustomerPhone(customer.getCustomerPhone())==1) {
			// 중복 시 -1 반환
			return -1;
		}
		// 회원가입 완료
		return customerDao.insertCustomer(customer);
	}
	
	// 아이디 유효성 체크
	public boolean checkIdDupl(String customerId) throws Exception {
		if(customerDao.countCustomerId(customerId)==1)
			return true;
		return false;
	}
	
	// 닉네임 유효성 체크
	public boolean checkNicknameDupl(String customerNickname) throws Exception {
		if(customerDao.countCustomerNickName(customerNickname)==1)
			return true;
		return false;
	}
	
	// 핸드폰 번호 유효성 체크
	public boolean checkPhoneDupl(String customerPhone) throws Exception {
		if(customerDao.countCustomerPhone(customerPhone)==1)
			return true;
		return false;
	}
	
	// 로그인 (성공 시 회원 번호 반환, 실패 시 null 반환)
	public Integer login(String customerId, String customerPassword) throws Exception {
		// 아이디, 비밀번호 해시맵 담기
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("customerId", customerId);
		paramMap.put("customerPassword", customerPassword);
		// 회원 아이디/비밀번호 일치 여부 체크 후 회원 번호 반환 (실패 시 NULL 반환)
		return customerDao.getCustomerNoIfValidLogin(paramMap);
	}

	// 회원 아이디로 회원 정보 찾기
	public Customer findCustomerById(String customerId) throws Exception {
		return customerDao.findCustomerById(customerId);
	}

	// 회원 번호로 회원 정보 찾기
	public Customer findCustomerByNo(Integer customerNo) throws Exception {
		return customerDao.findCustomerByNo(customerNo);
	}
	

	// 회원 정보 수정
	public int updateCustomer(Customer customer) throws Exception {
		return customerDao.updateCustomer(customer);
	}

	// 회원 탈퇴
	public int deleteCustomer(Integer customerNo) throws Exception {
		return customerDao.deleteCustomer(customerNo);
	}
	
}
	
//	
///********** CustomerCoupon 메소드 **********/
//	
//	/*** (어드민) 사용자 쿠폰 발급 ***/
//	public int insertCustomerCoupon(CustomerCoupons customerCoupons) throws Exception {
//		System.out.println("CustomerService : insertCoupon");
//		return customerDao.insertCustomerCoupon(customerCoupons);
//	}
//	
//	/*** 쿠폰 사용완료 업데이트 ***/
//	public int updateCoupon(CustomerCoupons customerCoupons) throws Exception {
//		System.out.println("CustomerService : updateCoupon");
//		if(customerCoupons.getCustomerCouponsStatus().equals("사용불가")) {
//			System.out.println("사용이 불가능한 쿠폰입니다.");
//			return 0;
//		}
//		//날짜 포맷 설정
//		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
//		//포맷으로 EndDate 변경
//		String enddate = newDtFormat.format(customerCoupons.getCustomerCouponsEnddate());
//		
//		//포맷으로 today 선언 및 변경
//		String today = newDtFormat.format(new Date(System.currentTimeMillis()));
//		
//		//시간 가져와서 Date객체에 저장
//		Date newEnddate = new Date(newDtFormat.parse(enddate).getTime());
//		Date newToday = new Date(newDtFormat.parse(today).getTime());
//		//시간 비교
//		int compare = newEnddate.compareTo(newToday);
//		
//		if(compare < 0) {
//			System.out.println("사용 가능한 날짜가 지났습니다.");
//			return 0;
//		}
//		return customerDao.updateCoupon(customerCoupons);
//	}
//	
//	/*** 사용자 쿠폰 리스트 조회 ***/
//	public List<CustomerCoupons> findCouponList(Integer customerNo) throws Exception {
//		System.out.println("CustomerService : findCouponList");
//		return customerDao.findCouponList(customerNo);
//	}
//	
//	/*** CustomerCouponNO로 CustomerCoupon객체 찾기 ***/
//	public CustomerCoupons findCoupon(Integer customerCouponsNo) throws Exception {
//		System.out.println("CustomerService : findCoupon");
//		return customerDao.findCoupon(customerCouponsNo);
//	}
//	
//	/*** 사용자의 보유 쿠폰 갯수 반환 ***/
//	public int getCouponCount(Integer customerNo) throws Exception {
//		return customerDao.getCouponCount(customerNo);
//	}
//	
//	/*** 일련번호 입력 시 맞는 쿠폰이 있는지 확인 ***/
//	public int countByCouponId(String couponId) throws Exception {
//		return customerDao.countByCouponId(couponId);
//	}
//	
//	/*** 쿠폰ID 입력 시 ID와 일치하는 쿠폰 객체 반환 ***/
//	public Coupon getCouponId(String couponId) throws Exception {
//		return customerDao.getCouponId(couponId);
//	}
//	
//	/********* 일련번호 입력 시 CustomerCoupon 쿠폰발급(Insert) *****/
//	public int insertCustomerCouponById(Coupon coupon, Customer customer) throws Exception {
//		final int COUNTCOUPON = 2;//입력한 쿠폰 번호가 존재하지 않음
//		final int DUPLICATIONCOUPON = 3;//이미 등록된 쿠폰 번호
//		final int NULLCOUPON = 4;
//		
//		// coupon 객체가 null인지 확인
//	    if (coupon == null || coupon.getCouponId() == null) {
//	        System.out.println("쿠폰 번호가 유효하지 않습니다.");
//	        return NULLCOUPON;
//	    }
//	    
//		//입력한 쿠폰 번호가 존재하는지 체크
//		if(customerDao.countByCouponId(coupon.getCouponId()) == 0) {
//			 System.out.println("올바르지 않은 쿠폰 번호입니다.");
//			 return COUNTCOUPON;
//		}
//		
//		CustomerCoupons customerCoupons = CustomerCoupons.builder()
//		        .coupon(coupon)
//		        .customer(customer)
//		        .build();
//		
//		//입력한 쿠폰 번호가 중복인지 체크
//		if(customerDao.duplicationCouponCheck(customerCoupons) > 0) {
//			System.out.println("이미 등록된 쿠폰입니다.");
//			return DUPLICATIONCOUPON;
//		}
//				
//		return customerDao.insertCustomerCouponById(customerCoupons);
//	}

