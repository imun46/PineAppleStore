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
    <%@include file="../includes/login_check.jspf"%>
    <%
    CustomerService customerService = new CustomerService();
    ReviewService reviewService = new ReviewService();
    String reviewNo=request.getParameter("reviewNo");
    String productNo= request.getParameter("productNo");
    String customerNo = request.getParameter("customerNo");
    Review review =  reviewService.findByReviewNo(Integer.parseInt(reviewNo));
    Integer customerNo1 = Integer.parseInt(sCustomerNo);
    Date reviewDate = review.getReviewDate(); // 리뷰 날짜를 가져옵니다.
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 형식으로 포맷을 설정합니다.
    String formattedDate = dateFormat.format(reviewDate); // 날짜를 포맷합니다.
    %>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../includes/include_top_menu.jsp" />
<!-- 파인애플 상단의 메뉴 -->


<!-- 해당 메뉴 이름-->
	<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">리뷰 수정</h1>
            <p class="lead fw-normal text-white-50 mb-0">어세오세욤 :)</p>
        </div>
    </div>
</header>
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
	display: block;
	text-decoration: none;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	padding: 30px;
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
.review-date{
	font-size: 14px;
	color: #666;
	margin-top: 10px;
}
.review-product-option{
	font-size: 10px;
	color: #666;
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

    <div class="review-container">
        <h2 class="review-title"><%=review.getReviewTitle() %></h2>
        <div class="review-product-option">
            <%=review.getProduct().getProductName() %>(<%=review.getProduct().getProductDesc() %>)
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
        	작성일 : <%= formattedDate %>
        </div>
        <div class="review-author">
         작성자 : <%=review.getCustomer().getCustomerName() %></div>
        </div>
        
  <%if(customerNo1==review.getCustomer().getCustomerNo()){ %>
	<form action="review_update_form.jsp?reviewNo=<%=review.getReviewNo() %>" method="post" style="display:inline;">
        <input type="hidden" name="reviewNo" value="<%= review.getReviewNo() %>">
        <input type="submit" value="수정" class="review_form">
	</form>
	<form action="review_delete_action.jsp?reviewNo=<%=review.getReviewNo() %>" method="post" style="display:inline;">
        <input type="hidden" name="reviewNo" value="<%= review.getReviewNo() %>">
        <input type="submit" value="삭제" class="review_delete" onclick="return confirm('정말 삭제하시겠습니까?');">
    </form>
    <%} %>
	<form action="customer_view.jsp" style="display:inline;">
        <input type="submit" value="마이페이지" class="review_join_mypage">
    </form>
	<form action="review_mypage_form.jsp" style="display:inline;">
        <input type="submit" value="목록" class="review_join_mypage_form">
    </form>
    
    
    
</body>
</html>
