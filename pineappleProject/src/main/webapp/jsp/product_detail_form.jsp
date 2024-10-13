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
            
        .productBtn {
	          	color: #212529; /* 버튼 텍스트 색상 */
			    border: 1px solid #212529; /* 버튼 경계 색상 */
			    background-color: transparent; /* 배경색 투명 */
			    padding: 8px 23px; /* 버튼의 패딩 */
			    cursor: pointer; /* 마우스 포인터를 손가락 모양으로 변경 */
			    font-size: 17px; /* 글자 크기 */
			    font-weight: bold; /* 글자 두께 */
			    border-radius: 5px; /* 모서리 둥글게 */
			    transition: background-color 0.3s, color 0.3s; /* 호버 시 변화 애니메이션 */
			    text-decoration: none; /* 밑줄 제거 */
        	}
		.productBtn:hover {
			    color: #fff; /* 호버 시 텍스트 색상 */
			    background-color: #212529; /* 호버 시 배경색 */
			    border-color: #212529; /* 호버 시 경계 색상 */
			}
		
		.productBtn:focus {
			    outline: none; /* 포커스 시 외곽선 제거 */
			    box-shadow: 0 0 0 0.2rem rgba(33, 37, 41, 0.5); /* 포커스 시 그림자 효과 */
			}
		
		.productBtn:active {
			    color: #fff; /* 클릭 시 텍스트 색상 */
			    background-color: #212529; /* 클릭 시 배경색 */
			    border-color: #212529; /* 클릭 시 경계 색상 */
			}
			
		.review {
			    display: flex;
			    justify-content: center; /* 버튼을 가로 중앙 정렬 */
			}
		.review > .productBtn {
				padding: 10px 30px;
			    margin: 20px 0; /* 상하 여백을 설정 */
				font-size: 20px;			    
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
	
	int optionCount = options.size();
	
	%>

	<!-- Form to handle options and submit -->
	<form id="productForm" method="POST">
		<input type="hidden" name="productNo" value="<%=productNo%>" />
		<input type="hidden" name="productName" value="<%=product.getProductName()%>" />
		<input type="hidden" name="itemsQty" value=1 />
		<input type="hidden" name="itemsPrice"/>
		<input type="hidden" name="ordersTotprice" />
		<input type="hidden" name="ordersTotqty" value=1 />
		<input type="hidden" id="itemsOptions" name="itemsOptions"/>

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
							
							<select 
								name="productOptionDetailNo" value="<%=option.getProductOptionNo()%>"
								class="form-select option-select"
								data-price="<%=product.getProductPrice()%>"
								onchange="updatePrice()" required>
								
								<option value="0" data-price="0">옵션 선택</option>
								<%
								for (ProductOptionDetail detail : option.getProductOptionDetailList()) {
								%>
								
								<option value="<%=detail.getProductOptionDetailNo()%>"
								        optionDetail="<%=detail.getProductOptionDetailName()%>"
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
						<button type="button" class="productBtn"
							onclick="submitForm('cart')">장바구니</button>
						<button type="button" class="productBtn"
							onclick="submitForm('order')">구매하기</button>
					</div>
				</div>
			</div>

			<!-- Product Detail -->
			<div style="display: flex; justify-content: center;">
			    <img alt="" src="../img/product_detail_page.png" style="max-width: 100%; height: auto;">
			</div>
			
			
			<!-- Review -->
			<!-- Customer Reviews Section -->
         	 <div class="section">
        <h2>리뷰 정보 </h2>              
        
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
                        <%=product.getProductName() %>(<%=product.getProductDesc() %>)
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
                        <img src="../img/<%=review.getReviewImage() %>" alt="My Image" style="width: 100px; height: auto">
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
                <div class="review">
                <a href="review_product_form.jsp?product_no=<%=productNoStr%>" class="productBtn">더보기</a>
                
                </div>                      
        </div>
      </div>
        
   </form>
			
		</div>
	</form>
 
	<!-- JavaScript to handle form submission -->
	<script>
		function updatePrice() {
			var basePrice = parseInt(<%=product.getProductPrice()%>);
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
			
			document.querySelector('input[name="itemsPrice"]').value = totalPrice;
			document.querySelector('input[name="ordersTotprice"]').value = totalPrice;
		}
		
		function submitForm(action) {
			var form = document.getElementById('productForm');
			
				let selectedOptions = document.querySelectorAll('.option-select');
		        let productOptions = '';
		        
		        // 옵션 선택 여부 확인
		        let allOptionsSelected = true;
		        selectedOptions.forEach(function(select) {
		            if (select.value === '0') {
		                allOptionsSelected = false;
		            }
		        });

		        // If any option is not selected, alert the user and stop form submission
		        if (!allOptionsSelected) {
		            alert('모든 옵션을 선택해주세요.');
		            return;  // Stop form submission
		        }
		        
		        //상품 옵션 문구 합쳐서 전송
		        selectedOptions.forEach(function(select) {
		            let optionName = select.options[select.selectedIndex].getAttribute('optionDetail');
		            productOptions = productOptions + optionName + ' '; // 선택한 옵션 추가
		        });
		        
			    document.querySelector('input[name="itemsOptions"]').value = productOptions.trim();
			
			    
			
			// 장바구니 또는 구매 여부를 서버에 전송
			if (action === 'cart') {
				form.action = 'cart_insert_action.jsp';
				
			} else if (action === 'order') {
				form.action = 'orders_ready_action.jsp';
			}
			
			form.method = 'POST'
			form.submit();
		}
		
		function submitFormAction(action, form) {
		    if (action === 'cart') {
		        form.action = 'cart_insert_action.jsp';
		    } else if (action === 'order') {
		        form.action = 'orders_ready_action.jsp';
		    }

		    form.method = 'POST';
		    form.submit();  // Proceed with form submission
		}
		
		function optionSeleted(id) {
		    let selectedOption = document.getElementById(id);
		    let optionName = selectedOption.options[selectedOption.selectedIndex].getAttribute('optionDetail');
		    
		    // 현재 선택된 옵션 값을 불러오기
		    let currentOptions = document.querySelector('input[name="itemsOptions"]').value;
		    
		    // 선택된 옵션 이름이 중복되지 않도록 처리
		    if (!currentOptions.includes(optionName)) {
		        if (currentOptions.length > 0) {
		            currentOptions += ', ';
		        }
		        currentOptions += optionName;
		    }


		}

		
		
	</script>

	<!-- External JS -->
	<script src="<%=request.getContextPath()%>/js/scripts.js"></script>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
