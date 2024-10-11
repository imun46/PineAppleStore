<%@page import="java.util.List"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@page import="com.itwill.shop.domain.Orders"%>
<%@page import="com.itwill.shop.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="customer_login_check.jspf"%>
<%  
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	java.text.DecimalFormat decimalFormat = new java.text.DecimalFormat("#,###");
	Integer customerNo = Integer.parseInt(sCustomerNo);
	OrdersService ordersService = new OrdersService();
	List<Orders> orderList = ordersService.findByCustomerNo(customerNo);
	int totalAmount = 0;
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문리스트</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        #container {
            text-align: center;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .item-image {
            width: 80px;
            height: 80px;
        }
        .item-info {
            text-align: center;
        }
        .total-amount {
            text-align: center;
            font-weight: bold;
        }
        .btn {
            padding: 10px 20px;
            cursor: pointer;
            border: none;
        }
        .btn-3rd {
            background-color: #f0f0f0;
            color: #000;
        }
        .btn-primary {
            background-color: #000;
            color: #fff;
        }
    </style>
</head>
<body>
    <jsp:include page="../includes/include_top_menu.jsp" />
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center">
                <h1 class="display-4 fw-bolder" style="padding-bottom: 50px;">주문내역</h1>
                <hr>
            </div>
        </div>
    </header>

    <div id="container">
    	<form id="orderForm" method="POST">
            <table>
                <thead>
                    <tr>
                        <th>상세보기</th>
                        <th>주문번호</th>
                        <th>주문일자</th>
                        <th>배송일자</th>
                        <th>주문정보</th>
                        <th>수량</th>
                        <th>합계</th>
                        <th>구매확정</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Orders orders : orderList) { 
                        if (orders.getOrdersItemsList() != null && !orders.getOrdersItemsList().isEmpty()) {
                            int itemPrice = orders.getOrdersItemsList().get(0).getProduct().getProductPrice();
                            int itemQty = orders.getOrdersItemsList().get(0).getOrdersItemsQty();
                            int itemTotal = itemPrice * itemQty;
                            totalAmount += itemTotal;
                    %>
                    <tr> 
                    	<input type="hidden" name="orders_no" value="<%=orders.getOrdersNo()%>"></input>
                        <td><button type="button" class="btn btn-3rd" onclick="submitForm('detail')">상세보기</button></td>
                        <td><%=orders.getOrdersNo() %></td>
                        <td><%=dateFormat.format(orders.getOrdersDate()) %></td>
                        <td><%=orders.getOrdersArrivaldate() != null ? dateFormat.format(orders.getOrdersArrivaldate()) : "" %></td>
                        <td class="item-info"><%=orders.getOrdersItemsList().get(0).getProduct().getProductName() %><br></td>
                        <td><%=itemQty %></td>
                        <td><%=decimalFormat.format(itemTotal) %> 원</td>
                        <td><button type="button" class="btn btn-3rd" onclick="submitForm('purchaseConfirmed')">구매확정</button></td>

                    </tr>
                    <% } else { %>
                    <tr>
                        <td colspan="9">상품 정보가 없습니다.</td>
                    </tr>
                    <% } } %>
                </tbody>
            </table>
            <div class="actions" style="display: flex; justify-content: center; gap: 20px;">
                <a class="btn btn-3rd" href="index.jsp">홈으로</a>
            </div>
        </form>
    </div>

    <script>
        function submitForm(action) {
        	var form = document.getElementById('orderForm');
        	if(action === 'detail'){
        		form.action = 'order_detail_view.jsp';
                form.method = 'POST';
                form.submit();
        	}else if(action === 'purchaseConfirmed'){
        		form.action = 'order_confirmed_action.jsp';        
                form.method = 'POST';
                form.submit();
        	}
        }
    </script>
</body>
</html>
