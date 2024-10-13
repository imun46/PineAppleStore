<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.domain.Orders"%>
<%@page import="com.itwill.shop.service.OrdersService"%>
<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Date" %>

<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat decimalFormat = new java.text.DecimalFormat("#,###");

	String sCustomerNo = (String)session.getAttribute("sCustomerNo");
	String orderNo = request.getParameter("ordersNo");
	CustomerService customerService= new CustomerService();
	OrdersService orderService = new OrdersService();
	ProductService productService = new ProductService();
	
	Customer customer = customerService.findCustomerByNo(Integer.parseInt(sCustomerNo));
	List<Orders> orderList = orderService.findByOrdersNo(Integer.parseInt(orderNo));
	
	int orderitemsSize = 0;
	if(orderList.size()>0){
	 orderitemsSize= orderList.get(0).getOrdersItemsList().size();
	}
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
        p{
        	font-size: 17px;
        }
        .section {
            margin-bottom: 20px;
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
        .basicBtn {
            background-color: transparent; /* 구매 버튼 색상 */
            border: 1px solid #212529; /* 버튼 경계 색상 */
            padding: 10px 25px;
            border-radius: 5px;
            border: 1px solid #ccc;
            cursor: pointer;
            font-weight: bold;
        }
        .basicBtn:hover {
            color: #fff; /* 호버 시 텍스트 색상 */
		    background-color: #212529; /* 호버 시 배경색 */
		    border-color: #212529; /* 호버 시 경계 색상 */
        }
        .basicBtn:focus {
		    outline: none; /* 포커스 시 외곽선 제거 */
		    box-shadow: 0 0 0 0.2rem rgba(33, 37, 41, 0.5); /* 포커스 시 그림자 효과 */
		}
		.basicBtn:active {
		    color: #fff; /* 클릭 시 텍스트 색상 */
		    background-color: #212529; /* 클릭 시 배경색 */
		    border-color: #212529; /* 클릭 시 경계 색상 */
		}
		.orderListBtn {
			display: flex;
			justify-content: center;
		}
		.orderListBtn > button {
			padding: 15px 30px;
			font-size: 20px;
		}
		.reviewWrite {
			color: #fff; 
		    background-color: #212529; 
		}
	    .reviewWriteDisabled {
	        cursor: not-allowed; /* 비활성화 상태일 때 커서 */
	        background-color: #999; /* 비활성화된 버튼 색상 */
	        border-color: #999;
	        color: #fff;
	    }
	    /* reviewWriteDisabled 클래스가 hover되었을 때 */
	    .reviewWriteDisabled:hover {
	        background-color: #999; /* 호버 시에도 같은 색상을 유지 */
	        border-color: #999;
	        color: #fff;
	    }
    </style>
</head>
<body>
    <jsp:include page="../includes/include_top_menu.jsp" />
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center">
                <h1 class="display-4 fw-bolder">주문 상세 내역</h1>
                <hr>
            </div>
        </div>
    </header>

    <div class="order-container">
        <div class="section">
            <p><i class="fas fa-calendar-day icon"></i>주문</p>
            <h2>주문번호: <%= orderNo %></h2>
            <h2>주문일자: <%= dateFormat.format(orderList.get(0).getOrdersDate()) %></h2>
        </div>
        <h2>주문상품</h2>
        <%if(orderList != null && !orderList.isEmpty()){ %>
	        <% for (int i=0; i < orderitemsSize ;i++) { %>
		        <div class="section product-info">
		        	<%
                		int productNo = orderList.get(0).getOrdersItemsList().get(i).getProduct().getProductNo();
                		String productImageFile = productService.productDetail(productNo).getProductImageList().get(0).getProductImageFile();
		        	%>
		        	
		            <img src="../product_image/<%=productImageFile %>" class="product-image" alt="상품 이미지">
		                <div class="product-details">
		                	<%
		                		String productName = orderList.get(0).getOrdersItemsList().get(i).getProduct().getProductName();
		                		String productOptions = orderList.get(0).getOrdersItemsList().get(i).getOrdersItemsOptions();
		                		int orderQty = orderList.get(0).getOrdersItemsList().get(i).getOrdersItemsQty();
		                	%>
		                	<p style="font-size:18px; font-weight:bold;"><%=productName %></p>
		                	<p>옵션 : <%=productOptions %></p>
		                	<p>수량 : <%=orderQty %>개</p>
		
		                    <p><%= String.format("%,d", orderList.get(0).getOrdersFinalprice()) %>원</p>
		                </div>
		                <div class="btn-review">
		                    <% if (orderList.get(0).getOrdersStatus() != null && orderList.get(0).getOrdersStatus().equals("구매확정")) { %>
		                        <button type="button" class="basicBtn reviewWrite" onclick="reviewBtn(<%=orderList.get(0).getOrdersItemsList().get(i).getProduct().getProductNo() %>)">리뷰쓰기</button>
		                    <% } else { %>
		                        <button type="button" class="basicBtn reviewWriteDisabled" disabled>리뷰쓰기</button>
		                    <% } %>
		                </div>
		        </div>
	        <% } %>
        <% } %>
        <h2>배송지</h2>
        <div class="section shipping-info">
            <p>받는사람 : <%=customer.getCustomerName()  %></p>
            <p>연락처   : <%=customer.getCustomerPhone()  %></p>
            <p>주소     : <%=customer.getCustomerAddress()  %></p>
        </div>
        <h2>결제정보</h2>
        <div class="section payment-info">
            <p>상품금액: <%=decimalFormat.format(orderList.get(0).getOrdersTotprice())  %>원</p>
            <p>할인: - <%=decimalFormat.format(orderList.get(0).getOrdersTotprice() - orderList.get(0).getOrdersFinalprice()) %>원</p>
        </div>
        <div class="total">
            합계: <%=decimalFormat.format(orderList.get(0).getOrdersFinalprice())  %>원
        </div>
        <div class = "orderListBtn">
        	<button type="button" class="basicBtn " onclick="orderListpage(<%=Integer.parseInt(orderNo) %>)">주문내역</button>
        </div>
    </div>
    
    <script type="text/javascript">
    	function orderListpage(orderNo){
    		window.location.href = "order_list_form.jsp?ordersNo=" + orderNo;
    	}
    	
    	function reviewBtn(productNo){
    		window.location.href = "review_insert_form.jsp?productNo=" + productNo;
    	}
    </script>	
</body>
</html>