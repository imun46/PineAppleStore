package com.itwill.shop.cart;

import com.itwill.shop.review.Review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductSelected {
	private Integer productSelectedNo;//PK
	private Integer productNo;//FK
	private Integer productOptionDetailNo;//FK
	private Integer cartNo;//FK
}
