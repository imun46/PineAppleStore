package com.itwill.shop.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductImage {
	/******* PK *******/
	private Integer productImageNo;		// 제품 이미지 번호
	
	private String 	productImageFile;	// 제품 이미지 파일
	
	/******* FK *******/
	private Product product; 			// 제품 정보
	
}
