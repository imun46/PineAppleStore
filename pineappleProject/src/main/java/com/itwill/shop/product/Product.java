package com.itwill.shop.product;

import java.util.List;

import com.itwill.shop.review.Review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Product {
	
	/*********** PK ***************/
	private Integer productNo;			// 제품 번호
	
	private String productName;			// 제품 이름
	private Integer productPrice;		// 제품 가격
	private String productCategory;		// 제품 카테고리
	private String productDetailpage;	// 제품 상세페이지
	private String productDesc;			// 제품 설명
	private String productStatus;		// 제품 상태 (품절,미품절)
	
<<<<<<< Upstream, based on origin/Ateam/기현
<<<<<<< Upstream, based on origin/Ateam/기현
<<<<<<< Upstream, based on origin/Ateam/기현
	/******** FK *****************/
	private List<Product> productList;  // 제품 전체 리스트
	
=======
=======
	/************* FK *****************/
>>>>>>> b972a88 orders 주석 수정
	private List<ProductImage> productImageList;	// 제품 이미지 리스트
	private List<Review> productReviewList;			// 제품 리뷰 리스트
	private List<ProductOption> productOptionList;	// 제품 옵션 리스트
>>>>>>> 3e1ca06 product DTO 1차 수정 commit
=======

	private List<ProductImage> productImageList;	// 제품 이미지 리스트
	private List<Review> productReviewList;			// 제품 리뷰 리스트
	private List<ProductOption> productOptionList;	// 제품 옵션 리스트

>>>>>>> 2a7ce9d product DTO 1차 수정 commit
}
