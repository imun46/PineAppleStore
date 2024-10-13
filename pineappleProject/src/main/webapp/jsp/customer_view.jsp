<%@page import="org.springframework.boot.web.servlet.server.Jsp"%>
<%@page import="com.itwill.shop.service.ReviewService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.domain.Review"%>
<%@page import="com.itwill.shop.domain.Product"%>
<%@page import="com.itwill.shop.domain.OrdersItems"%>
<%@page import="com.itwill.shop.domain.Orders"%>
<%@page import="com.itwill.shop.domain.Coupon"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.domain.CustomerCoupons"%>
<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@page import="com.itwill.shop.service.CustomerCouponsService"%>
<%@page import="com.itwill.shop.service.OrdersService"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="customer_login_check.jspf"%>


<%
ReviewService reviewService = new ReviewService();
response.setContentType("text/html; charset=UTF-8");

CustomerService customerService = new CustomerService();
OrdersService ordersService = new OrdersService();
CustomerCouponsService customerCouponsService = new CustomerCouponsService();

int customerNo = Integer.parseInt(sCustomerNo);
Customer customer = customerService.findCustomerByNo(customerNo);

/*** 날짜 포맷 설정 ***/
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
List<CustomerCoupons> customerCouponList = customerCouponsService.findCustomerCouponsListALL(customerNo);
List<Orders> orderList = ordersService.findByCustomerNo(customerNo);

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/customer_view.css">
<title>회원 마이페이지</title>

<!--css start  -->
<style type="text/css">
/* 공통 스타일 */
/* 공통 스타일 */
.container {
	width: 768px;
	margin: 0 auto;
	padding: 20px;
}

.section {
	text-align: left;
	margin-bottom: 30px;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	background-color: #fff;
}

h2 {
	margin-bottom: 20px;
	font-size: 22px;
	font-weight: bold;
	color: #333;
}

/* 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
}

table th, table td {
	padding: 12px;
	border: 1px solid #dadada;
	text-align: left;
}

table th {
	background-color: #f1f1f1;
	font-weight: bold;
	font-size: 16px;
	color: #555;
}

table td {
	font-size: 14px;
	color: #333;
	vertical-align: middle;
}

/* 버튼 스타일 */
.btn-style {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	font-weight: bold;
	color: #212529; /* 텍스트 색상 */
	background-color: transparent; /* 배경 색상 */
	border: 1px solid #212529; /* 버튼 경계 색상 */
	border-radius: 5px; /* 모서리 둥글게 */
	text-align: center;
	text-decoration: none; /* 링크 밑줄 없애기 */
	cursor: pointer; /* 마우스 포인터 변경 */
	transition: background-color 0.3s; /* 배경색 변화 애니메이션 */
	margin-right: 10px;
}

.btn-style:hover {
	color: #fff; /* 호버 시 텍스트 색상 */
	background-color: #212529; /* 호버 시 배경색 */
	border-color: #212529; /* 호버 시 경계 색상 */
}

.btn-style:focus {
	outline: none; /* 포커스 시 외곽선 제거 */
	box-shadow: 0 0 0 0.2rem rgba(33, 37, 41, 0.5); /* 포커스 시 그림자 효과 */
}

.btn-style:active {
	color: #fff; /* 클릭 시 텍스트 색상 */
	background-color: #212529; /* 클릭 시 배경색 */
	border-color: #212529; /* 클릭 시 경계 색상 */
}

/* 고객 정보 테두리 */
.info {
	border: 1px solid #ccc; /* 테두리 색상 및 두께 */
	border-radius: 5px; /* 모서리 둥글게 */
	padding: 15px; /* 내부 여백 */
	background-color: #fff; /* 배경 색상 */
	margin-top: 10px; /* 상단 간격 */
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	text-align: center;
}

/* 리뷰 섹션 스타일 */
.review-container {
	display: block; /* 블록 요소로 설정하여 각 리뷰를 한 줄에 하나씩 표시 */
	width: 900px; /* 카드 너비 조정 */
	margin: 10px; /* 카드 간격 조정 */
	padding: 10px; /* 카드 내부 여백 */
	border: 1px solid #ccc; /* 카드 테두리 */
	border-radius: 5px; /* 모서리 둥글게 */
	background-color: #fff; /* 배경색 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	transition: all 0.3s ease; /* 호버 효과 부드럽게 전환 */
	position: relative; /* 자식 객체들 위치 조정 */
}

.review-container:hover {
	transform: scale(1.02); /* 호버 시 약간 확대 */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 강조 */
}

.review-title {
	font-size: 1.1em; /* 제목 크기 조정 */
	margin: 5px 0; /* 제목 상하 여백 조정 */
}

.review-body {
	font-size: 0.9em; /* 본문 크기 조정 */
	margin: 5px 0; /* 본문 상하 여백 조정 */
}

.review-date {
	position: absolute;
	right: 10px; /* 오른쪽 끝으로 이동 */
	bottom: 10px;
	font-size: 0.8em; /* 날짜 및 작성자 크기 조정 */
	color: #555; /* 글자색 조정 */
}

