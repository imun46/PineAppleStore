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
            width: 70%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ccc;
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
		.orderBtn, .purchaseBtn, .purchaseConfirmedBtn{
		    color: #212529; /* 버튼 텍스트 색상 */
		    border: 1px solid #ccc; /* 버튼 경계 색상 */
		    background-color: transparent; /* 배경색 투명 */
		    padding: 8px 15px; /* 버튼의 패딩 */
		    cursor: pointer; /* 마우스 포인터를 손가락 모양으로 변경 */
		    font-size: 14px; /* 글자 크기 */
		    font-weight: bold; /* 글자 두께 */
		    border-radius: 5px; /* 모서리 둥글게 */
		    transition: background-color 0.3s, color 0.3s; /* 호버 시 변화 애니메이션 */
		}
		.orderBtn:hover {
		    color: #fff; /* 호버 시 텍스트 색상 */
		    background-color: #212529; /* 호버 시 배경색 */
		    border-color: #212529; /* 호버 시 경계 색상 */
		}
		
		.orderBtn:focus {
		    outline: none; /* 포커스 시 외곽선 제거 */
		    box-shadow: 0 0 0 0.2rem rgba(33, 37, 41, 0.5); /* 포커스 시 그림자 효과 */
		}
		
		.orderBtn:active {
		    color: #fff; /* 클릭 시 텍스트 색상 */
		    background-color: #212529; /* 클릭 시 배경색 */
		    border-color: #212529; /* 클릭 시 경계 색상 */
		}
		.purchaseBtn{
			 background-color: #8dc63f;
			 color:#1c2833;
			 border: 1px solid #8dc63f;
		}
		.purchaseBtn:hover {
			 background-color: #212529;
			 color:#fff;
			 border: 1px solid #ccc; /* 버튼 경계 색상 */
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
                    <tr style="text-align: center;">
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
                    <% for(int i = 0 ; i < orderList.size() ; i++) { 
                        if (orderList != null && !orderList.isEmpty()) {
                            int itemPrice = orderList.get(i).getOrdersFinalprice();
                            int itemQty = orderList.get(i).getOrdersTotqty();
                    %>
                    <tr style="border-bottom: 1px solid #ccc;"> 
                    	<input type="hidden" name="ordersNo" value></input>
                        <td><button type="button" class="orderBtn" onclick="submitForm('detail',<%=orderList.get(i).getOrdersNo()%> )">주문상세</button></td>
                        <td><%=orderList.get(i).getOrdersNo() %></td>
                        <td><%=dateFormat.format(orderList.get(i).getOrdersDate()) %></td>
                        <%
                        	if(orderList.get(i).getOrdersStatus().equals("구매확정")) { %>                        
	                        <td style="color:tomato;"><%=dateFormat.format(orderList.get(i).getOrdersArrivaldate()) %></td>
                        <%
                        	}else{%>
		                        <td><%=orderList.get(i).getOrdersStatus() %></td>
		                <%
                        	}
                        %>
                        
                        <td class="item-info"><%=orderList.get(i).getOrdersItemsList().get(0).getProduct().getProductName() %><br></td>
                        <td><%=orderList.get(i).getOrdersItemsList().size() %></td>
                        <td><%=decimalFormat.format(itemPrice) %>원</td>
                         <%
                        	if(orderList.get(i).getOrdersStatus().equals("구매확정")) { %>                      
                        	<td><button  type="button" class="purchaseConfirmedBtn" onclick="submitForm('purchaseConfirmed',<%=orderList.get(i).getOrdersNo()%>)" disabled >구매확정</button></td>
                        <% }else{ %>
                        	<td><button type="button" class="purchaseBtn" onclick="submitForm('purchaseConfirmed',<%=orderList.get(i).getOrdersNo()%>)">구매확정</button></td>
                        <%} %>
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
        function submitForm(action, ordersNo) {
        	let form = document.getElementById('orderForm');
        	let input = document.querySelector('input[name="ordersNo"]');
        	if(action === 'detail'){
        		input.value = ordersNo;
        		form.action = 'order_detail_view.jsp';
                form.method = 'POST';
                form.submit();
        	}else if(action === 'purchaseConfirmed'){
        		input.value = ordersNo;
        		form.action = 'orders_confirmed_action.jsp';        
                form.method = 'POST';
                form.submit();
        	}
        }
    </script>
</body>
</html>
