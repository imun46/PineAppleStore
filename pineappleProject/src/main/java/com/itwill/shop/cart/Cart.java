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
	
	private Integer cart_no;//PK
	private Integer cart_qty;
	private Customer customer_no;//FK
	
}
