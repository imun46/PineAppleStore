package com.itwill.shop.coupon;

import java.util.Date;
import java.util.List;

import com.itwill.shop.customer.Customer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Coupon {
	
	private Integer coupon_no;//PK
	private String coupon_name;
	private String coupon_id;
	private String coupon_discount;
	private String coupon_desc;
}
