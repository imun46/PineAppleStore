<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="com.itwill.shop.domain.Product"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.itwill.shop.domain.Review" %> 
<%@page import="com.itwill.shop.service.ReviewService" %> 
<%@page import="java.util.Date" %>

<%
if (request.getMethod().equals("GET")) {
	response.sendRedirect("review_mypage_form.jsp");
	return;
}
	ReviewService reviewService = new ReviewService();
    String reviewNo = request.getParameter("reviewNo");
    String productNo = request.getParameter("productNo");
    String customerNo= request.getParameter("customerNo");
    Review review = reviewService.findReviewByReviewNo(Integer.parseInt(reviewNo));
    Product product = review.getProduct();
%>

<!DOCTYPE html>
<html lang="ko">


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
    <title>리뷰 수정</title>
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


<form id="reviewForm" action="/upload" method="POST" enctype ="multipart/form-data">
    <input type="hidden" name="reviewNo" value="<%= review.getReviewNo() %>">
    <input type="hidden" name="productNo" value="<%= review.getProduct().getProductNo() %>">
    <input type="hidden" name="customerNo" value="<%= review.getCustomer().getCustomerNo() %>">
    
    <div>
        <label for="reviewTitle">리뷰 제목:</label>
        <input type="text" id="reviewTitle" name="reviewTitle" value="<%= review.getReviewTitle() %>" required>
    </div>
    
      
    <div>
    	<label for="reviewProductOption"><%=review.getProduct().getProductImageList() %><%=review.getProduct().getProductName() %>(<%=review.getProduct().getProductDesc() %>)</label>
    </div>
    
<div id="star-rating">

    <span class="star" data-value="1">★</span>
    <span class="star" data-value="2">★</span>
    <span class="star" data-value="3">★</span>
    <span class="star" data-value="4">★</span>
    <span class="star" data-value="5">★</span>
</div>
<input type="hidden" id="reviewRating" name="reviewRating" value="<%=review.getReviewRating()%>" required>

<script>
    const stars = document.querySelectorAll('.star');
    const ratingInput = document.getElementById('reviewRating');
    <!------------------별점 클릭시 색 채워짐------------------------>
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
    <!------------------별점 클릭시 색 채워짐------------------------>
    
    reviewForm.addEventListener('submit', (event) => {
        if (ratingInput.value === "0") {
            event.preventDefault(); // 폼 제출 중단
            alert('별점을 선택해 주세요.'); // 경고 메시지 표시
        }
    });
</script>
    <div>
        <label for="reviewContent">리뷰 내용:</label>
        <textarea id="reviewContent" name="reviewContent" required><%= review.getReviewContent() %></textarea>
    </div>
    
    <div>
        <label for="reviewDate">작성일:<%= new SimpleDateFormat("yyyy-MM-dd").format(review.getReviewDate()) %></label>
    </div>
 <div>
            <label for="reviewImage">이미지 첨부:</label>
            <input type="file" id="reviewImage" name="reviewImage" accept="image/*" >
        </div>
    <div>
        <input type="submit" value="수정">
        <a href="review_detail.jsp?reviewNo=<%=review.getReviewNo()%>">취소</a>
    </div>
</form>

</body>
</html>
