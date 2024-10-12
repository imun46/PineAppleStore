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
    	 body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .coupon-container {
            max-width: 400px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .coupon {
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .coupon input {
            margin-right: 10px;
        }
        .apply-btn {
			width: 100%;
			padding: 10px;
			margin-top: 20px;
			color: #212529; 
			border: 1px solid #212529; 
			background-color: transparent;
			font-size: 11px;
			font-weight: bold; 
			border-radius: 5px;
			cursor: pointer;
			transition: background-color 0.3s, color 0.3s; 
        }
        .apply-btn:hover {
			color: #fff; 
			background-color: #212529; 
			border-color: #212529; 
        }
        .apply-btn:focus {
			outline: none; 
			box-shadow: 0 0 0 0.2rem rgba(33, 37, 41, 0.5); 
        }
        .apply-btn:active {
			color: #fff; 
			background-color: #212529; 
			border-color: #212529; 
        }
        
    </style>
</head>
<body>
   <jsp:include page="../includes/include_top_menu.jsp" />
   <div class="coupon-container">
      <%for (CustomerCoupons customerCoupon : customerCoupons) { %>
        <div class="coupon">
           <label for="selectedCoupon">
           <input type="radio" name="selectedCoupon" value="<%= customerCoupon.getCustomerCouponsNo() %>">
           <strong><%= customerCoupon.getCoupon().getCouponName() %></strong><br>
           <%=customerCoupon.getCoupon().getCouponDesc() %><br>
           <%=simpleDateFormat.format(customerCoupon.getCustomerCouponsEnddate()) %>
           </label>
           </div>
        <% } %>
            <button class="apply-btn"  onClick="customerCouponChoice()">쿠폰 적용</button>
            <button class="apply-btn"  onClick="exit()">나가기</button>
        </div>
       
       
<!-- 자바스크립트 -->
    <script type="text/javascript">
    function customerCouponChoice() {
        // Get the selected coupon value
        var selectedCoupon = document.querySelector('input[name="selectedCoupon"]:checked');

        if (selectedCoupon) {
            var customerCouponsNo = selectedCoupon.value; // Get the coupon number
              window.close();

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