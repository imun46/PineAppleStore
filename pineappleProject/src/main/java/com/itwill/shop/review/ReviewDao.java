package com.itwill.shop.review;

import java.util.List;

import com.itwill.shop.customer.Customer;
import com.itwill.shop.product.Product;

public interface ReviewDao {
	
	//리뷰 작성
	int insert(Review review) throws Exception;
	
	//리뷰 수정
	int update(Review review) throws Exception;
	
	//리뷰 삭제
	int delete(Integer reviewNo) throws Exception;
	
	//자기가 쓴 리뷰 리스트
	List<Review> findMyReview(Integer customerNo) throws Exception;
	
	//상품 리뷰 리스트
	List<Review> findProductReview(Integer productNo) throws Exception;
	
	//리뷰 하나보기
	Review findByReview(Integer reviewNo) throws Exception;
}
