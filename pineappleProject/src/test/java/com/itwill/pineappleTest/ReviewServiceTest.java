package com.itwill.pineappleTest;

import java.util.List;

import com.itwill.shop.domain.Customer;
import com.itwill.shop.domain.Product;
import com.itwill.shop.domain.Review;
import com.itwill.shop.service.ReviewService;

public class ReviewServiceTest {

	public static void main(String[] args) throws Exception {
		ReviewService reviewService = new ReviewService();
		
		/************** 리뷰 등록 **************/
		// 회원 번호, 제품 번호 지정
//		int customerNo = 1;
//		int productNo = 3;
//		
//		// 리뷰 객체 생성
//		Review review = Review.builder()
//				.reviewTitle("리뷰 등록 테스트 제목")
//				.reviewContent("리뷰 등록 테스트 내용")
//				.reviewImage("리뷰 등록 테스트 이미지")
//				.reviewRating(4)
//				.customer(Customer.builder().customerNo(customerNo).build())
//				.product(Product.builder().productNo(productNo).build())
//				.build();
//		
//		// 리뷰 등록 테스트
//		int reviewNo = reviewService.insertReview(review);
//		System.out.println("새롭게 등록된 리뷰 번호="+reviewNo);
		
		
		
		
		
		/************** 리뷰 수정 **************/
		// 수정하려는 리뷰 번호 지정
//		int reviewNo = 4;
//		
//		// 리뷰 객체 생성
//		Review review = Review.builder()
//				.reviewNo(reviewNo)
//				.reviewTitle("리뷰 수정 테스트 제목")
//				.reviewContent("리뷰 수정 테스트 내용")
//				.reviewImage("리뷰 수정 테스트 이미지")
//				.reviewRating(3)
//				.build();
//		
//		// 리뷰 수정 테스트
//		int rowCount = reviewService.updateReview(review);
//		System.out.println("리뷰 수정 성공 시 1="+rowCount);
		
		
		
		
		/************** 리뷰 삭제 **************/
//		// 삭제하려는 리뷰 번호 지정
//		int reviewNo = 4;
//		
//		// 리뷰 삭제
//		int rowCount = reviewService.deleteReview(reviewNo);
//		System.out.println("리뷰 삭제 성공 시 1="+rowCount);
		
		
		
		
		/************** 회원 번호로 리뷰 리스트 반환 (회원) **************/
//		// 회원 번호 지정
//		int customerNo = 1;
//		
//		// 리뷰 리스트 반환
//		List<Review> reviewList = reviewService.findReviewByCustomerNo(customerNo);
//		
//		System.out.println("총 리뷰 개수="+reviewList.size());
//		
//		for (Review review : reviewList) {
//			
//			System.out.println();
//			System.out.println("ProductNo="+review.getProduct().getProductNo());
//			System.out.println("ProductName="+review.getProduct().getProductName());
//			System.out.println("ReviewNo="+review.getReviewNo());
//			System.out.println("ReviewTitle="+review.getReviewTitle());
//			System.out.println("ReviewContent="+review.getReviewContent());
//			System.out.println("ReviewImage="+review.getReviewImage());
//			System.out.println("ReviewRating="+review.getReviewRating());
//			System.out.println("ReviewDate"+review.getReviewDate());
//			System.out.println();
//		}
		
		
		
		
		
		
		/************** 제품 번호로 리뷰 리스트 반환 **************/
//		// 제품 번호 지정
//		int productNo = 1;
//		
//		// 리뷰 리스트 반환
//		List<Review> reviewList = reviewService.findReviewByProductNo(productNo);
//		
//		System.out.println("총 리뷰 개수="+reviewList.size());
//		
//		for (Review review : reviewList) {
//			
//			System.out.println();
//			System.out.println("CustomerNo="+review.getCustomer().getCustomerNo());
//			System.out.println("CustomerName="+review.getCustomer().getCustomerName());
//			System.out.println("CustomerNickname="+review.getCustomer().getCustomerNickname());
//			System.out.println("ReviewNo="+review.getReviewNo());
//			System.out.println("ReviewTitle="+review.getReviewTitle());
//			System.out.println("ReviewContent="+review.getReviewContent());
//			System.out.println("ReviewImage="+review.getReviewImage());
//			System.out.println("ReviewRating="+review.getReviewRating());
//			System.out.println("ReviewDate"+review.getReviewDate());
//			System.out.println();
//		}
		
		
		
		
		
		/************** 리뷰 번호로 리뷰 한개 반환 **************/
//		// 리뷰 번호 지정
//		int reviewNo = 1;
//		
//		// 리뷰 리스트 반환
//		Review review = reviewService.findReviewByReviewNo(reviewNo);
//		
//		System.out.println();
//		System.out.println("ReviewNo="+review.getReviewNo());
//		System.out.println("ReviewTitle="+review.getReviewTitle());
//		System.out.println("ReviewContent="+review.getReviewContent());
//		System.out.println("ReviewImage="+review.getReviewImage());
//		System.out.println("ReviewRating="+review.getReviewRating());
//		System.out.println("ReviewDate"+review.getReviewDate());
//		System.out.println("CustomerNo="+review.getCustomer().getCustomerNo());
//		System.out.println("CustomerName="+review.getCustomer().getCustomerName());
//		System.out.println("CustomerNickname="+review.getCustomer().getCustomerNickname());
//		System.out.println("ProductNo="+review.getProduct().getProductNo());
//		System.out.println("ProductName="+review.getProduct().getProductName());
//		System.out.println();
			
		
		
		
		
		
		
		/************** 전체 리뷰 리스트 반환 (어드민) **************/
		// 전체 리뷰 리스트 반환
		List<Review> reviewList = reviewService.findAll();
		
		System.out.println("총 리뷰 개수="+reviewList.size());
		
		for (Review review : reviewList) {
			
			System.out.println();
			System.out.println("ReviewNo="+review.getReviewNo());
			System.out.println("ReviewTitle="+review.getReviewTitle());
			System.out.println("ReviewContent="+review.getReviewContent());
			System.out.println("ReviewImage="+review.getReviewImage());
			System.out.println("ReviewRating="+review.getReviewRating());
			System.out.println("ReviewDate"+review.getReviewDate());
			System.out.println("CustomerNo="+review.getCustomer().getCustomerNo());
			System.out.println("CustomerName="+review.getCustomer().getCustomerName());
			System.out.println("CustomerNickname="+review.getCustomer().getCustomerNickname());
			System.out.println("ProductNo="+review.getProduct().getProductNo());
			System.out.println("ProductName="+review.getProduct().getProductName());
			System.out.println();
			
		}
		
		
		
		
		
		
		
		
	}

}