.review-author {
	position: absolute;
	right: 135px; /* 오른쪽 끝으로 이동 */
	bottom: 10px;
	font-size: 0.8em; /* 날짜 및 작성자 크기 조정 */
	color: #555; /* 글자색 조정 */
}

.review-rating {
	color: #ffcc00;
	margin: 10px 0;
}

/* 카드 컨테이너 스타일 */
.card-container {
	display: flex;
	flex-wrap: wrap; /* 카드들이 줄바꿈하도록 설정 */
	gap: 16px; /* 카드 사이의 간격 */
}

.card {
	background-color: #fff; /* 카드 배경색 */
	border: 1px solid #ddd; /* 카드 테두리 */
	border-radius: 8px; /* 모서리 둥글게 */
	padding: 16px; /* 카드 안쪽 여백 */
	transition: transform 0.3s, box-shadow 0.3s; /* 호버 효과 시 애니메이션 */
	width: calc(50% - 16px); /* 카드의 너비를 50%로 설정하고 여백 차감 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

.card:hover {
	transform: translateY(-4px); /* 호버 시 카드가 약간 올라오는 효과 */
	background-color: #f9f9f9;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 강화 */
}

.card.empty {
	background-color: #f9f9f9; /* 빈 카드 배경색 */
	border: 1px dashed #ccc; /* 빈 카드 테두리 스타일 */
	text-align: center; /* 텍스트 중앙 정렬 */
}

.card h3 {
	margin: 0 0 8px; /* 제목 여백 조정 */
}

.card p {
	margin: 4px 0; /* 문단 여백 조정 */
}

/* 리뷰 섹션 스크롤 설정 */
.scroll-section {
	max-height: 350px; /* 최대 높이를 350px로 설정 */
	overflow-y: auto; /* 수직 스크롤 가능하게 설정 */
	padding: 10px; /* 내부 여백 추가 */
	border: 1px solid #ccc; /* 테두리 추가 */
	border-radius: 5px; /* 모서리 둥글게 */
	background-color: #f9f9f9; /* 배경색 */
	margin-top: 10px; /* 위쪽 여백 추가 */
	display: flex; /* 플렉스 박스 사용 */
	flex-wrap: wrap; /* 여러 줄로 감싸기 */
	gap: 10px; /* 리뷰 간의 간격 */
}

.list-item {
	flex: 1 1 calc(33.33% - 10px); /* 각 항목의 너비 설정 */
	box-sizing: border-box; /* 패딩과 테두리를 포함한 전체 너비 계산 */
	margin-bottom: 10px; /* 아래쪽 여백 추가 */
	background-color: #fff; /* 각 리뷰 카드의 배경색 */
	padding: 10px; /* 내부 여백 */
	border-radius: 5px; /* 모서리 둥글게 */
}

.a {
	color: black;
	text-decoration: none;
}

<!--
css
 
End
  
-->
</style>

<script type="text/javascript">
	function customerModifyForm() {
		location.href = 'customer_modify_form.jsp';
	}

	function customerCouponInsert() {
		// 쿠폰 팝업창 정중앙으로 나오게 하기
		 var width = 600;
		    var height = 400;
		    var left = (window.innerWidth / 2) - (width / 2);
		    var top = (window.innerHeight / 2) - (height / 2);
		    
		    popupWindow = window.open("customer_coupon_insert_form.jsp",
		        "popupWindow", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",scrollbars=yes");
	}
	// 부모 창 새로 고침
	function refreshParent() {
		window.location.reload();
	}
	function customerDelete() {
		if (window.confirm("정말 탈퇴하시겠습니까?")) {
			document.f.action = "customer_delete_action.jsp";
			document.f.method = 'POST';
			document.f.submit();
		}
	}
