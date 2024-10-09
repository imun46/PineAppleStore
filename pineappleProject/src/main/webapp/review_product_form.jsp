<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="com.itwill.shop.review.Review" %>
<%@ page import="com.itwill.shop.review.ReviewService" %>
<%@ page import="com.itwill.shop.product.Product" %>
<%@ page import="com.itwill.shop.product.ProductService" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 ReviewService reviewService = new ReviewService();
 
 //Integer productNo=Integer.parseInt(request.getParameter("productNo"));
 //병합 시 주석 제거
 List<Review> reviewList = reviewService.getProductReview(2);
 
 
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
   <a href="review_detail.jsp?reviewNo=<%=review.getReviewNo() %>" class="review-container">
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
        <div class="review-author">
        	<%=review.getCustomer().getCustomerName() %>
        </div>
        <div class="review-time">
        <%
        Date reviewDate = review.getReviewDate();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(reviewDate);
        %>
        	<%=formattedDate %>
        </div>
<<<<<<< Upstream, based on origin/mj
    </div>
>>>>>>> 10fb1a8 Merge branch 'master' of https://github.com/2024-07-JAVA-DEVELOPER-155/web-project-team1-pineapple.git
=======
    </a>
>>>>>>> 7cd09ce ,.,.,.
<%} %>
    

</body>
</html>
