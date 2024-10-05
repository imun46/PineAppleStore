package com.itwill.shop.review;

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

public class Review {
	private Integer reviewNo;//PK
	private String reviewTitle;
	private String reviewContent;
	private String reviewImage;
	private Integer reviewRating;
	
	private Integer productNo;//FK
	private Integer customerNo;//FK
	
}
