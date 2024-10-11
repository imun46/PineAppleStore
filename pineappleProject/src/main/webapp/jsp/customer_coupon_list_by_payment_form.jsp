<%@page import="com.itwill.shop.domain.CustomerCoupons"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="customer_login_check.jspf"  %>    
<%
	/*** 서비스 객체 생성***/
	CustomerService customerService = new CustomerService();
	
	/*** 아이디번호 가져와 int로 형변환 후 Customer객체 생성 ***/
	int customerNo = Integer.parseInt(sCustomerNo);
	Customer loginCustomer = customerService.findCustomerByNo(customerNo);
	
	/*** 날짜 포맷 설정 ***/
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	/*** 쿠폰 리스트 객체 생성 ***/
	List<CustomerCoupons> customerCoupons = customerService.findCouponList(loginCustomer.getCustomerNo());
	
	
	
	
%>    
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>보유 쿠폰 리스트</title>
<script type="text/javascript">
	function customerCouponChoice(){
		document.f.action = "customer_coupon_list_by_payment_action.jsp";
		document.f.method="POST";
		document.f.submit();
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
        
         .button-container {
            text-align: center; /* 가운데 정렬 */
            margin-top: 20px; /* 위쪽 여백 추가 */
        }
        
        hr {
            border: none;
            border-top: 1px solid #ccc;
            margin: 10px 0;
        }
    </style>
</head>
<body>
	<div class="payment-container">
		<h2>보유 쿠폰</h2>
		<%for (CustomerCoupons customerCoupon : customerCoupons) { %>
         <div class="order-details">
            <div class="product-info">
           	
	        <p><input type="radio" name="selectedCoupon" value="<%= customerCoupon.getCustomerCouponsNo() %>">
	        <strong>쿠폰 이름:</strong> <%= customerCoupon.getCoupon().getCouponName() %></p>
            <p><strong>쿠폰 내용:</strong> <%=customerCoupon.getCoupon().getCouponDesc() %></p>
            <p><strong>쿠폰 상태:</strong> <%=customerCoupon.getCustomerCouponsStatus() %></p>
            <p><strong>쿠폰 만기일:</strong> <%=simpleDateFormat.format(customerCoupon.getCustomerCouponsEnddate()) %></p>
        	</div>
        </div><hr>
        <% } %>
     </div>
     <div class="button-container">
            <input type="button" value="쿠폰 적용" onClick="customerCouponChoice()">
        </div>
</body>
</html>