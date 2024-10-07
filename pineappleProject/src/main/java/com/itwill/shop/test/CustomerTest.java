package com.itwill.shop.test;

import com.itwill.shop.customer.CustomerService;

public class CustomerTest {

	public static void main(String[] args) throws Exception {
		CustomerService customerService = new CustomerService();
		System.out.println(customerService.findCoupon(1));
		
		
		customerService.insertCustomerCouponById("A123456", null);
		
		
		
	}

}
