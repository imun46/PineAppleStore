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
	Review review = new Review();
	review.setReviewNo(Integer.parseInt(request.getParameter("reviewNo")));
	review.setReviewTitle(request.getParameter("reviewTitle"));
	review.setReviewContent(request.getParameter("reviewContent"));
	review.setReviewRating(Integer.parseInt(request.getParameter("reviewRating")));
	review.setReviewImage(request.getParameter("reviewImage"));
	review.setProduct(Product.builder().productNo(1).build());
	review.setCustomer(Customer.builder().customerNo(1).build());
    
    


	
	new ReviewService().updateReview(review);

	response.sendRedirect("review_detail.jsp");
//} catch (Exception e) {
//	e.printStackTrace();
//	response.sendRedirect("ereer");
//}
%>