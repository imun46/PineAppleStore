<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.orders.OrdersItems"%>
<%@page import="com.itwill.shop.orders.Orders"%>
<%@page import="com.itwill.shop.coupon.Coupon"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.customer.CustomerCoupons"%>
<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%	
response.setContentType("text/html; charset=UTF-8");

CustomerService customerService = new CustomerService();

		
		Customer customer =  customerService.findCustomerNoListAll(2);

%>	
	
	

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="customer_view.css">
    <link rel="stylesheet" href="jsp/styles.css">
    <title>회원 마이페이지</title>
   
</head>
<body>


<!-- 파인애플 상단의 메뉴 -->
	<jsp:include page="jsp/includes/include_top_menu.jsp" />

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
            
        </div>
    </div>

    <div class="section">
        <h2>쿠폰 정보</h2>
        <div class="scroll-section">
        <% List<CustomerCoupons> customerCouponList = customer.getCustomerCouponList(); %>
        	<%if(customerCouponList !=null){ %>
        	<%for(CustomerCoupons customerCoupons: customerCouponList){ %>
            <% Coupon couponList = customerCoupons.getCoupon();%>
            <div class="list-item">
            쿠폰 일련번호:<%=couponList.getCouponId() %>
            <br>
            쿠폰 번호:<%=customerCoupons.getCustomerCouponsNo() %>
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
        <h2>주문 정보</h2>
        <div class="scroll-section">
        <% List<Orders> orderList = customer.getOrdersList(); %>
        
        
        <% for(Orders orders:orderList){ %>
      <% List<OrdersItems> ordersItems = orders.getOrdersItemsList(); %>
        <% for(OrdersItems orderItem : ordersItems){ %>
         		<% Product products = orderItem.getProduct(); %>
         		   <br>
         		주문 번호: <%= orderItem.getOrdersItemsNo() %>
         		   <br>
         		제품 이름:<%= products.getProductName() %>
         		   <br>
         		제품 설명:<%= products.getProductDesc() %>
        			
         
        	
            <br>
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
            
            <div class="list-item">주문 4 - 2024.09.15 - 상품 D</div>
            <div class="list-item">주문 5 - 2024.09.05 - 상품 E</div>
        </div>
    </div>
<%} %>
	<div class="section">
        <h2>리뷰 정보</h2>
        <div class="scroll-section">
            <div class="list-item">리뷰</div>
            <div class="list-item">주문 3 - 2024.09.20 - 상품 C</div>
            <div class="list-item">주문 4 - 2024.09.15 - 상품 D</div>
            <div class="list-item">주문 5 - 2024.09.05 - 상품 E</div>
        </div>
    </div>
</div>
</body>
</html>
>>>>>>> c25e15a customer_view
