package com.itwill.shop.service;

import java.util.List;

import com.itwill.shop.dao.ReviewDao;
import com.itwill.shop.daoimpl.ReviewDaoImpl;
import com.itwill.shop.domain.Review;

public class ReviewService {
	private ReviewDao reviewDao;

	public ReviewService() throws Exception {
		reviewDao= new ReviewDaoImpl();
	}
	
	// 리뷰 등록 (리뷰 번호 반환)
	public int insertReview(Review review) throws Exception{
		return reviewDao.insertReview(review);
	}
	
	// 리뷰 수정
	public int updateReview(Review review) throws Exception {
		return reviewDao.updateReview(review);
	}

	// 리뷰 삭제
	public int deleteReview(Integer reviewNo) throws Exception{
		return reviewDao.deleteReview(reviewNo);
	}
	
	// 회원 번호로 리뷰 리스트 반환 (회원)
	public List<Review> findReviewByCustomerNo(Integer customerNo) throws Exception{
		return reviewDao.findReviewByCustomerNo(customerNo);
	}
   
	// 제품 번호로 리뷰 리스트 반환
	public List<Review> findReviewByProductNo(Integer productNo) throws Exception{
		return reviewDao.findReviewByProductNo(productNo);
	}
	
	// 리뷰 리스트로 리뷰 한개 반환
	public Review findReviewByReviewNo(Integer reviewNo)throws Exception{
		return reviewDao.findReviewByReviewNo(reviewNo);
	}
	
	// 전체 리뷰 리스트 반환 (어드민) (추후 구현 예정)
	public List<Review> findAll() throws Exception {
		return reviewDao.findAll();
	}
	
	// 제품 번호로 리뷰 별점 리스트 반환
	public List<Integer> findRatingsByProductNo(Integer productNo) throws Exception {
		return reviewDao.findRatingsByProductNo(productNo);
	}
	
	
} 
 