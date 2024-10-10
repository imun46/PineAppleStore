<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="com.itwill.shop.orders.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.orders.OrdersService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/login_check.jspf"  %>    
    
<%
	response.setContentType("text/html; charset=UTF-8");
	
	/*** CustomerService 선언 ***/
	CustomerService customerService = new CustomerService();
	
	/*** 아이디번호 가져와 int로 형변환 후 Customer객체 생성 ***/
	int customerNo = Integer.parseInt(sCustomerNo);
	Customer loginCustomer = customerService.findCustomerNo(customerNo);
	
	/*** 날짜 포맷 설정 ***/
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	/*** OrdersService 선언 ***/
	OrdersService ordersService = new OrdersService();
	
	/*** CartService 선언 ***/
	CartService cartService = new CartService();
	
	/*주문 + 주문 아이템 전체 리스트(특정 사용자)*/
	List<Orders> ordersList = ordersService.findByOrderNoCustomerNo(customerNo);
	
	/*카트 리스트 (회원)*/
	List<Cart> cartList = cartService.findByCustomerNo(customerNo);
	
	
	
%>   
    
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 페이지</title>
<script type="text/javascript">
	function customerCouponList() {
		popuWindow = window.open("customer_coupon_list_by_payment_form.jsp", "popupWindow", "width=600,height=400,scrollbars=yes");
		document.f.method = 'POST';
		document.f.submit();
	}
	
	function customerCouponUse() {
		
		
	}
</script>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .payment-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .payment-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .payment-container h3 {
            font-size: 18px;
            margin-bottom: 10px;
            color: #343a40;
        }
        .payment-container .order-details, .payment-container .shipping-details {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .payment-container .product-info {
            border-bottom: 1px solid #ccc;
            padding-bottom: 15px;
            margin-bottom: 15px;
        }
        .payment-container input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;ㄴ
            border: 1px solid #ccc;
        }
        .payment-container .total-amount {
            margin-top: 20px;
            font-size: 16px;
            font-weight: bold;
            color: #333;
        }
        .payment-container button {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #000;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .payment-container button:hover {
            background-color: #45a049;
        }
        hr {
            border: none;
            border-top: 1px solid #ccc;
            margin: 10px 0;
        }
    </style>
</head>
<body>
<form name="f" method="post">
    <div class="payment-container">
        <h2>주문 정보</h2>
        <h3>배송지 정보</h3>
        <div class="shipping-details">
            <p><strong>이름:</strong> <%=loginCustomer.getCustomerName() %></p>
            <p><strong>전화번호:</strong> <%=loginCustomer.getCustomerPhone() %></p>
            <p><strong>주소:</strong> <%=loginCustomer.getCustomerAddress() %></p>
        </div>
        
        <h3>주문상품</h3>
        <%for (Cart cart : cartList) { %>
        <div class="order-details">
            <div class="product-info">
                <p><strong>상품명:</strong> <%= cart.getProductSelectedList().get %></p>
                <p><strong>수량:</strong> 1개</p>
                <p><strong>가격:</strong> <span id="product-amount"><%= String.format("%,d", 1_000_000) %></span>원</p>
            </div>
            <hr>
        <% } %>    
            
            <form id="payment-form" action="paymentProcess.jsp" method="post">
                <label for="coupon-code">보유 쿠폰</label>
                <button type="button" id="select-coupon" onclick="customerCouponList()">보유 쿠폰 보기</button>
            </form>

            <p>할인: - <span id="discount"><%= String.format("%,d", 0) %></span>원</p>
        </div>
        </form>
        <h2>결제 정보 입력</h2>
        <form id="payment-form" action="paymentProcess.jsp" method="post">
            <label for="card-number">카드 번호:</label>
            <input type="text" id="card-number" name="cardNumber" placeholder="1234 5678 9012 3456" required>

            <label for="expiry-date">만료 날짜:</label>
            <input type="text" id="expiry-date" name="expiryDate" placeholder="MM/YY" required>

            <label for="cvv">CVV:</label>
            <input type="password" id="cvv" name="cvv" placeholder="123" required>

            <label for="card-holder">카드 소유자 이름:</label>
            <input type="text" id="card-holder" name="cardHolder" placeholder="김옥자" required>

            <div class="total-amount">
                <p>상품금액: <span id="product-amount"><%= String.format("%,d", 0) %></span>원</p>
                <p><strong>합계: <span id="total-amount"><%= String.format("%,d", 0) %></span>원</strong></p>
            </div>

            <button type="submit">결제하기</button>
        </form>
    </div>
    
</body>
</html>