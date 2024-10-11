package com.itwill.shop.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cart {
	/******* PK **********/
	private Integer cartNo;		// 카트 번호
	
	private Integer cartQty;	// 카트 수량
	
	/*********** FK ************/
	private Customer customer;	// 회원 정보
	private Product product;	// 제품 정보
	
	private List<ProductSelected> productSelectedList;	// 선택한 제품 정보
	
}
