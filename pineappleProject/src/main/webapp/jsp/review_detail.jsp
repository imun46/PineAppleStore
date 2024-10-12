<%@page import="com.itwill.shop.domain.ProductImage"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.itwill.shop.domain.Review" %>
    <%@page import="com.itwill.shop.service.ReviewService" %>
    <%@page import="com.itwill.shop.domain.Customer" %>
    <%@page import="com.itwill.shop.service.CustomerService" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.Date" %>
    <%@include file="customer_login_check.jspf"%>
    <%
    CustomerService customerService = new CustomerService();
    ReviewService reviewService = new ReviewService();
    String reviewNo=request.getParameter("reviewNo");
    String productNo= request.getParameter("productNo");
    String customerNo = request.getParameter("customerNo");
    Review review =  reviewService.findReviewByReviewNo(Integer.parseInt(reviewNo));
    Integer customerNo1 = Integer.parseInt(sCustomerNo);
    Date reviewDate = review.getReviewDate(); // 리뷰 날짜를 가져옵니다.
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 형식으로 포맷을 설정합니다.
    String formattedDate = dateFormat.format(reviewDate); // 날짜를 포맷합니다.
    ProductService productService = new ProductService();
    
    %>
<!DOCTYPE html>
<html lang="ko">


<jsp:include page="../includes/include_top_menu.jsp"></jsp:include> 
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

/* 이민용이 수정 한 부분  */
/* 리뷰 버튼   */
.review_btn{
     color: #212529; /* 버튼 텍스트 색상 */
    border: 1px solid #212529; /* 버튼 경계 색상 */
    background-color: transparent; /* 배경색 투명 */
    padding: 10px 20px; /* 버튼의 패딩 */
    cursor: pointer; /* 마우스 포인터를 손가락 모양으로 변경 */
    font-size: 11px; /* 글자 크기 */
    font-weight: bold; /* 글자 두께 */
    border-radius: 5px; /* 모서리 둥글게 */
    transition: background-color 0.3s, color 0.3s; /* 호버 시 변화 애니메이션 */
}

.review_btn:hover {
    color: #fff; /* 호버 시 텍스트 색상 */
    background-color: #212529; /* 호버 시 배경색 */
    border-color: #212529; /* 호버 시 경계 색상 */
}

.review_btn:focus {
    outline: none; /* 포커스 시 외곽선 제거 */
    box-shadow: 0 0 0 0.2rem rgba(33, 37, 41, 0.5); /* 포커스 시 그림자 효과 */
}

.review_btn:active {
    color: #fff; /* 클릭 시 텍스트 색상 */
    background-color: #212529; /* 클릭 시 배경색 */
    border-color: #212529; /* 클릭 시 경계 색상 */
}


.review_btn_section {
	float: right; /* 글짜 오른쪽으로 옮김  */
}

/* 이민용 수정 끝  */


    </style>
</head>
<body>

<h1>제품 리뷰</h1>
    <div class="review-container">
        <div class="review-product-option">
<%=review.getProduct().getProductName() %>
        </div>
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
        <%if(review.getReviewImage()!=null) {%>
        <img src="../img/<%=review.getReviewImage() %>" alt="My Image" style="width: 300px; height: auto">
        <%} %>	
        <div class = "review-date">
        	작성일 : <%= formattedDate %>
        </div>
        <div class="review-author">
         작성자 : <%=review.getCustomer().getCustomerName() %></div>
        </div>
      
      <div class="review_btn_section"> 
  <%if(customerNo1==review.getCustomer().getCustomerNo()){ %>
	<form action="review_update_form.jsp?reviewNo=<%=review.getReviewNo() %>" method="post" style="display:inline;">
        <input type="hidden" name="reviewNo" value="<%= review.getReviewNo() %>">
        <input type="submit" value="수정" class="review_btn">
	</form>
	<form action="review_delete_action.jsp?reviewNo=<%=review.getReviewNo() %>" method="post" style="display:inline;">
        <input type="hidden" name="reviewNo" value="<%= review.getReviewNo() %>">
        <input type="submit" value="삭제" class="review_btn" onclick="return confirm('정말 삭제하시겠습니까?');">
    </form>
    <%} %>
	<form action="review_mypage_form.jsp" style="display:inline;">
        <input type="submit" value="목록" class="review_btn">
    </form>
	</div> 
    
    
    
</body>
</html>
