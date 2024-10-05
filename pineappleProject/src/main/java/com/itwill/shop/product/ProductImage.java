package com.itwill.shop.product;


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
	
	private Product product; //FK
}
