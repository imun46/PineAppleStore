package com.itwill.shop.cart;

import com.itwill.shop.product.Product;
import com.itwill.shop.product.ProductOptionDetail;
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
	private Product product;//FK
	private ProductOptionDetail productOptionDetail;//FK
	private Cart cart;//FK
}
