package com.itwill.shop.dao;

import java.util.List;

import com.itwill.shop.domain.Customer;
import com.itwill.shop.domain.Product;
import com.itwill.shop.domain.Review;

public interface ReviewDao {
   
   //리뷰 작성 (리뷰 번호 반환)
   int insertReview(Review review) throws Exception;
   
   //리뷰 수정
   int updateReview(Review review) throws Exception;
   
   //리뷰 삭제
   int deleteReview(Integer reviewNo) throws Exception;
   
   // 회원 번호로 리뷰 리스트 반환 (회원)
   List<Review> findReviewByCustomerNo(Integer customerNo) throws Exception;
   
   // 제품 번호로 리뷰 리슽트 반환
   List<Review> findReviewByProductNo(Integer productNo) throws Exception;
   
   // 리뷰 번호로 리뷰 한개 반환
   Review findReviewByReviewNo(Integer reviewNo) throws Exception;
   
   // 전체 리뷰 리스트 반환 (어드민) (추후 구현 예정)
   List<Review> findAll() throws Exception;
}
