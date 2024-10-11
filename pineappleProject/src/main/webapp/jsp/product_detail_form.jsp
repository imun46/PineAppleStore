<%@page import="com.itwill.shop.service.ReviewService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.itwill.shop.domain.Product"%>
<%@ page import="com.itwill.shop.service.ProductService"%>
<%@ page import="com.itwill.shop.domain.ProductOption"%>
<%@ page import="com.itwill.shop.domain.ProductOptionDetail"%>
<%@ page import="com.itwill.shop.domain.ProductImage"%>
<%@ page import="com.itwill.shop.domain.Review"%>
<%@ page import="java.util.List"%>


<%
java.text.DecimalFormat decimalFormat = new java.text.DecimalFormat("#,###");

String productNoStr = request.getParameter("product_no");
if (productNoStr == null || productNoStr.equals("")) {
	response.sendRedirect("index.jsp");
	return;
}
int productNo = -1;

if (productNoStr != null) {
	try {
		productNo = Integer.parseInt(productNoStr);
	} catch (NumberFormatException e) {
		out.println("<h3>Invalid product number</h3>");
		return;
	}
}

// Use ProductService to fetch product details
ProductService productService = new ProductService();
Product product = productService.productDetail(productNo);
ReviewService reviewService = new ReviewService();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>상품 상세페이지</title>
	
	<!-- External CSS -->
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/css/styles.css" />
	<link rel="stylesheet" href="../css/customer_view.css"> <!-- 리뷰 css 대현추가 -->
	<style type="text/css">
		.review-container {        
            display: block; 
            text-decoration: none;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px 0;
            color: inherit;
        }
	</style>
</head>
<body>
	<jsp:include page="../includes/include_top_menu.jsp" />

	<%
	product = productService.productDetail(productNo);

	// If product is null, show an error message
	if (product == null) {
		out.println("<h3>판매 중인 제품이 아닙니다.</h3>");
		return;
	}

	List<ProductImage> images = product.getProductImageList();
	List<ProductOption> options = product.getProductOptionList();
	%>

	<!-- Form to handle options and submit -->
	<form id="productForm" method="POST">
		<input type="hidden" name="product_no" value="<%=productNo%>" />
		<input type="hidden" name="cart_qty" value=1 />

		<div class="container mt-5">
			<!-- Product Information -->
			<div class="row">
				<div class="col-md-6">
					<!-- Product Image -->
					<div id="product-image">
						<img src="../img/macBookAir.jpg" alt="Product Image"
							class="img-fluid" />
					</div>
				</div>

				<div class="col-md-6">
					<!-- Product Details -->
					<h1 class="display-5 fw-bold"><%=product.getProductName()%></h1>
					<p class="lead" style="font-size: 22px"><%=decimalFormat.format(product.getProductPrice())%>원
					</p>
					<p class="text-muted">
						카테고리:
						<%=product.getProductCategory()%></p>
					<p><%=product.getProductDesc()%></p>
					<!-- Product Options (e.g., Size, Color) -->
					<div id="product-options" class="mt-4">
						<%
						if (product.getProductOptionList().size() != 0) {
						%>
						<h5 class="fw-bold">옵션</h5>
						<%
						}
						%>

						<%
						for (ProductOption option : options) {
						%>
						<div class="option-item mb-3">
							<!-- Dropdown for each option type 모델, 색상, 사이즈-->
							<h6 style="margin: 7px 0;"><%=option.getProductOptionType()%></h6>
							
							<select name="product_option_datail_no" value="<%=option.getProductOptionNo()%>"
								class="form-select option-select"
								data-price="<%=product.getProductPrice()%>"
								onchange="updatePrice()" required>
								<option value="0" data-price="0">옵션 선택</option>
								<%
								for (ProductOptionDetail detail : option.getProductOptionDetailList()) {
								%>
								<option value="<%=detail.getProductOptionDetailNo()%>"
									data-price="<%=detail.getProductOptionDetailPrice()%>">
									<%=detail.getProductOptionDetailName()%> (+
									<%=decimalFormat.format(detail.getProductOptionDetailPrice())%>원)
								</option>
								<%
								}
								%>
							</select>
						</div>
						<%
						}
						%>
					</div>

					<div class="mt-3">
						<h3 class="fw-bold">
							총 가격: <span id="total-price"><%=decimalFormat.format(product.getProductPrice())%></span>원
						</h3>
					</div>

					<!-- Add to Cart and Purchase Buttons -->
					<div class="mt-4">
						<button type="button" class="btn btn-primary btn-lg"
							onclick="submitForm('cart')">장바구니</button>
						<button type="button" class="btn btn-primary btn-lg"
							onclick="submitForm('order')">구매하기</button>
					</div>
				</div>
			</div>

			<!-- Product Detail -->
			<div style="display: flex; justify-content: center;">
			    <img alt="" src="../img/product_datail_page.png" style="max-width: 100%; height: auto;">
			</div>
			
			<!-- Customer Reviews Section -->
			<div class="section">
        <h2>리뷰 정보 <button class="btn-style" onclick="location.href='review_mypage_form.jsp'">더보기</button></h2>	           
        
            <div class="list-item">
                <% List<Review> reviewList = reviewService.findReviewByProductNo(productNo); %>
                <%
                int maxReviews = 3; // 최대 리뷰 수
                int reviewCount = 0;
                for(Review review:reviewList) {
                    if (reviewCount >= maxReviews) break;
                    Date reviewDate = review.getReviewDate(); // 리뷰 날짜를 가져옵니다.
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 형식으로 포맷을 설정합니다.
                    String formattedDate = dateFormat.format(reviewDate); // 날짜를 포맷합니다.
                %>      
                
                <a href="review_detail.jsp?reviewNo=<%=review.getReviewNo()%>" class="review-container a">
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
                    <% } %>
                    <div class="review-body">
                        <%=review.getReviewContent() %>
                    </div>
                    <% if(review.getReviewImage() != null) { %>
                        <img src="<%=review.getReviewImage() %>" alt="My Image">
                    <% } %>
                    <div class="review-date">
                        작성일 : <%= formattedDate %>
                    </div>
                    <div class="review-author">
                        작성자 : <%=review.getCustomer().getCustomerName() %>
                    </div>
                </a>    
                <%
                    reviewCount++;    
                } %>           
                </div>                       
            
        </div>
		</div>
	</form>

	<!-- JavaScript to handle form submission -->
	<script>
		function updatePrice() {
			var basePrice = parseInt(
	<%=product.getProductPrice()%>
		);
			var totalPrice = basePrice;

			var selects = document.querySelectorAll('.option-select');
			selects.forEach(function(select) {
				var selectedOption = select.options[select.selectedIndex];
				var optionPrice = parseInt(selectedOption
						.getAttribute('data-price')) || 0;
				totalPrice += optionPrice;
			});

			document.getElementById('total-price').innerText = totalPrice
					.toLocaleString();
		}
		function submitForm(action) {
			var form = document.getElementById('productForm');
			// 장바구니 또는 구매 여부를 서버에 전송
			if (action === 'cart') {
				form.action = 'cart_insert_action.jsp';
				form.method = 'POST'
				form.submit();
			} else if (action === 'order') {
				form.action = 'orders_ready_action.jsp';
				form.method = 'POST'
				form.submit();
			}
			form.submit();
		}
	</script>

	<!-- External JS -->
	<script src="<%=request.getContextPath()%>/js/scripts.js"></script>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
