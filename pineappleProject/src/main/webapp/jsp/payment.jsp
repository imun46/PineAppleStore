<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.service.CustomerCouponsService"%>
<%@page import="com.itwill.shop.domain.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="com.itwill.shop.domain.Coupon"%>
<%@page import="com.itwill.shop.domain.CustomerCoupons"%>
<%@page import="com.itwill.shop.domain.Cart"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@page import="com.itwill.shop.domain.Orders"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.service.OrdersService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="customer_login_check.jspf"  %>    
    
<%
	java.text.DecimalFormat decimalFormat = new java.text.DecimalFormat("#,###");
	response.setContentType("text/html; charset=UTF-8");
	
	/*** CustomerService 선언 ***/
	CustomerService customerService = new CustomerService();
	
	/*** CustomerService 선언 ***/
	CustomerCouponsService customerCouponsService = new CustomerCouponsService();
	
	/*** 아이디번호 가져와 int로 형변환 후 Customer객체 생성 ***/
	int customerNo = Integer.parseInt(sCustomerNo);
	Customer loginCustomer = customerService.findCustomerByNo(customerNo);
	
	/*** 날짜 포맷 설정 ***/
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	/*** 데이터 저장할 값 미리 선언 ***/
	
	//할인율(%)
	double couponDiscountDb = 0;
	//쿠폰 이름
	String findCouponName = "";
	//상품 번호
	Integer productNo = 0;
	//Product 객체
	Product product = null;
	//할인 금액
	double salePrice = 0;
	//상품 금액
	Integer price = 0;
	//합계 금액
	Integer tot = 0;
	//옵션들
	String optionStr = "";
	
	/*** 보유 쿠폰에서 선택한 쿠폰 번호 가져오기***/
	String customerCouponNoStr = (String) session.getAttribute("selectedCoupon");
	
	/*** customerCouponNoStr가 선택됐다면 ***/
	if (customerCouponNoStr != null) {
	      
		/*** 문자열을 정수형으로 바꾸기 ***/
		Integer customerCouponsNo = Integer.parseInt(customerCouponNoStr);
		          
	    /*** CustomerCoupons번호에 맞는 쿠폰 찾기***/
	    CustomerCoupons findCoupon = customerCouponsService.findCustomerCouponsDetailByNo(customerCouponsNo);
	    
	    /*** 찾은 사용자 쿠폰 번호와 일치하는 쿠폰 객체 반환 ***/
	    Coupon coupon = findCoupon.getCoupon();
	    
	    /*** 쿠폰 이름 저장 ***/
	    findCouponName = coupon.getCouponName();
	    
	    /*** 쿠폰 객체에서 할인율 가져오기 ***/
	    String couponDiscountStr = coupon.getCouponDiscount();
	    
	    /*** 가져온 할인율 Integer타입으로 형변환 ***/
	    Integer couponDiscount = Integer.parseInt(couponDiscountStr);
	   
	    /*** couponDiscount %로 변환***/
	    couponDiscountDb = couponDiscount * 0.01;
	    
	}
	
	/*** OrdersService 선언 ***/
	OrdersService ordersService = new OrdersService();
	
	ProductService productService = new ProductService();
	
	/*** 제품 번호 파라매터 ***/
	String productNoStr = request.getParameter("product_no");	
	/*** 제품 수량 파라매터 ***/
	String cartQty = request.getParameter("cart_qty");	
	/*** 제품 총 가격(현재는 제품 가격만 나옴) 파라매터 ***/
	String productsalePrice = request.getParameter("product_salePrice");	
	/*** 제품 옵션 파라매터(배열로 받음) ***/
	String[] productOptionDetailNo = request.getParameterValues("product_option_detail_no");	
	
	
	
	
	/*** 가져온 데이터가  NULL이 아니면 실행 ***/
	if(productNoStr != null) { 
		/*** 제품 번호 Integer로 변환 ***/
		productNo = Integer.parseInt(productNoStr);
		
		/*** 제품 번호로 제품 상세 출력 ***/
		product = productService.productDetail(productNo);
	
	}
	
	ArrayList<Integer> optionPriceList = new ArrayList<>();

	for (int i = 0; i < product.getProductOptionList().size(); i++) {
	        optionStr += product.getProductOptionList().get(i).getProductOptionDetailList().get(i).getProductOptionDetailName() +"(+"+ decimalFormat.format(product.getProductOptionList().get(i).getProductOptionDetailList().get(i).getProductOptionDetailPrice())  + "원)/";
	        
	    for (int j = 0; j < product.getProductOptionList().get(i).getProductOptionDetailList().size(); j++) {
	        Integer optionPrice = product.getProductOptionList().get(i).getProductOptionDetailList().get(j).getProductOptionDetailPrice();
	        optionPriceList.add(optionPrice); // ArrayList에 가격 추가
	        tot += optionPrice; // 총합에 가격 더하기
	    }
	}
	
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
		
	}
	
	window.onload = function() {
		// 선택된 쿠폰에 따라 특정 함수 호출
		if ("<%= customerCouponNoStr %>" !== "") {
		customerCouponUse(); // 호출할 함수
	        }
	    };
	
	function customerCouponUse() {
		<% salePrice = product.getProductPrice() * couponDiscountDb ; %>
		
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
        <div class="order-details">
            <div class="product-info">
                <p><strong>상품명:</strong> <%=product.getProductName() %></p>
                <p><strong>옵션:</strong> <%=optionStr.substring(0, optionStr.length()-1)  %></p>
                <p><strong>수량:</strong> <%=cartQty %>개</p>
                <p><strong>가격:</strong> <span id="product-amount"><%=decimalFormat.format(tot) %></span>원</p>
            </div>
            
            <form id="payment-form" action="paymentProcess.jsp" method="post">
                <label for="coupon-code">보유 쿠폰</label>
                <%if(!findCouponName.equals("")) { %>
                <p><strong>선택 쿠폰 : </strong> <%=findCouponName %></p>
                <% } %>
                <button type="button" id="select-coupon" onclick="customerCouponList()">보유 쿠폰 보기</button>
            </form>

            <p>할인: <span id="discount"><%=decimalFormat.format(salePrice) %>원 </span>할인적용</p>
        </div>
        </form>
        <form id="payment-form" action="order_list_form.jsp" method="post">

            <div class="total-amount">
                <p>상품금액: <span id="product-amount"><%=decimalFormat.format(tot) %></span>원</p>
                <p>할인: <span id="product-amount"> - <%=decimalFormat.format(salePrice) %></span>원</p>
                <p><strong>합계: <span id="total-amount"><%=decimalFormat.format(tot-salePrice)%></span>원</strong></p>
            </div>

            <button type="submit">결제하기</button>
        </form>
    </div>
    
</body>
</html>