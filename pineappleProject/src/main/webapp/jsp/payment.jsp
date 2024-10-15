<%@page import="com.itwill.shop.domain.ProductImage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.service.CustomerCouponsService"%>
<%@page import="com.itwill.shop.domain.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="com.itwill.shop.domain.Coupon"%>
<%@page import="com.itwill.shop.domain.CustomerCoupons"%>
<%@page import="com.itwill.shop.domain.Cart"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@page import="com.itwill.shop.domain.Orders"%>
<%@page import="com.itwill.shop.domain.OrdersItems"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@page import="com.itwill.shop.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="customer_login_check.jspf"  %>    
    
<%
	// 숫자 표현 방식
	java.text.DecimalFormat decimalFormat = new java.text.DecimalFormat("#,###");
	response.setContentType("text/html; charset=UTF-8");

	// 세션 값 불러오기
	Orders sOrders = (Orders) session.getAttribute("sOrders");
	String[] cartNo = (String[]) session.getAttribute("cartNo");
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	// 서비스 선언
	CustomerService customerService = new CustomerService();
	CustomerCouponsService customerCouponsService = new CustomerCouponsService();
	OrdersService ordersService = new OrdersService();
	ProductService productService = new ProductService();
	
	// 로긴 유저 내용 가져오기
	int customerNo = Integer.parseInt(sCustomerNo);
	Customer loginCustomer = customerService.findCustomerByNo(customerNo);

	// 쿠폰 관련 내용
	// 보유 개수 쿠폰
	int usableCouponsQty = customerCouponsService.findUsableCustomerCouponsQty(customerNo);
	String customerCouponNoStr = (String) session.getAttribute("selectedCoupon");
	
    String selectedCoupon = request.getParameter("selectedCoupon");
    CustomerCoupons selectedCustomerCoupon = null;
	String findCouponName = "";
	double couponDiscountDb = 0.0;
	int couponDiscount = 0;
	String couponDiscountStr = "";
	int salePrice = 0;
	
	if (selectedCoupon!= null && !selectedCoupon.isEmpty()) {
    	try {
     	   selectedCustomerCoupon = customerCouponsService.findCustomerCouponsDetailByNo(Integer.parseInt(selectedCoupon));
        	if (selectedCoupon != null) {
            	Coupon coupon = selectedCustomerCoupon.getCoupon();
            	findCouponName = coupon.getCouponName();
            	couponDiscountStr = (String)coupon.getCouponDiscount();
            	couponDiscountDb = Double.parseDouble(couponDiscountStr) * 0.01;  // Discount in decimal
        	}
    	} catch (NumberFormatException e) {
       		 // Log the error
       		 out.println("Error parsing coupon number.");
    	}
	}
	for(int i=0; i<sOrders.getOrdersItemsList().size(); i++) {
		int productNo = sOrders.getOrdersItemsList().get(i).getProduct().getProductNo();
		String productImageFile = productService.productDetail(productNo).getProductImageList().get(0).getProductImageFile();
		List<ProductImage> productImageList = new ArrayList<>();
		productImageList.add(ProductImage.builder().productImageFile(productImageFile).build());
		sOrders.getOrdersItemsList().get(i).getProduct().setProductImageList(productImageList);
	}
	
	
    // Assume couponDiscountDb and sOrders are already initialized
    double totalPrice = sOrders.getOrdersTotprice(); // Get the total price from sOrders
    double finalPrice = totalPrice * (1 - couponDiscountDb); // Calculate the initial final price
	

	
%>   
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 페이지</title>
     <!-- favicon -->
		<link rel="icon" href="../img/logo2.png">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .payment-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .payment-container h2 {
            text-align: Left;
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
            display: flex;
            align-items: center;
        }
        
         .product-info img {
            width: 80px; /* 이미지 너비 */
            height: 80px; /* 이미지 높이 */
            object-fit: cover;
            margin-right: 15px;
            border-radius: 5px;
        }
        
        .payment-container input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
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
            background-color: transparent;
            color: #212529; 
            border: 1px solid #212529; 
            border-radius: 5px;
            cursor: pointer;
			transition: background-color 0.3s, color 0.3s; 
        }
        .payment-container button:hover {
            color: #fff; 
			background-color: #212529; 
			border-color: #212529; 
        }
        hr {
            border: none;
            border-top: 1px solid #ccc;
            margin: 10px 0;
        }
        .payment-method {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    justify-content: flex-start;
    width: 100%;
    gap: 10px;
    text-align: left;
}
        .payment-method label {
    margin-left: 0;
    text-align: left;
    align-self: left;
    width: auto;
}
    </style>
</head>
<body>
<jsp:include page="../includes/include_top_menu.jsp" />
 <header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center">
            <h1 class="display-4 fw-bolder">결제하기</h1>
            <hr>
        </div>
    </div>
</header>

