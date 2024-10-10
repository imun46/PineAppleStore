<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="com.itwill.shop.review.Review"%>
<%@ page import="com.itwill.shop.review.ReviewService"%>
<%@ page import="com.itwill.shop.customer.Customer"%>
<%@ page import="com.itwill.shop.customer.CustomerService"%>
<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="jsp/includes/login_check.jspf"%>
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

	<%
	for (Review review : reviewList) {
		Date reviewDate = review.getReviewDate(); // 리뷰 날짜를 가져옵니다.
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 형식으로 포맷을 설정합니다.
		String formattedDate = dateFormat.format(reviewDate); // 날짜를 포맷합니다.
	%>
	<a href="review_detail.jsp?reviewNo=<%=review.getReviewNo()%>"	class="review-container">
	<h2 class="review-title"><%=review.getReviewTitle()%></h2>
	
	<div class="review-product-option">
            <%=review.getProduct().getProductName() %>(<%=review.getProduct().getProductDesc() %>)
      </div>
	 <%
 int rating = review.getReviewRating();
 for (int i = 0; i < 5; i++) {
 %> <span class="review-rating"> <%=(i < rating) ? "★" : "☆"%>

	</span> <%
 }
 %>
		<div class="review-body">
			<%=review.getReviewContent()%>
		</div>
		<%if(review.getReviewImage()!=null) {%>
        <img class ="review-image" src="<%=review.getReviewImage() %>" alt="My Image">
        <%} %>
        <div class = "review-date">
        	작성일 : <%= formattedDate %>
        </div>
		<div class="review-author">
		작성자 : <%=review.getCustomer().getCustomerName() %>
		</div>
		 <%
 }
 %>
	
</body>
</html>
