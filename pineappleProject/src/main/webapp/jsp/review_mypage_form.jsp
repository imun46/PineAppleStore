<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@page import="com.itwill.shop.service.ReviewService"%>
<%@page import="com.itwill.shop.domain.Review"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="customer_login_check.jspf"%>
<%
ReviewService reviewService = new ReviewService();
CustomerService customerService = new CustomerService();
Integer customerNo = Integer.parseInt(sCustomerNo);
Customer customer = customerService.findCustomerByNo(customerNo);
List<Review> reviewList = reviewService.findReviewByCustomerNo(customerNo);

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../includes/include_top_menu.jsp"></jsp:include> 


<!-- 해당 메뉴 이름-->
<header class="bg-dark py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="text-left text-dark">
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
	position: relative;/*자식객체들 위치조정*/
}
.review-container:hover {
    transform: scale(1.02); /* 호버 시 약간 확대 */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 강조 */
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
	position: absolute;
    right: 10px; /* 오른쪽 끝으로 이동 */
	bottom:10px;
	font-size: 0.8em; /* 날짜 및 작성자 크기 조정 */
    color: #555; /* 글자색 조정 */
}
.review-product-option{
	font-size: 30px;
	color: #666;
}
.review-author {
	position: absolute;
    right: 135px; /* 오른쪽 끝으로 이동 */
    bottom:10px;
    font-size: 0.8em; /* 날짜 및 작성자 크기 조정 */
    color: #555; /* 글자색 조정 */
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
	<div class="review-product-option">
            <%=review.getProduct().getProductName() %>(<%=review.getProduct().getProductDesc() %>)
      </div>
	<h2 class="review-title"><%=review.getReviewTitle()%></h2>
	
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
        <img class ="review-image" src="../img/<%=review.getReviewImage() %>" alt="My Image" style="width: 100px; height: auto">
        <%} %>
        <div class = "review-date">
        	작성일 : <%= formattedDate %>
        </div>
		<div class="review-author">
		작성자 : <%=customer.getCustomerName()%>
		</div>
		 <%
 }
 %>
	
</body>
</html>