<div class="payment-container">
	<form name="paymentForm" id="paymentForm" method="post">
    <input type="hidden" id="selectedCouponField" name="selectedCoupon" value="">
    
        <h2>주문 정보</h2>
        <h3>배송지 정보</h3>
        <div class="shipping-details">
            <p><strong>이름:</strong> <%=loginCustomer.getCustomerName() %></p>
            <p><strong>전화번호:</strong> <%=loginCustomer.getCustomerPhone() %></p>
            <p><strong>주소:</strong> <%=loginCustomer.getCustomerAddress() %></p>
            <input type="hidden" name="ordersAddress" value="<%=loginCustomer.getCustomerAddress() %>">
            
        </div>
        
       <h3>주문상품</h3>
        <div class="order-details">
        	<% for(OrdersItems ordersItems : sOrders.getOrdersItemsList()) { %>
            <div class="product-info">
             <img src="../product_image/<%=ordersItems.getProduct().getProductImageList().get(0).getProductImageFile() %>" alt="제품이미지">
             	<div>
                <p><strong>상품명:</strong> <%=ordersItems.getProduct().getProductName()%></p>
                <p><strong>옵션:</strong> <%=ordersItems.getOrdersItemsOptions()%> </p>
                <p><strong>수량:</strong> <%=ordersItems.getOrdersItemsQty()%>개</p>
                <p><strong>가격:</strong> <span id="product-amount"><%=decimalFormat.format(ordersItems.getOrdersItemsPrice()) %></span>원</p>
            	<input type="hidden" name="ordersItemsFinalprice" value="<%=ordersItems.getOrdersItemsPrice()*(1-couponDiscountDb) %>">
            	</div>
            </div>
            <%}%>
       </div>
            
            <div class="coupon-details">
                <label for="coupon-code">보유 쿠폰: <%=usableCouponsQty%>개</label>
                <%if(!findCouponName.equals("")) { %>
           		<input type="hidden" name="customerCouponsNo" value="<%=Integer.parseInt(selectedCoupon)%>">
                <p><strong>선택 쿠폰 : </strong> <%=findCouponName %></p>
                <p><strong>선택 쿠폰 할인율 : </strong> <%=couponDiscountStr %>%</p>
                
                <% } %>
                <button type="button" id="select-coupon" onclick="customerCouponList()">보유 쿠폰 보기</button>
            </div>
            
		<!-- Coupon details section, initially hidden -->
			<div id="selected-coupon-details">
			</div>
            <div class="total-amount">
                <p>상품금액: <span id="product-amount"><%=decimalFormat.format(sOrders.getOrdersTotprice()) %></span>원</p>
                <p>할인: <span id="discount-amount"> - </span>원</p>
                <p><strong>합계: <span id="total-amount"><%=decimalFormat.format(sOrders.getOrdersFinalprice()) %></span>원</strong></p>
                <input type="hidden" name="ordersFinalprice" value=""></input>
            </div>
            <button class="purchaseBtn" type="button" onclick="submitForm()">결제하기</button>
	</form>
</div>


    <!-- 자바스크립트 -->
    <script type="text/javascript">
	function customerCouponList() {
		popuWindow = window.open("customer_coupon_list_by_payment_form.jsp", "popupWindow", "width=600,height=400,scrollbars=yes");
		
	}
	
	window.onload = function() {
		// 선택된 쿠폰에 따라 특정 함수 호출
		if ("<%= customerCouponNoStr %>" !== "") {
		customerCouponUse(); // 호출할 함수
	        }
	 };
	 
    function customerCouponUse() {
        // Calculate the discount and final price
        var totalPrice = <%=totalPrice%>;
        var couponDiscount = <%=couponDiscountDb%>;
        console.log(couponDiscount);
        const discountAmount = totalPrice * couponDiscount;
        const finalPrice = totalPrice - discountAmount;

        // Update the HTML to show the new prices
        if(discountAmount==0) {
        document.getElementById('discount-amount').textContent = discountAmount.toLocaleString();

        } else {
        	document.getElementById('discount-amount').textContent = "-"+discountAmount.toLocaleString();

		}
    	document.querySelector('input[name="ordersFinalprice"]').value = finalPrice;
        document.getElementById('total-amount').textContent = finalPrice.toLocaleString();
    }
	
	function refreshCouponDetails() {
	    var selectedCoupon = document.getElementById('selectedCouponField').value;

	    // Optionally, update the UI or handle the selected coupon
	    
	    window.location.href = window.location.pathname + "?selectedCoupon=" + selectedCoupon;
	    
	    window.opener.location.reload(); // This will refresh the parent page
	    window.close(); // Close the popup window
	    
	}
	
	function submitForm() {
		var form = document.getElementById('paymentForm');
		
		

		form.action = 'orders_insert_action.jsp';
		form.method = 'POST'
		form.submit();
	}
	
	
</script>
    
</body>
</html>