package com.itwill.shop.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Orders {
	/********** PK **************/
	private Integer ordersNo;	 		// 주문번호
	
	private Date ordersDate;		 	// 주문날짜
	private Date ordersArrivaldate;	 	// 수령날짜
	private Integer ordersTotprice;		// 주문 총 가격
	private Integer ordersFinalprice;	// 주문 최종 합격
	private Integer ordersTotqty;		// 주문합계 수량
	private String ordersAddress;		// 배송주소
	private String ordersStatus;		// 주문 상태
	
	private List<OrdersItems> ordersItemsList;	// 주문 아이템 리스트
	
	/**************** FK ********************/
	private Customer customer;					// 회원 정보
	private CustomerCoupons customerCoupons;	// 회원이 주문 시 사용한 쿠폰 정보
	
}
