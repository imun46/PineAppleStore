<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.orders.Orders"%>
<%@page import="com.itwill.shop.orders.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String orderNo = request.getParameter("orders_no");
	OrdersService orderService = new OrdersService();
	List<Orders> order = orderService.findByOrderNo(Integer.parseInt(orderNo));

    String orderDate = dateFormat.format(new Date());
    String productName = "상품명";
    String productOption = "옵션: ~~~~~";
    int productPrice = 10500;
    String customerName = "이름";
    String customerPhone = "전화번호";
    String customerAddress = "주소";
    int productAmount = 30000;
    int discount = 3000;
    int totalAmount = productAmount - discount;
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>주문 내역</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .order-container {
            width: 60%;
            margin: 0 auto;
            border: 1px solid #ddd;
            padding: 20px;
            margin-top: 20px;
        }
        .section {
            margin-bottom: 30px;
            padding: 10px;
            border: 1px solid #ddd;
        }
        .section h2 {
            font-size: 16px;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .product-image {
            width: 150px;
            height: 150px;
        }
        .product-info {
            display: inline-block;
            vertical-align: top;
            margin-left: 20px;
        }
        .product-info p {
            margin: 0;
        }
        .payment-info, .shipping-info {
            font-size: 14px;
        }
        .total {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
        }
    </style>
</head>
<body>
	<jsp:include page="includes/include_top_menu.jsp" />
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center">
                <h1 class="display-4 fw-bolder" style="padding-bottom: 50px;">주문내역</h1>
                <hr>
            </div>
        </div>
    </header>

    <div class="order-container">
        <div class="section">
            <h2>주문번호: <%= orderNo %></h2>
            <p><%= orderDate %> 주문</p>
        </div>

        <div class="section">
            <h2>주문상품</h2>
            <img src="img/macBookAir.jpg" class="product-image" alt="상품 이미지">
            <% for(Orders orders: order ) {%>
            <div class="product-info">
                <p><strong><%= productName %></strong></p>
                <p><%= productOption %></p>
                <p><%= productPrice %>원</p>
            </div>
            <div>
                 <% 
                     if(orders.getOrdersStatus() != null && orders.getOrdersStatus().equals("구매확정")) { %>
                         <button type="button" class="btn btn-3rd" onclick="submitForm('review')">리뷰쓰기</button>
                 <% } else { %>
                         <button type="button" class="btn btn-3rd" disabled>리뷰쓰기</button>
                 <% } %>
             </div>
        </div>
		<%} %>
        <div class="section">
            <h2>배송지</h2>
            <div class="shipping-info">
                <p>이름: <%= customerName %></p>
                <p>전화번호: <%= customerPhone %></p>
                <p>주소: <%= customerAddress %></p>
            </div>
        </div>

        <div class="section">
            <h2>결제정보</h2>
            <div class="payment-info">
                <p>상품금액: <%= String.format("%,d", productAmount) %>원</p>
                <p>할인: - <%= String.format("%,d", discount) %>원</p>
            </div>
        </div>
        <div class="total">
            합계: <%= String.format("%,d", totalAmount) %>원
        </div>
    </div>
</body>
</html>
