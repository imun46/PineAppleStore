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
public class ProductImage {
	private Integer productImageNo;//PK
	private String productImageFile;
	private Integer productNo;//FK
}
