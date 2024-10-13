<%@page
	import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="com.itwill.shop.domain.Product"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.domain.Review"%>
<%@page import="com.itwill.shop.service.ReviewService"%>
<%@page import="java.util.Date"%>

<%
if (request.getMethod().equals("GET")) {
	response.sendRedirect("review_mypage_form.jsp");
	return;
}
ReviewService reviewService = new ReviewService();
String reviewNo = request.getParameter("reviewNo");
String productNo = request.getParameter("productNo");
String customerNo = request.getParameter("customerNo");
Review review = reviewService.findReviewByReviewNo(Integer.parseInt(reviewNo));
Product product = review.getProduct();
%>

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../includes/include_top_menu.jsp"></jsp:include>


<!-- 해당 메뉴 이름-->
<header class="bg-dark py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="text-center text-dark">
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
}

.custom-file-upload {
	display: inline-block;
	padding: 5px 20px;
	cursor: pointer;
	background-color: #007BFF; /* 버튼 색상 */
	color: white; /* 글자 색상 */
	border-radius: 5px; /* 모서리 둥글게 */
	border: none; /* 테두리 없애기 */
}

.custom-file-upload:hover {
	background-color: #0056b3; /* 호버 시 색상 변화 */
}

#reviewImage {
	display: none; /* 원래 파일 입력 숨기기 */
}

.update-btn {
	text-decoration: none; /* 밑줄 제거 */
	display: inline-block;
	padding: 10px 20px;
	cursor: pointer;
	 background-color: transparent; /* 배경색 투명 */
	 color: #212529; /* 버튼 텍스트 색상 */
	border-radius: 5px; /* 모서리 둥글게 */
	border: 1px solid #212529; /* 버튼 경계 색상 */
	transition: background-color 0.3s, color 0.3s;
	margin-left: 10px;
}

.update-btn:hover {
	color: #fff; /* 호버 시 텍스트 색상 */
	background-color: #212529; /* 호버 시 배경색 */
	border-color: #212529; /* 호버 시 경계 색상 */
}

.update-btn:focus {
	outline: none; /* 포커스 시 외곽선 제거 */
	box-shadow: 0 0 0 0.2rem rgba(33, 37, 41, 0.5); /* 포커스 시 그림자 효과 */
}

.update-btn:active {
	color: #fff; /* 클릭 시 텍스트 색상 */
	background-color: #212529; /* 클릭 시 배경색 */
	border-color: #212529; /* 클릭 시 경계 색상 */
}


.update-btn-container {
	display: flex; /* 플렉스 박스 사용 */
	justify-content: flex-end; /* 오른쪽 정렬 */
	/* 수정 했는데 바꿀꺼면 바꾸기 */
	margin-top: -70px; /* 위쪽 여백 */
}
</style>
</head>
<body>


	<form id="reviewForm" action="/upload" method="POST"
		enctype="multipart/form-data">
		<input type="hidden" name="reviewNo"
			value="<%=review.getReviewNo()%>"> <input type="hidden"
			name="productNo" value="<%=review.getProduct().getProductNo()%>">
		<input type="hidden" name="customerNo"
			value="<%=review.getCustomer().getCustomerNo()%>">

		<div>
			<label for="reviewProductOption">상품명 : <%=review.getProduct().getProductName()%></label>
		</div>
		<div>
			<label for="reviewTitle">제목</label>
		</div>
		<div>
			<input type="text" id="reviewTitle" name="reviewTitle"
				value="<%=review.getReviewTitle()%>" required
				style="margin-left: 10px;">
		</div>


		<div id="star-rating">
			별점: <span class="star" data-value="1">★</span> <span class="star"
				data-value="2">★</span> <span class="star" data-value="3">★</span> <span
				class="star" data-value="4">★</span> <span class="star"
				data-value="5">★</span>
		</div>
		<input type="hidden" id="reviewRating" name="reviewRating"
			value="<%=review.getReviewRating()%>" required>

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
		</div>
		<div>
			<textarea id="reviewContent" name="reviewContent" required
				style="width: 100%; height: 300px; resize: none;"><%=review.getReviewContent()%>
   </textarea>
		</div>

		<label for="reviewImage" class="update-btn">사진 첨부하기</label> <input
			type="file" id="reviewImage" name="reviewImage" accept="image/*">
		<div style="text-align: right;">
			<label for="reviewDate">작성(최종수정)일 : <%=new SimpleDateFormat("yyyy-MM-dd").format(review.getReviewDate())%></label>
		</div>
		<div class="update-btn-container">
			<input type="submit" class="update-btn" value="수정"> <a
				href="review_detail.jsp?reviewNo=<%=review.getReviewNo()%>"
				class="update-btn">취소</a>
		</div>
	</form>

</body>
</html>
