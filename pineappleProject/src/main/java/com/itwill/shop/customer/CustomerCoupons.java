package com.itwill.shop.customer;

import java.util.Date;
import java.util.List;

import com.itwill.shop.coupon.Coupon;

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
	private Integer customerCouponsNo;		//사용자 쿠폰 번호
	private Date customerCouponsEnddate;	//사용자 종료 날짜
	private String customerCouponsStatus;	//사용자 쿠폰 상태 (사용,미사용) 
	
	/********** List *****************/
	private List<Coupon> customerCouponList; //사용자 쿠폰 전체리스트
	
	/************* FK *********************/
	private Coupon couponNo;//FK
	private Customer customerNo;//FK
	
}
