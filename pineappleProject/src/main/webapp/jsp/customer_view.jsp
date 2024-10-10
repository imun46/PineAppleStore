<%@page import="com.itwill.shop.review.Review"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.orders.OrdersItems"%>
<%@page import="com.itwill.shop.orders.Orders"%>
<%@page import="com.itwill.shop.coupon.Coupon"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.customer.CustomerCoupons"%>
<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  	<!-- 로그인 체크 (세션 값 들어와 있는지 확인) -->
  	<%@ include file="../includes/login_check.jspf" %>  
<%	




response.setContentType("text/html; charset=UTF-8");

CustomerService customerService = new CustomerService();

/*customer서비스에서 findcustomerNoListAll(매개변수 int)값이 때문에   */
// String을 int로 바꿔서 출력
int customerNo = Integer.parseInt(sCustomerNo); 
		
		Customer customer =  customerService.findCustomerNoListAll(customerNo);

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
        location.href = 'modify_form.jsp';
    }

    function customerDelete() {
        // confirm 창에서 확인을 누르면 true, 취소를 누르면 false 반환
        if (window.confirm("정말 탈퇴하시겠습니까?")) {
            // 확인을 눌렀을 때만 폼을 제출하도록 한다
            document.f.action = "customer_delete_action.jsp";
            document.f.method = 'POST';
            document.f.submit();
        } else {
            // 취소를 누르면 아무 동작도 하지 않고 페이지에 머무름
            return false;
        }
    }
</script>
</head>
<body>


<jsp:include page="../includes/include_top_menu.jsp" />
<!-- 파인애플 상단의 메뉴 -->


<!-- 해당 메뉴 이름-->
	<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">회원가입</h1>
            <p class="lead fw-normal text-white-50 mb-0">어세오세욤 :)</p>
        </div>
    </div>
</header>
		

    <div class="container">
    <div class="section">
        <h2>고객 정보</h2>
        <div class="info">
            <p>이름: <%=customer.getCustomerName() %></p>
            <p>생년월일: <%=customer.getCustomerDob() %></p>
            <p>성별: <%=customer.getCustomerGender() %></p>
            <p>주소: <%=customer.getCustomerAddress() %></p>
            <p>이메일: <%=customer.getCustomerEmail() %>
            <p>전화번호: <%=customer.getCustomerPhone() %></p>
            <p>닉네임: <%=customer.getCustomerNickname() %></p>
          <form name="f" method="POST" action="customer_delete_action.jsp">
         <button type="button" onClick="customerModifyForm()">수정</button>
   		<button type="button" onClick="customerDelete()">계정 삭제</button>
    </form>

        </div>
    </div>

    <div class="section">
        <h2>쿠폰 정보 </h2>
        <div class="scroll-section">
        <% List<CustomerCoupons> customerCouponList = customer.getCustomerCouponList(); %>
        	<%if(customerCouponList !=null){ %>
        	<%for(CustomerCoupons customerCoupons: customerCouponList){ %>
            <% Coupon couponList = customerCoupons.getCoupon();%>
            <div class="list-item">
            쿠폰 번호:<%=customerCoupons.getCustomerCouponsNo() %>
            <br>
            쿠폰 일련번호:<%=couponList.getCouponId() %>
            <br>
            쿠폰 사용여부:<%=customerCoupons.getCustomerCouponsStatus() %>
             <br>
            쿠폰 종료날짜<%=customerCoupons.getCustomerCouponsEnddate() %>
            <br>
            쿠폰 할인율:<%=couponList.getCouponName() %>
            </div>
            <%} %>
            <%} %>
            
            
        </div>
    </div>

    <div class="section">
        <h2>주문 정보 <button  class="btn-style">더보기</button> </h2>
        <div class="scroll-section">
        <% List<Orders> orderList = customer.getOrdersList(); %>
        
        
        <% for(Orders orders:orderList){ %>
      <% List<OrdersItems> ordersItems = orders.getOrdersItemsList(); %>
        <% for(OrdersItems orderItem : ordersItems){ %>
         		
            <%} %>
        
            <div class="list-item">
            주문번호 : <%=orders.getOrdersNo() %>
            <br>
            주문 총 개수 : <%=orders.getOrdersTotqty() %>
            <br>
            주문 총 금액 :<%=orders.getOrdersFinalprice() %>
            <br>
            주문 주소 : <%=orders.getOrdersAddress() %>
            <br>
            주문 상태 :<%=orders.getOrdersStatus() %>
            <br>
            주문 도착날짜 :<%=orders.getOrdersArrivaldate() %>
            <br>
            주문한 날짜 :<%=orders.getOrdersDate() %>
            <br>
            </div>
            <%} %>
            <div class="list-item">주문 4 - 2024.09.15 - 상품 D</div>
            <div class="list-item">주문 5 - 2024.09.05 - 상품 E</div>
        </div>
    </div>

	<div class="section">
        <h2>리뷰 정보 <a class="a-style" href="review_mypage_form.jsp" >더보기</a> </h2>	           
        <div class="scroll-section">
        <%List<Review> customerReviewList = customer.getReviewList(); %>
        <%for(Review review:customerReviewList) { %>
        
            <div class="list-item">
            
            리뷰 번호 :<%=review.getReviewNo() %>
            <br>
            리뷰 제목 :<%=review.getReviewTitle() %>
            <br>
            리뷰 설명 :<%=review.getReviewContent() %>
            <br>
            리뷰 별점 :<%=review.getReviewRating() %>
            
            <br>
            </div>
            <br>
            <%} %>
            <div class="list-item">주문 3 - 2024.09.20 - 상품 C</div>
            <div class="list-item">주문 4 - 2024.09.15 - 상품 D</div>
            <div class="list-item">주문 5 - 2024.09.05 - 상품 E</div>
        </div>
    </div>
</div>
</body>
</html>