package com.itwill.shop.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrdersItems {
	/**** PK ****/
	private Integer ordersItemsNo;				// 주문 아이템 번호
	
	private Integer ordersItemsPrice;			// 주문 아이템 원래 가격
	private Integer ordersItemsFinalprice;		// 주문 아이템 최종 가격
	private Integer ordersItemsQty;				// 주문 아이템 개수
	private String	ordersItemsOptions;			// 주문 아이템 옵션 정보
	
	/**** FK ****/
	private Orders orders;						// 주문 정보
	private Product product;					// 주문 아이템의 제품 정보
	
}
