<%@page import="com.itwill.shop.review.ReviewService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.review.Review"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.orders.OrdersItems"%>
<%@page import="com.itwill.shop.orders.Orders"%>
<%@page import="com.itwill.shop.coupon.Coupon"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.customer.CustomerCoupons"%>
<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="jsp/includes/login_check.jspf" %>

<%
ReviewService reviewService = new ReviewService();
response.setContentType("text/html; charset=UTF-8");

CustomerService customerService = new CustomerService();

int customerNo = Integer.parseInt(sCustomerNo);
Customer customer = customerService.findCustomerNoListAll(customerNo);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="customer_view.css">
    <link rel="stylesheet" href="jsp/styles.css">
    <title>회원 마이페이지</title>
    <script type="text/javascript">
        function customerModifyForm() {
            location.href = 'customer_modify_view.jsp';
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

<jsp:include page="jsp/includes/include_top_menu.jsp" />

<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">유저 정보</h1>
            <p class="lead fw-normal text-white-50 mb-0">어세오세욤 :)</p>
        </div>
    </div>
</header>

<!-- 고객 정보 섹션 -->
<div class="container">
    <div class="section">
        <h2>고객 정보</h2>
        <div class="info">
            <p>이름: <%=customer.getCustomerName() %></p>
            <p>생년월일: <%=customer.getCustomerDob() %></p>
            <p>성별: <%=customer.getCustomerGender() %></p>
            <p>주소: <%=customer.getCustomerAddress() %></p>
            <p>이메일: <%=customer.getCustomerEmail() %></p>
            <p>전화번호: <%=customer.getCustomerPhone() %></p>
            <p>닉네임: <%=customer.getCustomerNickname() %></p>
            <form name="f" method="POST" action="customer_delete_action.jsp">
                <button class="btn-style" type="button" onClick="customerModifyForm()">수정</button>
                <button class="btn-style" type="submit" onClick="customerDelete()">계정 삭제</button>
            </form>
        </div>
    </div>

    <!-- 쿠폰 정보 섹션 -->
    <div class="section">
        <h2>쿠폰 정보</h2>
        <div class="card-container">
            <% 
            List<CustomerCoupons> customerCouponList = customer.getCustomerCouponList();
            if(customerCouponList != null && !customerCouponList.isEmpty()) {
                for(CustomerCoupons customerCoupons : customerCouponList) {
                    Coupon couponList = customerCoupons.getCoupon();
            %>
                    <div class="card <%= "사용불가".equals(customerCoupons.getCustomerCouponsStatus()) ? "hidden" : "" %>">
                        <h3><%=couponList.getCouponName()%></h3>
                        <p><strong>쿠폰 일련번호:</strong> <%=couponList.getCouponId() %></p>
                        <p><strong>사용 여부:</strong> <%=customerCoupons.getCustomerCouponsStatus() %></p>
                        
                        <p><strong>종료 날짜:</strong> <%=customerCoupons.getCustomerCouponsEnddate() %></p>
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
        </div> <!-- 카드 컨테이너 끝 -->
    </div> <!-- 쿠폰 정보 섹션 끝 -->

    <!-- 주문 정보 섹션 -->
    <div class="section">
        <h2>주문 정보 <button class="btn-style">더보기</button></h2>
        <% 
        List<Orders> orderList = customer.getOrdersList();
        if(orderList != null && !orderList.isEmpty()) {
            int maxOrders = 3;
            int orderCount = 0;
            for(Orders orders : orderList) {
                if(orderCount >= maxOrders) break;
        %>
                <div class="card">
                    <h3>주문 번호: <%=orders.getOrdersNo() %></h3>
                    <p><strong>총 개수:</strong> <%=orders.getOrdersTotqty() %></p>
                    <p><strong>총 금액:</strong> <%=orders.getOrdersFinalprice() %></p>
                    <p><strong>주소:</strong> <%=orders.getOrdersAddress() %></p>
                    <p><strong>상태:</strong> <%=orders.getOrdersStatus() %></p>
                    <p><strong>도착 날짜:</strong> <%=orders.getOrdersArrivaldate() %></p>
                    <p><strong>주문 날짜:</strong> <%=orders.getOrdersDate() %></p>
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
    </div> <!-- 주문 정보 섹션 끝 -->

    <!-- 리뷰 정보 섹션 -->
    <div class="section">
        <h2>리뷰 정보 <button class="btn-style" href="review_mypage_form.jsp" >더보기</button> </h2>	           
        
            <div class="list-item">
                <% List<Review> reviewList = reviewService.getMyReview(customerNo); %>
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
    </div> <!-- 리뷰 정보 섹션 끝 -->
</div> <!-- 컨테이너 끝 -->

</body>
</html>
