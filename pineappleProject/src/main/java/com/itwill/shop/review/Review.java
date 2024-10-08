package com.itwill.shop.review;

import java.time.Instant;
import java.util.Date;
import java.util.List;

import com.itwill.shop.coupon.Coupon;
import com.itwill.shop.customer.Customer;
import com.itwill.shop.product.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Review {
	
	/******** PK *********/
	private Integer reviewNo;			// 리뷰 번호
	
	private String reviewTitle;			// 리뷰 제목	
	private String reviewContent;		// 리뷰 내용
	private String reviewImage;			// 리뷰 이미지
	private Integer reviewRating;		// 리뷰 별점
	private Date reviewDate;
	/*************** FK *********************/
	private Product product;//FK
	private Customer customer;//FK
	
	
}
