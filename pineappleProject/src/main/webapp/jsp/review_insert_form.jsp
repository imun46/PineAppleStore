<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="com.itwill.shop.domain.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.itwill.shop.domain.Review" %> 
<%@ page import="com.itwill.shop.service.ReviewService" %> 
<%@ page import="java.util.Date" %>


<%
	ReviewService reviewService = new ReviewService();
    ProductService productService = new ProductService();
    Product product = productService.productDetail(1);
    
    CustomerService customerService = new CustomerService();
    Customer customer = customerService.findCustomerByNo(1);
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

<form id="reviewForm" action="/upload2" method="POST" enctype ="multipart/form-data">
   <input type="hidden" name="productNo" value="<%= product.getProductNo() %>">
<input type="hidden" name="customerNo" value="<%= customer.getCustomerNo() %>">
    <div>
        <label for="reviewTitle">리뷰 제목:</label>
        <input type="text" id="reviewTitle" name="reviewTitle" value="" required>
    </div>
    <div>
        <label for="reviewTitle">상품명:</label>
        <label for="reviewTitle"><%= product.getProductName()%>(<%= product.getProductDesc()%>)</label>
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
