package com.itwill.shop.mapper;

import java.util.List;

import com.itwill.shop.customer.Customer;
import com.itwill.shop.product.Product;
import com.itwill.shop.review.Review;

public interface ReviewMapper {

	int insert(Review review) throws Exception;
	
	int update(Review review) throws Exception;
	
	int delete(int reviewNo) throws Exception;
	
	List<Review> findMyReview(Integer customerNo)throws Exception;
	
	List<Review> findProductReview(Integer productNo)throws Exception;
	
	Review findByReview(Integer reviewNo) throws Exception;
} 
