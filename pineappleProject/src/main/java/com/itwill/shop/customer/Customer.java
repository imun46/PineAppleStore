package com.itwill.shop.customer;

import java.util.Date;
import java.util.List;

import com.itwill.shop.coupon.Coupon;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Customer {
	
	private Integer customer_no;
	private String customer_id;
	private String customer_password;
	private String customer_name;
	private Date customer_dob;
	private String customer_address;
	private String customer_gender;
	private String customer_phone;
	private String customer_email;
	private String customer_nickname;
	private Date customer_joindate;
	
	private List<Coupon> coupon_no;//보류
}
