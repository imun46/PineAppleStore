package com.itwill.shop.orders;

import java.util.Date;
import java.util.List;

import com.itwill.shop.customer.Customer;
import com.itwill.shop.customer.CustomerCoupons;
import com.itwill.shop.product.Product;

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
	private Integer ordersNo;	 	//주문번호
	
	private Date ordersDate;		 	//주문날짜
	private Date ordersArrivaldate;	 	//수령날짜
	private Integer ordersTotprice;		//주문 총 가격
	private Integer ordersFinalprice;	// 주문 최종 합격
	private Integer ordersTotqty;		// 주문합계 수량
	private String ordersAddress;		// 배송주소
	private String ordersStatus;		// 주문 주소
	
	/*****************List *********************/
	private List<Orders> orderList;		//주문 전체 리스트
	
	
	/**************** FK ********************/
	private Customer customerNo;//FK
	private CustomerCoupons customerCouponsNo;//FK
}
