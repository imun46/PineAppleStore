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
=======
<%@page import="com.itwill.shop.review.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("review_deatil.jsp");
		return;
	}
	 
request.setCharacterEncoding("UTF-8");
Review review = new Review();
review.setReviewNo(Integer.parseInt(request.getParameter("reviewNo")));
review.setReviewTitle(request.getParameter("reviewTitle"));
review.setReviewContent(request.getParameter("reviewContent"));
review.setReviewRating(Integer.parseInt(request.getParameter("reviewRating")));	
review.setReviewImage(request.getParameter("reviewImage"));
review.setProduct(Product.builder().productNo(1).build());
review.setCustomer(Customer.builder().customerNo(1).build());
	new ReviewService().addReview(review);
	response.sendRedirect("review_mypage_form.jsp");
>>>>>>> 42e37fc 씨ㅡㅡ발
%>