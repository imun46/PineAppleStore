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
public class ProductSelected {
	/********* PK ********/
	private Integer productSelectedNo;	// 선택된 제품 정보 번호
	
	/********* PK ********/
	private Cart cart;					// 카트 정보
	
	private List<ProductSelectedDetail> productSelectedDetailList;		// 선택된 제품 옵션 리스트
	
}
