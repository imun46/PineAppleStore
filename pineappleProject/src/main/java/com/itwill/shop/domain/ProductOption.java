package com.itwill.shop.domain;



import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductOption {
	/********* PK *********/
	private Integer productOptionNo;		// 제품 번호
	
	private String productOptionType;		// 제품 옵션 종류
	
	/********* FK *********/
	private Product product;				// 제품 정보
	
	private List<ProductOptionDetail> productOptionDetailList;	// 제품 옵션 상세 내용 리스트
}
