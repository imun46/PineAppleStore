package com.itwill.shop.mapper;

import java.util.List;

import com.itwill.shop.domain.Review;

public interface ReviewMapper {
	
	// 리뷰 작성
	int insertReview(Review review) throws Exception;
	
	// 리뷰 수정
	int updateReview(Review review) throws Exception;
	
	// 리뷰 삭제
	int deleteReview(int reviewNo) throws Exception;
	
	// 회원 번호로 리뷰 리스트 반환 (회원)
	List<Review> findReviewByCustomerNo(Integer customerNo)throws Exception;
	
	// 제품 번호로 리뷰 리스트 반환
	List<Review> findReviewByProductNo(Integer productNo)throws Exception;
	
	// 리뷰 리스트로 리뷰 한개 반환
	Review findReviewByReviewNo(Integer reviewNo) throws Exception;
	
	// 전체 리뷰 리스트 반환 (어드민) (추후 구현 예정)
	List<Review> findAll() throws Exception;
	
} 
