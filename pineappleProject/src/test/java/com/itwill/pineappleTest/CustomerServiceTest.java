package com.itwill.pineappleTest;

import java.sql.Date;
import java.time.LocalDate;

import com.itwill.shop.domain.Customer;
import com.itwill.shop.service.CustomerService;

public class CustomerServiceTest {

	public static void main(String[] args) throws Exception {
		
		CustomerService customerService = new CustomerService();
		
        LocalDate localDate = LocalDate.now(); // Get current date
        Date sqlDate = Date.valueOf(localDate);
//		
//		/*************** 회원가입 *****************/
//        // 회원 정보 지정
//		String 	customerId 			= "park";
//		String 	customerPassword 	= "123";
//		String 	customerName 		= "park";
//		Date	customerDob 		= sqlDate;
//		String 	customerAddress 	= "somewhere";
//		String 	customerGender 		= "남";
//		String 	customerPhone 		= "01011110000";
//		String 	customerEmail 		= "park@gmail.com";
//		String 	customerNickname 	= "parky";
//		
//		// 회원 객체 생성 및 필드 입력
//		Customer customer = Customer.builder()
//				.customerId(customerId)
//				.customerPassword(customerPassword)
//				.customerName(customerName)
//				.customerDob(customerDob)
//				.customerAddress(customerAddress)
//				.customerGender(customerGender)
//				.customerPhone(customerPhone)
//				.customerEmail(customerEmail)
//				.customerNickname(customerNickname)
//				.build();
//		
//		// 회원 가입
//		int rowCount = customerService.createId(customer);
//		System.out.println("회원가입 성공 시 1 반환:"+rowCount);
	
		
		
		
		/****************** 유효성 체크 *******************/
//		// 유효성 체크 데이터 지정
//		String customerId 		= "park";
//		String customerNickname = "parky";
//		String customerPhone 	= "01011110000";
//		
//		// 유효성 체크
//		boolean idCheck = customerService.checkIdDupl(customerId);
//		boolean nicknameCheck = customerService.checkNicknameDupl(customerNickname);
//		boolean phoneCheck = customerService.checkPhoneDupl(customerPhone);
//		
//		System.out.println("아이디 중복 여부: "+idCheck);
//		System.out.println("닉네임 중복 여부: "+nicknameCheck);
//		System.out.println("핸드폰 번호 중복 여부: "+phoneCheck);
		
		
		
		
		/***************** 로그인 ****************/
		// 아이디 비밀번호 지정
//		String customerId 		= "park";
//		String customerPassword = "123";
//		
//		// 로그인
//		Integer loginSuccess = customerService.login(customerId, customerPassword);
//		if(loginSuccess==null) {
//			System.out.println("로그인 실패");
//		} else {
//			System.out.println("로그인 성공, 반환된 회원 번호: "+loginSuccess);
//		}
		
		
		
		/******************** 회원 아이디, 번호로 회원 정보 찾기 ************************/
		//회원 아이디, 번호 지정
//		String	customerId 	= "park";
//		int		customerNo 	= 1;
//		
//		// 회원 아이디, 번호로 회원 정보 찾기
//		Customer customerById = customerService.findCustomerById(customerId);
//		Customer customerByNo = customerService.findCustomerByNo(customerNo);
//		
//		if(customerById!=null) {
//			System.out.println("아이디:"+customerById);
//			System.out.println(customerById);
//		} else {
//			System.out.println("아이디:"+customerById+" 는 없는 아이디");
//		}
//		
//		System.out.println();
//		
//		if(customerByNo!=null) {
//			System.out.println("회원 번호:"+customerByNo);
//			System.out.println(customerByNo);
//		} else {
//			System.out.println("회원 번호:"+customerByNo+" 는 없는 회원 번호");
//		}
		
		
		
		
		
		/****************** 회원 정보 수정 ******************/
        // 회원 정보 지정
//        int 	customerNo			= 6;
//		String 	customerPassword 	= "123";
//		String 	customerAddress 	= "somewhere 수정";
//		String 	customerGender 		= "남";
//		String 	customerPhone 		= "0101111수정번호";
//		String 	customerEmail 		= "park11@gmail.com";
//		String 	customerNickname 	= "parky111";
//		
//		// 회원 객체 생성 및 필드 입력
//		Customer customer = Customer.builder()
//				.customerNo(customerNo)
//				.customerPassword(customerPassword)
//				.customerAddress(customerAddress)
//				.customerGender(customerGender)
//				.customerPhone(customerPhone)
//				.customerEmail(customerEmail)
//				.customerNickname(customerNickname)
//				.build();
//		
//		// 회원 정보 수정
//		int rowCount = customerService.updateCustomer(customer);
//		System.out.println("회원 정보 수정 성공 시 1 반환:"+rowCount);
		
		
		
		
		
		/****************** 회원 탈퇴 ******************/
		// 회원 번호 지정
        int customerNo = 6;
        
        // 회원 탈퇴
        int rowCount = customerService.deleteCustomer(customerNo);
		System.out.println("회원 탈퇴 성공 시 1 반환:"+rowCount);
        
        
		
		
		
		
	}
}
