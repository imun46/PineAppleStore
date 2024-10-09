<%@page import="com.itwill.shop.review.Review"%>
<%@page import="com.itwill.shop.review.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("review_mypage_form.jsp");
		return;
	}

	String reviewNoStr = request.getParameter("reviewNo");
	
									
									
	ReviewService reviewService = new ReviewService();
	reviewService.deleteReview(Integer.parseInt(reviewNoStr));
	
	response.sendRedirect("review_mypage_form.jsp");
	
%>
