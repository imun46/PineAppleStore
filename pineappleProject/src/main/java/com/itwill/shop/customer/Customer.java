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
	// 어드민 사용시
	private List<Customer> customerList; // 고객 리스트
	
	
}
