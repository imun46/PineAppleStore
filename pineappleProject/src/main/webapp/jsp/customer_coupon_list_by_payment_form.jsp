<%@page import="com.itwill.shop.service.CustomerCouponsService"%>
<%@page import="com.itwill.shop.domain.Customer"%>
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
	CustomerCouponsService customerCouponsService = new CustomerCouponsService();
	
	/*** 아이디번호 가져와 int로 형변환 후 Customer객체 생성 ***/
	int customerNo = Integer.parseInt(sCustomerNo);
	Customer loginCustomer = customerService.findCustomerByNo(customerNo);
	
	/*** 날짜 포맷 설정 ***/
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	/*** 쿠폰 리스트 객체 생성 ***/
	List<CustomerCoupons> customerCoupons = customerCouponsService.findCustomerCouponsListUsable(customerNo);
	
	
	
	
%>    
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>보유 쿠폰 리스트</title>
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
            <input type="button" value="나가기" onClick="exit()">
        </div>
       
       
<!-- 자바스크립트 -->
    <script type="text/javascript">
    function customerCouponChoice() {
        // Get the selected coupon value
        var selectedCoupon = document.querySelector('input[name="selectedCoupon"]:checked');

        if (selectedCoupon) {
            var customerCouponsNo = selectedCoupon.value; // Get the coupon number

            // Check if the parent window is available
            if (window.opener && !window.opener.closed) {
                console.log("Parent window found, sending coupon data."); // Debugging log

                // Set the coupon value in the parent window
                window.opener.document.getElementById('selectedCouponField').value = customerCouponsNo;
                window.opener.refreshCouponDetails(); // Call a function on the parent page to update the display
            } else {
                console.log("Parent window not found."); // Debugging log if parent window is not accessible
            }

            // Close the popup window
            window.close();
            console.log("Popup window closed."); // Debugging log for window closure
        } else {
            alert("쿠폰을 선택해주세요."); // Show alert if no coupon is selected
        }
    }

        function exit() {
            window.close(); // Close the popup without doing anything
        }
    </script>

        
</body>
</html>