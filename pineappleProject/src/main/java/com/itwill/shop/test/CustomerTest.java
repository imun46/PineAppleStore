package com.itwill.shop.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.itwill.shop.coupon.Coupon;
import com.itwill.shop.customer.Customer;
import com.itwill.shop.customer.CustomerCoupons;
import com.itwill.shop.customer.CustomerService;

public class CustomerTest {

	public static void main(String[] args) throws Exception {
//		CustomerService customerService = new CustomerService();
//		String customerNo = "1";
//		Customer loginCustomer = customerService.findCustomerId("IDEX1");
//		System.out.println(loginCustomer);
//		String customerId = "IDEX1";
//		CustomerService customerService = new CustomerService();
		
		
		
		
		//int count =	customerService.getCouponCount(loginCustomer.getCustomerNo());
		//System.out.println(count);
		
		//SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); 
        //원하는 데이터 포맷 지정
		//simpleDateFormat.format(loginCustomer.getCustomerDob()); 
        //지정한 포맷으로 변환 
		//System.out.println("포맷 지정 후 : " + simpleDateFormat.format(loginCustomer.getCustomerDob()));
		
		/*** CustomerCoupons 객체 생성 ***/
//		CustomerCoupons customerCoupons = CustomerCoupons.builder()
//				.customer(Customer.builder().customerNo(2).build())
//				.build();
//		/*** 쿠폰 발급 ***/
//		System.out.println(customerService.findCoupon(1));
//		/*** 쿠폰 발급 ***/
//		System.out.println(customerService.findCoupon(1));
	String customerId = "IDEX2"; //사용자 아이디
	String couponId = "C123456"; //쿠폰 아이디
	/*** 서비스 선언 ***/
	CustomerService customerService = new CustomerService();

	/*** 로그인한 사용자 찾기 ***/
	Customer loginCustomer = customerService.findCustomerId(customerId);

	/*** 쿠폰ID에 맞는 쿠폰 찾기***/
	Coupon coupon = customerService.getCouponId(couponId);
	System.out.println(coupon);

	/*** 쿠폰 삽입 ***/
	int rowCount = customerService.insertCustomerCouponById(coupon, loginCustomer);
	System.out.println(rowCount);

		
//		List<CustomerCoupons> customerCouponsList = customerService.findCouponList(loginCustomer.getCustomerNo());
//		System.out.println("customerCouponsList : " + customerCouponsList);
//		System.out.println(coupon);
//		int rowCount = customerService.insertCustomerCouponById(coupon, loginCustomer);
//		System.out.println(rowCount);
//		System.out.println(customerService.countByCouponId(couponId));
//		
//	
//
//		
//		String customerCouponNoStr = "18";
//		Integer customerCouponNo = Integer.parseInt(customerCouponNoStr);
//		/*** CustomerCoupons번호에 맞는 쿠폰 찾기***/
//		CustomerCoupons findCoupon = customerService.findCoupon(customerCouponNo);
//		System.out.println(findCoupon);
//		/*** 사용자 쿠폰 리스트 가져오기 ***/
//		List<CustomerCoupons> findCouponList = customerService.findCouponList(loginCustomer.getCustomerNo());
//		System.out.println("findCouponList : " + findCouponList);
//		/*** CustomerCoupons번호에 맞는 쿠폰 찾기***/
//		CustomerCoupons findCoupon = customerService.findCoupon(findCouponList.get(0).getCustomerCouponsNo());
//		System.out.println("findCoupon(index : 0) : " + findCoupon);
		
		/*** 번호에 맞는 쿠폰 찾기***/
		//CustomerCoupons findCoupon = customerService.findCoupon(17);
		/*** 사용자 쿠폰 업데이트(사용) ***/
//		int updateRowCount = customerService.updateCoupon(findCoupon);
//		System.out.println(updateRowCount);
		/*** 사용자 번호로 CustomerCoupons 객체 반환 ***/
		//List<CustomerCoupons> customerCouponsList = customerService.findCustomerCouponsByNo(loginCustomer.getCustomerNo());
		
//		
//		List<CustomerCoupons> customerCoupons = customerService.findCouponList(loginCustomer.getCustomerNo());
//		System.out.println(customerCoupons);
//		
//		for (CustomerCoupons customerCoupon : customerCoupons) {
//			System.out.println("쿠폰 이름 : " + customerCoupon.getCoupon().getCouponName());
//			System.out.println("쿠폰 내용 : " + customerCoupon.getCoupon().getCouponDesc());
//			System.out.println("쿠폰 종료 날짜 : " + customerCoupon.getCustomerCouponsEnddate());
//			System.out.println("쿠폰 상태: " + customerCoupon.getCustomerCouponsStatus());
//		}
//		
		
//		String password = "1111";
//		String address = "주소주소";
//		String gender = "M";
//		String phone = "111-1111";
//		String email = "수정@수정수정";
//		String nickname = "수정";
//		
//		
//		int rowCount = customerService.updateCustomerId(Customer.builder()
//				.customerNo(1)
//				.customerPassword(password)
//				.customerAddress(address)
//				.customerGender(gender)
//				.customerPhone(phone)
//				.customerEmail(email)
//				.customerNickname(nickname)
//				.build());
//		
		
		
		
		
		
		
		
		
		
		//System.out.println(customerService.findCoupon(1));
		
//		Coupon coupon = Coupon.builder()
//				.couponNo(1)
//				.couponName("30% 할인쿠폰")
//				.couponId("A123456")
//				.couponDiscount("30")
//				.couponDesc("전자제품 전 품목 30% 할인 쿠폰입니다")
//				.build();
//		System.out.println("coupon.getCouponNo() : " + coupon.getCouponNo());
		
		/********** 일련번호 입력 시 CustomerCoupon 쿠폰 발급(Insert) *********/
//		customerService.insertCustomerCouponById("A123456", 
//				CustomerCoupons.builder()
//								.customer(new Customer().builder()
//									.customerNo(2)
//									.build())
//								.build());
//		
//		
		
		/****************************CustomerCoupon**********************************/
		
		/********** CustomerCoupon 사용자가 보유한 쿠폰 리스트 조회(Select) 매개변수 : customerNo(사용자 번호)*********/
//		List<CustomerCoupons> customerCouponsList = customerService.findCouponList(4);
//		System.out.println("customerCouponsList : " + customerCouponsList);
//		for (CustomerCoupons customerCoupons : customerCouponsList) {
//			System.out.println("쿠폰 이름 : " + customerCoupons.getCoupon().getCouponName());
//			System.out.println("쿠폰 내용 : " + customerCoupons.getCoupon().getCouponDesc());
//			System.out.println("쿠폰 상태 : " + customerCoupons.getCustomerCouponsStatus());
//			System.out.println("쿠폰 종료 날짜 : " + customerCoupons.getCustomerCouponsEnddate());
//			System.out.println("customerCoupons.getCoupon().getCouponNo() : " + customerCoupons.getCoupon().getCouponNo());
//			System.out.println("customerCoupons.getCoupon().getCouponId() : " + customerCoupons.getCoupon().getCouponId());
//			System.out.println("customerCoupons.getCoupon().getCouponDiscount() : " + customerCoupons.getCoupon().getCouponDiscount());
////			CustomerNo(사용자 번호)로 찾는데 이걸 여기 담을 이유는 없어 보임
////			System.out.println("customerCoupons.getCustomer().getCustomerNo() : " + customerCoupons.getCustomer().getCustomerNo());  
//			System.out.println("customerCoupons.getCustomerCouponsNo() : " + customerCoupons.getCustomerCouponsNo());
//		}
//		
//		CustomerCoupons customerCoupons = customerService.findCoupon(1);
//		
//		/********** CustomerCoupon 사용자가 보유한 쿠폰 조회(Select) 매개변수 : customerCouponNo(사용자 번호)*********/
//		System.out.println(customerCoupons);
//		System.out.println("쿠폰 이름 : " + customerCoupons.getCoupon().getCouponName());
//		System.out.println("쿠폰 내용 : " + customerCoupons.getCoupon().getCouponDesc());
//		System.out.println("쿠폰 상태 : " + customerCoupons.getCustomerCouponsStatus());
//		System.out.println("쿠폰 종료 날짜 : " + customerCoupons.getCustomerCouponsEnddate());
//		
//		/********** CustomerCoupon 쿠폰 업데이트(Update) 매개변수 : customer_coupons_no *********/
//		System.out.println(customerService.updateCoupon(3));
		
		
	}

}
