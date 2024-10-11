package com.itwill.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductOptionDetail {
	/******* PK ********/
	private Integer productOptionDetailNo;			// 제품 옵션 상세 번호
	
	private String productOptionDetailName;			// 제품 옵션 상세 내용
	private Integer productOptionDetailPrice;		// 제품 옵션 상세 추가 금액
	
	/********* FK **********/
	private ProductOption productOption;			// 제품 옵션 정보
}
