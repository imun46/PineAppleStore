package com.itwill;

import com.itwill.shop.customer.Customer;
import com.itwill.shop.product.Product;
import com.itwill.shop.review.Review;
import com.itwill.shop.review.ReviewService;

public class test1212 {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		ReviewService reviewService = new ReviewService();
		
		reviewService.addReview(Review.builder()
				.reviewTitle("리뷰입니다 테스특요")
				.reviewContent("나야 들기름")
				.reviewImage("/image/들기름")
				.reviewRating(3)
				.productNo(Product.builder().productNo(1).build())
				.customerNo(Customer.builder().customerNo(1).build())
				.build());
		
//		reviewService.getMyReview()
	}

}