</script>
</head>
<body>
	<jsp:include page="../includes/include_top_menu.jsp"></jsp:include>
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-dark">
				<h1 class="display-4 fw-bolder">유저 정보</h1>
				<p class="lead fw-normal text-dark mb-0">어서오세욤 :)</p>
			</div>
		</div>
	</header>

	<!-- 고객 정보 섹션 -->
	<div class="container">
		<div class="section">
			<h2>고객 정보</h2>
			<div class="info">
				<p>
					이름:
					<%=customer.getCustomerName()%></p>
				<p>
					생년월일:
					<%=simpleDateFormat.format(customer.getCustomerDob())%></p>
				<p>
					성별:
					<%=customer.getCustomerGender().equals("M") ? "남자" : "여자" %></p>
				<p>
					주소:
					<%=customer.getCustomerAddress()%></p>
				<p>
					이메일:
					<%=customer.getCustomerEmail()%></p>
				<p>
					전화번호:
					<%=customer.getCustomerPhone()%></p>
				<p>
					닉네임:
					<%=customer.getCustomerNickname()%></p>
				<form name="f" method="POST" action="customer_delete_action.jsp">
					<button class="btn-style" type="button"
						onClick="customerModifyForm()">정보 수정</button>
					<button class="btn-style" type="button" onClick="customerDelete()">계정
						삭제</button>
				</form>
			</div>
		</div>

		<!-- 쿠폰 정보 섹션 -->
		<div class="section">
			<h2>
				쿠폰 정보
				<button class="btn-style" onClick="customerCouponInsert()">쿠폰
					등록</button>
			</h2>
			<div class="card-container">
				<%
				if (customerCouponList != null && !customerCouponList.isEmpty()) {
					for (CustomerCoupons customerCoupons : customerCouponList) {
						Coupon couponList = customerCoupons.getCoupon();
				%>
				<div
					class="card <%="사용불가".equals(customerCoupons.getCustomerCouponsStatus()) ? "hidden" : ""%>">
					<h3><%=couponList.getCouponName()%></h3>
					<p>
						<strong>쿠폰 일련번호:</strong>
						<%=couponList.getCouponId()%></p>
					<p>
						<strong>사용 여부:</strong>
						<%=customerCoupons.getCustomerCouponsStatus()%></p>

					<p>
						<strong>종료 날짜:</strong>
						<%=simpleDateFormat.format(customerCoupons.getCustomerCouponsEnddate())%></p>
				</div>
				<%
				}
				} else {
				%>
				<div class="card empty">
					<p>쿠폰 정보가 없습니다.</p>
				</div>
				<%
				}
				%>
			</div>
			<!-- 카드 컨테이너 끝 -->
		</div>
		<!-- 쿠폰 정보 섹션 끝 -->

		<!-- 주문 정보 섹션 -->
		<div class="section">
			<h2>
				주문 정보
				<button class="btn-style"
					onclick="location.href='order_list_form.jsp'">더보기</button>
			</h2>
			<div class="card-container">
			<%
			if (orderList != null && !orderList.isEmpty()) {
				int maxOrders = 4;
				int orderCount = 0;
				for (Orders orders : orderList) {
					if (orderCount >= maxOrders)
				break;
			%>
			<div class="card">
				<h3>
					주문 번호:
					<%=orders.getOrdersNo()%></h3>
				<p>
					<strong>총 개수:</strong>
					<%=orders.getOrdersTotqty()%></p>
				<p>
					<strong>총 금액:</strong>
					<%
					java.text.DecimalFormat decimalFormat = new java.text.DecimalFormat("#,###");
                    String price = decimalFormat.format(orders.getOrdersFinalprice());
					%>
					<%=price %>원</p>
				<p>
					<strong>주소:</strong>
					<%=orders.getOrdersAddress()%></p>
				<p>
					<strong>상태:</strong>
					<%=orders.getOrdersStatus()%></p>
				<p>
					<strong>도착 날짜:</strong>
					<%=simpleDateFormat.format(orders.getOrdersArrivaldate())%></p>
				<p>
					<strong>주문 날짜:</strong>
					<%=simpleDateFormat.format(orders.getOrdersDate())%></p>
			</div>
			<%
			orderCount++;
			}
			} else {
			%>
			<div class="card empty">
				<p>주문 정보가 없습니다.</p>
			</div>
			<%
			}
			%>
		</div>
		</div>
		<!-- 주문 정보 섹션 끝 -->

		<!-- 리뷰 정보 섹션 -->

		<div class="section">
			<h2>
				리뷰 정보
				<button class="btn-style"
					onclick="location.href='review_mypage_form.jsp'">더보기</button>
			</h2>

			<div class="card-container">
				<%
				List<Review> reviewList = reviewService.findReviewByCustomerNo(customerNo);
				int maxReviews = 4; // 최대 리뷰 수
				int reviewCount = 0;

				for (Review review : reviewList) {
					if (reviewCount >= maxReviews)
						break;
					Date reviewDate = review.getReviewDate(); // 리뷰 날짜를 가져옵니다.
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 형식으로 포맷을 설정합니다.
					String formattedDate = dateFormat.format(reviewDate); // 날짜를 포맷합니다.
				%>

				<a href="review_detail.jsp?reviewNo=<%=review.getReviewNo()%>"
					class="card a">
					<h2 class="review-title"><%=review.getReviewTitle()%></h2>
					<div class="review-product-option">
						<%=review.getProduct().getProductName()%>
						<%
						int rating = review.getReviewRating();
						for (int i = 0; i < 5; i++) {
						%>
						<span class="review-rating"> <%=(i < rating) ? "★" : "☆"%>
						</span>
						<%
						}
						%>
					</div>
					<div class="review-body">
						<%=review.getReviewContent()%>
					</div> <%
 if (review.getReviewImage() != null) {
 %> <img
					class="review-image" src="../img/<%=review.getReviewImage()%>"
					alt="My Image" style="width: 100px; height: auto"> <%
 }
 %>
					<div class="review-date">
						작성일 :
						<%=formattedDate%>
					</div>
					<div class="review-author">
						작성자 :
						<%=customer.getCustomerName()%>
					</div>
				</a>
				<%
				reviewCount++;
				}
				%>

				<%
				if (reviewCount == 0) {
				%>
				<!-- 리뷰가 없는 경우 -->
				<div class="card empty">
					<p>주문 정보가 없습니다.</p>
				</div>
				<%
				}
				%>

			</div>
		</div>
		<!-- 리뷰 정보 섹션 끝 -->
</body>
</html>
