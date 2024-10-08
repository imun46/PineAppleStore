<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@ page import="com.itwill.shop.review.Review"%>
<%@ page import="com.itwill.shop.review.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.ParseException"%>
<%
if (request.getMethod().equals("GET")) {
	response.sendRedirect("review_mypage_form.jsp");
	return;
}
//try {
	request.setCharacterEncoding("UTF-8");
	Integer reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	String reviewTitle = request.getParameter("reviewTitle");
	String reviewContent = request.getParameter("reviewContent");
	Integer reviewRating = Integer.parseInt(request.getParameter("reviewRating"));
	String reviewImage = request.getParameter("reviewImage");
	Integer proNoStr = Integer.parseInt(request.getParameter("productNo"));
	Integer cusNoStr = Integer.parseInt(request.getParameter("customerNo"));
	Product product =Product.builder().productNo(proNoStr).build(); 
	Customer customer = Customer.builder().customerNo(cusNoStr).build();
	
	Review review = Review.builder()
	        .reviewNo(reviewNo) 
	        .reviewTitle(reviewTitle)
	        .reviewContent(reviewContent)
	        .reviewRating(reviewRating)
	        .reviewImage(reviewImage)
	        .product(product)
	        .customer(customer)
	        .build();    
	ReviewService reviewService = new ReviewService();
    int updateRowCount = reviewService.updateReview(review);
    


	
	

	response.sendRedirect("review_detail.jsp");
//} catch (Exception e) {
//	e.printStackTrace();
//	response.sendRedirect("ereer");
//}
%>