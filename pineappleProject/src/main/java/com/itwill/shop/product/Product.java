package com.itwill.shop.product;

import com.itwill.shop.review.Review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Product {
	
	private Integer productNo;//PK
	private String productName;
	private Integer productPrice;
	private String productCategory;
	private String productDetailpage;
	private String productDesc;
	private String productStatus;
}
