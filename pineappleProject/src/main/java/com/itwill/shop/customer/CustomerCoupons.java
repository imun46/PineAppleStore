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
	
	private Integer customerCouponsNo;//PK
	private Date customerCouponsEnddate;
	private String customerCouponsStatus;
	
	private Coupon couponNo;//FK
	private Customer customerNo;//FK
	
}
