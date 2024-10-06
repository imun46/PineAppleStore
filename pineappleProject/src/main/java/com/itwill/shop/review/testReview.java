package com.itwill.shop.review;

import com.itwill.shop.customer.Customer;
import com.itwill.shop.product.Product;

public class testReview {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		ReviewService reviewService = new ReviewService();
//		System.out.println(reviewService.findByReviewNo(3));
		
//		reviewService.addReview(Review.builder().reviewTitle("이민용구매건")
//												.reviewContent("이민용이 안오고 야오밍이왔어요")
//												.reviewImage("/image/yaoming")
//												.reviewRating(1)
//												.product(Product.builder().productNo(1).build())
//												.customer(Customer.builder().customerNo(3).build())
//												.build());
		
	//	int rowCount = reviewService.deleteReview(6);
	//	System.out.println(rowCount);
		
//		int rowCount = reviewService.updateReview(Review.builder().reviewNo(1)
//																  .reviewTitle("이민용구매건")
//																  .reviewContent("다시보니 이민용이네요")
//																  .reviewRating(5)
//																  .reviewImage("미뇽이사진")
//																  .product(Product.builder().productNo(1).build())
//																  .customer(Customer.builder().customerNo(3).build())
//																  .build());
//		System.out.println(rowCount);
	}

}
