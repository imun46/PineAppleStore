package com.itwill.shop.customer;

import java.util.Date;

public class CustomerTest {

	public static void main(String[] args) throws Exception {
		CustomerService customerService = new CustomerService();
		
		/*********** insert ********************/
	System.out.println(customerService.create(Customer.builder()
				.customerName("이민용")
				.customerAddress("주소입니다")
				.customerDob(new Date())
				.customerEmail("alsdyd0506@naver.com")
				.customerId("lee44")
				.customerGender("M")
				.customerPassword("123123")
				.customerPhone("010-4141-2323")
				.customerNickname("야오밍2")
				.build()));
		/*********** update ********************/
		System.out.println(customerService.updateCustomerId(Customer.builder()
				.customerPassword("123123")
				.customerAddress("1주소입니다2")
				.customerGender("F")
				.customerPhone("010-4141-23232")
				.customerEmail("alsdyd0@naver.com")
				.customerNickname("야오밍2")
				.customerNo(18)
				.build()));
		
		/*********** select ********************/
		System.out.println(customerService.findCustomerNo(2));
	
		
		/*********** delete ********************/
		System.out.println(customerService.deleteCustomerNo(2));
		
	
		
		
		
		

	}

}
