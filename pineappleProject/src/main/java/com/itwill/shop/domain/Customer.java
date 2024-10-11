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
public class Customer {
	/********** PK ************/
	private Integer customerNo;			//  회원 번호
	
	private String customerId;			//  회원 아이디
	private String customerPassword;	//  회원 비밀번호
	private String customerName;		//  회원 이름
	private Date customerDob;			//  회원 생일
	private String customerAddress;		//  회원 주소
	private String customerGender;		//  회원 성별
	private String customerPhone;		//  회원 전화번호
	private String customerEmail;		//  회원 이메일
	private String customerNickname;	//	회원 닉네임
	private Date customerJoindate;		// 	회원 가입한 날짜
	
}
