<%@ page import="com.itwill.shop.review.Review" %>
<%@ page import="com.itwill.shop.review.ReviewService" %>
<%@ page import="com.itwill.shop.customer.Customer" %>
<%@ page import="com.itwill.shop.customer.CustomerService" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="jsp/includes/login_check.jspf" %>
 <%
 ReviewService reviewService = new ReviewService();
	 
	 Integer customerNo = Integer.parseInt(sCustomerNo); 
	
	 List<Review> reviewList = reviewService.getMyReview(customerNo);
	
 %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="jsp/includes/include_top_menu.jsp" />
<!-- 파인애플 상단의 메뉴 -->


<!-- 해당 메뉴 이름-->
	<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">내가 쓴 리뷰</h1>
        </div>
    </div>
</header>
		

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내가 쓴 리뷰</title>
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
