<%@ page import="com.itwill.shop.review.Review" %>
<%@ page import="com.itwill.shop.review.ReviewService" %>
<%@ page import="com.itwill.shop.customer.Customer" %>
<%@ page import="com.itwill.shop.customer.CustomerService" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 ReviewService reviewService = new ReviewService();
 
	 int customerNo = 1;
	 //Integer customerNo = Integer.parseInt(request.getParameter("customerNo"));
	 List<Review> reviewList = reviewService.getMyReview(customerNo);
 %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제품 리뷰</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .review-container {        
   			display: block; 
   			text-decoration: none;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px 0;
            color: inherit;
        }
        .review-title {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .review-rating {
            color: #ffcc00;
            margin-bottom: 10px;
        }
        .review-body {
            font-size: 16px;
            line-height: 1.5;
        }
        .review-author {
            font-size: 14px;
            color: #666;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <h1>제품 리뷰</h1>
<%for(Review review: reviewList) {%>
<<<<<<< Upstream, based on origin/mj
<<<<<<< Upstream, based on origin/mj
    <a href="review_detail.jsp?reviewNo=<%=review.getReviewNo() %>" class="review-container">
=======
    <a href="review_detail.jsp" class="review-container">
>>>>>>> b54d38e 씨ㅡㅡ발
=======
    <a href="review_detail.jsp?reviewNo=<%=review.getReviewNo() %>" class="review-container">
>>>>>>> 7cd09ce ,.,.,.
        <h2 class="review-title"><%=review.getReviewTitle() %></h2>
        
        <%
        int rating= review.getReviewRating(); 
        for(int i=0;i<5;i++){
        %>
        <span class="review-rating">
        <%= (i < rating) ? "★" : "☆" %>
        
        </span>
        <%} %>
        <div class="review-body">
            <%=review.getReviewContent() %>
        </div>
                <div class="review-author"></div>
    </div>
<%} %>
    

</body>
</html>
