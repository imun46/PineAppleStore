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
public class CustomerCoupons {
	/********** PK ****************/
	private Integer customerCouponsNo;		// 회원이 소지한 쿠폰 번호
	
	private Date customerCouponsEnddate;	// 쿠폰 종료 날짜
	private String customerCouponsStatus;	// 쿠폰 상태 (사용,미사용) 
	
	/************* FK *********************/
	private Coupon coupon;		// 쿠폰 정보
	private Customer customer;	// 쿠폰을 가지고 있는 회원 정보
	
}
