package com.itwill.shop.customer;

import java.util.Date;

import com.itwill.shop.coupon.Coupon;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class CustomerCoupons {
	
	private Integer customer_coupons_no;//PK
	private Date customer_coupons_enddate;
	private String customer_coupons_status;
	
	private Coupon coupon_no;//FK
	private Customer customer_no;//FK
	
}
