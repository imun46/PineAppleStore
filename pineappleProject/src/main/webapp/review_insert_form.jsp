<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.itwill.shop.review.Review" %> 
<%@ page import="com.itwill.shop.review.ReviewService" %> 
<%@ page import="java.util.Date" %>


<%
	ReviewService reviewService = new ReviewService();
    ProductService productService = new ProductService();
    Product product = productService.productDetail(1);
    
    CustomerService customerService = new CustomerService();
    Customer customer = customerService.findCustomerNo(1);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰 등록</title>
    <style>
     .star {
            font-size: 15px;
            cursor: pointer;
            color: lightgray; /* 기본 색상 */
        }
        .star.checked {
            color: gold; /* 선택된 색상 */
        }</style>
</head>
<body>

<h1>리뷰 등록</h1>

<form id="reviewForm" action="review_insert_action.jsp" method="post">
   <input type="hidden" name="productNo" value="<%= product.getProductNo() %>">
<input type="hidden" name="customerNo" value="<%= customer.getCustomerNo() %>">
    <div>
        <label for="reviewTitle">리뷰 제목:</label>
        <input type="text" id="reviewTitle" name="reviewTitle" value="" required>
    </div>
    <div>
        <label for="reviewTitle">상품명:<%= product.getProductName()%>(<%= product.getProductDesc()%>)</label>
    </div>
    
<div id="star-rating">

    <span class="star" data-value="1">★</span>
    <span class="star" data-value="2">★</span>
    <span class="star" data-value="3">★</span>
    <span class="star" data-value="4">★</span>
    <span class="star" data-value="5">★</span>
</div>
<input type="hidden" id="reviewRating" name="reviewRating" value="0">

<script>
    const stars = document.querySelectorAll('.star');
    const ratingInput = document.getElementById('reviewRating');
    
    stars.forEach(star => {
        star.addEventListener('click', () => {
            const rating = star.getAttribute('data-value');

            // 선택된 별점 설정
            ratingInput.value = rating;

            // 별점 표시 업데이트
            stars.forEach(s => {
                s.classList.remove('checked');
                if (s.getAttribute('data-value') <= rating) {
                    s.classList.add('checked');
                }
            });
        });
    });
    reviewForm.addEventListener('submit', (event) => {
        if (ratingInput.value === "0") {
            event.preventDefault(); // 폼 제출 중단
            alert('별점을 선택해 주세요.'); // 경고 메시지 표시
        }
    });
</script>
    <div>
        <label for="reviewContent">리뷰 내용:</label>
        <textarea id="reviewContent" name="reviewContent" required></textarea>
    </div>
     <div>
            <label for="reviewImage">이미지 첨부:</label>
            <input type="file" id="reviewImage" name="reviewImage" accept="image/*" >
        </div>

    <div>
        <input type="submit" value="등록">
        <a href="review_detail.jsp">취소</a>
    </div>
</form>

</body>
</html>
