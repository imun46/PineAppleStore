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
public class ProductOption {
	private Integer productOptionNo;//PK
	private String productOptionType;
	private Integer productNo;//FK
}
