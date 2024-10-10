<%@page import="org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.itwill.shop.review.Review" %>
    <%@page import="com.itwill.shop.review.ReviewService" %>
    <%@page import="com.itwill.shop.customer.Customer" %>
    <%@page import="com.itwill.shop.customer.CustomerService" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.Date" %>
    <%
    CustomerService customerService = new CustomerService();
    ReviewService reviewService = new ReviewService();
    String reviewNo=request.getParameter("reviewNo");
    String productNo= request.getParameter("productNo");
    String customerNo = request.getParameter("customerNo");
    Review review =  reviewService.findByReviewNo(Integer.parseInt(reviewNo));
    
    Date reviewDate = review.getReviewDate(); // 리뷰 날짜를 가져옵니다.
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 형식으로 포맷을 설정합니다.
    String formattedDate = dateFormat.format(reviewDate); // 날짜를 포맷합니다.
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 리뷰</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
            background-color: #f9f9f9;
        }
        .review-container {
            background: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            display: block;
            text-decoration: none;
            color: inherit;
        }
        .review-title {
            font-size: 1.5em;
            margin: 0 0 10px;
        }
        .review-rating {
            color: gold;
        }
        .review-body {
            margin: 10px 0;
        }
        .review-author {
            font-size: 0.9em;
            color: #555;
        }
    </style>
</head>
<body>

<h1>제품 리뷰</h1>

    <div class="review-container">
        <h2 class="review-title"><%=review.getReviewTitle() %></h2>
        <div class="review-product-option">
            <%=review.getProduct().getProductImageList() %><%=review.getProduct().getProductName() %>(<%=review.getProduct().getProductDesc() %>)
        </div>
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
        <img src="<%=review.getReviewImage() %>" alt="My Image">
        	
        <div class = "review-date">
        	 <%= formattedDate %>
        </div>
        <div class="review-author"><%=review.getCustomer().getCustomerName() %></div>
        </div>
        
  
	<form action="review_update_form.jsp?reviewNo=<%=review.getReviewNo() %>" method="post" style="display:inline;">
        <input type="hidden" name="reviewNo" value="<%= review.getReviewNo() %>">
        <input type="submit" value="수정" class="review_form">
	</form>
	<form action="review_delete_action.jsp?reviewNo=<%=review.getReviewNo() %>" method="post" style="display:inline;">
        <input type="hidden" name="reviewNo" value="<%= review.getReviewNo() %>">
        <input type="submit" value="삭제" class="review_delete" onclick="return confirm('정말 삭제하시겠습니까?');">
    </form>
	<form action="customer_view.jsp" style="display:inline;">
        <input type="submit" value="마이페이지" class="review_join_mypage">
    </form>
	<form action="review_mypage_form.jsp" style="display:inline;">
        <input type="submit" value="목록" class="review_join_mypage_form">
    </form>
    
    
    
</body>
</html>
