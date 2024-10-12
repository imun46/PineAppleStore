<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.domain.Orders"%>
<%@page import="com.itwill.shop.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String orderNo = request.getParameter("ordersNo");
	OrdersService orderService = new OrdersService();
	List<Orders> order = orderService.findByOrdersNo(Integer.parseInt(orderNo));

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
    <title>주문내역</title>
    <style>
        <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }
        .order-container {
            width: 60%;
            margin: 30px auto;
            background: #fff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            padding: 30px;
        }
        h2 {
            font-weight: bold;
        }
        h1 {
            padding-bottom: 50px;
            color: #000;
        }
        .section {
            margin-bottom: 30px;
            padding: 20px;
            border-radius: 10px;
            background: #f8f9fa;
        }
        .section h2 {
            font-size: 18px;
            margin-bottom: 10px;
            color: #343a40;
        }
        .product-info {
            display: flex;
            align-items: center;
        }
        .product-image {
            width: 150px;
            height: 150px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-details {
            margin-left: 20px;
            font-size: 16px;
            flex: 1;
        }
        .product-details p {
            margin: 5px 0;
        }
        
        .shipping-info, .payment-info {
            font-size: 16px;
        }
        .total {
            font-size: 20px;
            font-weight: bold;
            text-align: right;
            margin-top: 10px;
        }
        .icon {
            margin-right: 10px;
            color: #007bff;
        }
    </style>
</head>
<body>
    <jsp:include page="../includes/include_top_menu.jsp" />
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center">
                <h1 class="display-4 fw-bolder">주문 상세내역</h1>
                <hr>
            </div>
        </div>
    </header>

    <div class="order-container">
        <div class="section">
            <p><i class="fas fa-calendar-day icon"></i><%= orderDate %> 주문</p>
            <h2>주문번호: <%= orderNo %></h2>
        </div>
        <h2>주문상품</h2>
        <div class="section product-info">
            <img src="img/macBookAir.jpg" class="product-image" alt="상품 이미지">
            <% for (Orders orders : order) { %>
                <div class="product-details">
                    <p><strong><%= productName %></strong></p>
                    <p><%= productOption %></p>
                    <p><%= String.format("%,d", productPrice) %>원</p>
                </div>
                <div class="btn-review">
                    <% if (orders.getOrdersStatus() != null && orders.getOrdersStatus().equals("구매확정")) { %>
                        <button type="button" class="btn" onclick="submitForm('review')">리뷰쓰기</button>
                    <% } else { %>
                        <button type="button" class="btn" disabled>리뷰쓰기</button>
                    <% } %>
                </div>
            <% } %>
        </div>
        <h2>배송지</h2>
        <div class="section shipping-info">
            <p><i class="fas fa-user icon"></i><%= customerName %></p>
            <p><i class="fas fa-phone icon"></i><%= customerPhone %></p>
            <p><i class="fas fa-map-marker-alt icon"></i><%= customerAddress %></p>
        </div>
        <h2>결제정보</h2>
        <div class="section payment-info">
            <p>상품금액: <%= String.format("%,d", productAmount) %>원</p>
            <p>할인: - <%= String.format("%,d", discount) %>원</p>
        </div>
        <div class="total">
            합계: <%= String.format("%,d", totalAmount) %>원
        </div>
    </div>
</body>
</html>