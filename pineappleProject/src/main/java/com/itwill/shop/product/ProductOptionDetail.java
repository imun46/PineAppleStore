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
public class ProductOptionDetail {
	private Integer productOptionDetailNo;//PK
	private String productOptionDetailName;
	private Integer productOptionDetailPrice;
	
	private ProductOption productOption;	//FK
}
