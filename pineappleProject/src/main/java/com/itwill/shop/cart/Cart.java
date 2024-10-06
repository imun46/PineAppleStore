package com.itwill.shop.cart;

import java.util.Date;
import java.util.List;

import com.itwill.shop.coupon.Coupon;
import com.itwill.shop.customer.Customer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Cart {
	/******* PK **********/
	private Integer cartNo;		// 번호
	private Integer cartQty;	// 수량
	
	/*********** FK ************/
	private Customer customer;
	private List<ProductSelected> productSelectedList;
	
}
