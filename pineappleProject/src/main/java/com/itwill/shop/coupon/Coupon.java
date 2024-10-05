package com.itwill.shop.coupon;

import java.util.Date;
import java.util.List;

import com.itwill.shop.customer.Customer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Coupon {
	
	/*********** PK *******************/
	private Integer couponNo;			// 쿠폰 번호
	private String couponName;			// 쿠폰 이름
	private String couponId;			// 쿠폰 아이디
	private String couponDiscount;		// 쿠폰 할인율
	private String couponDesc;			// 쿠폰 설명
	
	/********** List *****************/
	private List<Coupon> couponList ;	// 쿠폰 전체리스트
}
