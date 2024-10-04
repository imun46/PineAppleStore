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
	
	private Integer customerNo;
	private String customerId;
	private String customerPassword;
	private String customerName;
	private Date customerDob;
	private String customerAddress;
	private String customerGender;
	private String customerPhone;
	private String customerEmail;
	private String customerNickname;
	private Date customerJoindate;
	
	private List<Coupon> couponNo;//보류
}
