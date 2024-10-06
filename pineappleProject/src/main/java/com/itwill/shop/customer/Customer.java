package com.itwill.shop.customer;

import java.util.Date;
import java.util.List;

import com.itwill.shop.cart.Cart;
import com.itwill.shop.coupon.Coupon;
import com.itwill.shop.orders.Orders;
import com.itwill.shop.review.Review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Customer {
	/********** PK ************/
	private Integer customerNo;			//  번호
	
	private String customerId;			//  아이디
	private String customerPassword;	//  비밀번호
	private String customerName;		//  이름
	private Date customerDob;			//  날짜
	private String customerAddress;		//  주소
	private String customerGender;		//  성별
	private String customerPhone;		//  전화번호
	private String customerEmail;		//  이메일
	private String customerNickname;	//	닉네임
	private Date customerJoindate;		// 	가입한 날짜
	
	
	/**************List ****************/
	private List<Orders> ordersList; // 고객 주문 내역
	private List<Review> reviewList; // 고객 리뷰 내역
	private List<Cart> cartList; // 고객 카트
	private List<CustomerCoupons> couponList; // 고객 카트
	
	
}
