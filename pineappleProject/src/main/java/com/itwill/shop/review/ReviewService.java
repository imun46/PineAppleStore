package com.itwill.shop.review;

import java.util.List;

import com.itwill.shop.customer.Customer;
import com.itwill.shop.product.Product;

public class ReviewService {
	private ReviewDao reviewDao;
	public ReviewService() throws Exception {
		reviewDao= new ReviewDaoImpl();
	}
	//리뷰 등록
	public int addReview(Review review) throws Exception{
		return reviewDao.insert(review);
	}
	//리뷰 수정
	public int updateReview(Review review) throws Exception {
		return reviewDao.update(review);
	}
	//리뷰 삭제
	public int deleteReview(Integer reviewNo) throws Exception{
		return reviewDao.delete(reviewNo);
	}
	//리뷰 리스트(마이페이지)
	public List<Review> getMyReview(Integer customerId) throws Exception{
		return reviewDao.findMyReview(customerId);
	}
	//리뷰 리스트(상품페이지)
	public List<Review> getProductReview(Integer productNo) throws Exception{
		return reviewDao.findProductReview(productNo);
	}
	//리뷰 하나보기
	public Review findByReviewNo(Integer reviewNo)throws Exception{
		return reviewDao.findByReview(reviewNo);
	}
} 
 