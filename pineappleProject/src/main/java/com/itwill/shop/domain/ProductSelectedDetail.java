package com.itwill.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductSelectedDetail {
	/********* PK ********/
	private Integer productSelectedDetailNo;	// 선택된 제품 옵션 정보 번호
	
	/********* FK ********/
	private ProductSelected productSelected;			// 선택된 제품 정보
	private ProductOptionDetail productOptionDetail;	// 제품 옵션 상세 정보
}
