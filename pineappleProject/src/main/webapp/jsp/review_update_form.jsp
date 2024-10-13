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
		</div>
	</div>
</header>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
<style>

.star {
	font-size: 50px;
	cursor: pointer;
	color: lightgray; /* 기본 색상 */
}

.star.checked {
	color: gold; /* 선택된 색상 */
}
input[type="file"] {
    display: none; /* 기본 파일 업로드 버튼 숨기기 */
}

.reviewImage{
    		display: inline-block;
            width: 30%;
            padding: 10px;
            text-align: center;
            font-size: 16px;
            background-color: transparent;
            color: #212529;
            text-decoration: none;
            border: 1px solid #212529; 
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
}

.reviewImage:hover {
    color: #fff; 
	background-color: #212529; 
	border-color: #212529;
}
/* Container styling */
        .custom-form {
            width: 500px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f8f9fa;
        }
        
        /* Section title */
        h1 {
            font-size: 24px;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        
        /* Input and label styling */
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-size:19px;
        }
        
        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        
        textarea {
            height: 100px;
            resize: none;
        }
        
        /* Star rating styling */
        #star-rating {
            text-align: left;
            margin-bottom: 20px;
        }
        
        /* File upload input */
        .custom-form input[type="file"] {
            margin-bottom: 20px;
        }
        
        /* Buttons */
        .custom-form input[type="submit"],
        .custom-form a {
            display: inline-block;
            width: 48%;
            padding: 10px;
            text-align: center;
            font-size: 16px;
            background-color: transparent;
            color: #212529;
            text-decoration: none;
            border: 1px solid #212529; 
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .custom-form input[type="submit"]:hover,
        .custom-form a:hover {
            color: #fff; 
			background-color: #212529; 
			border-color: #212529; 
        }
        
        /* Form layout spacing */
        .custom-form div {
            margin-bottom: 15px;
        }
        
        /* Responsive */
        @media (max-width: 600px) {
            .custom-form {
                width: 100%;
                padding: 10px;
            }
        
            .custom-form input[type="submit"],
            .custom-form a {
                width: 100%;
            }
        }
</style>
</head>
<body>


	<form id="reviewForm" class="custom-form" action="/upload" method="POST"
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

		
		<label>별점</label>
		
		<div id="star-rating">
			<span class="star" data-value="1">★</span> <span class="star"
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
			<label for="reviewContent">리뷰 내용</label>
		</div>
		
			<textarea id="reviewContent" name="reviewContent" required
				style="width: 100%; height: 300px; resize: none;"><%=review.getReviewContent()%>
   </textarea>
		
		
		<label for="reviewImage" class="reviewImage">사진 첨부하기</label> <input
			type="file" id="reviewImage" name="reviewImage" accept="image/*">
		<div style="text-align: right;">
			<label for="reviewDate" style = "font-weight: normal;
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-size:13px;">작성(최종수정)일 : <%=new SimpleDateFormat("yyyy-MM-dd").format(review.getReviewDate())%></label>
		</div>
		<div class="update-btn-container">
			<input type="submit" class="update-btn" value="수정"> <a
				href="review_detail.jsp?reviewNo=<%=review.getReviewNo()%>"
				class="update-btn">취소</a>
		</div>
	</form>

</body>
</html>
