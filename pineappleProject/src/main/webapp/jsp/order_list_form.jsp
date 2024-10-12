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
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문리스트</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        #container {
            max-width: 60%;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
            font-size: 16px;
        }

        th {
            background-color: #f2f2f2;
            color: #333;
        }

        .item-image {
            width: 80px;
            height: 80px;
            border-radius: 5px;
            object-fit: cover;
        }

        .item-info {
            text-align: center;
        }
        .basicBtn {
            padding: 10px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        .ordersBtn {
            background-color: transparent; /* 구매 버튼 색상 */
            border: 1px solid #212529; /* 버튼 경계 색상 */
            color: #212529;
        }
        .ordersBtn:hover {
            color: #fff; /* 호버 시 텍스트 색상 */
		    background-color: #212529; /* 호버 시 배경색 */
		    border-color: #212529; /* 호버 시 경계 색상 */
        }
        .ordersBtn:focus {
		    outline: none; /* 포커스 시 외곽선 제거 */
		    box-shadow: 0 0 0 0.2rem rgba(33, 37, 41, 0.5); /* 포커스 시 그림자 효과 */
		}
		.ordersBtn:active {
		    color: #fff; /* 클릭 시 텍스트 색상 */
		    background-color: #212529; /* 클릭 시 배경색 */
		    border-color: #212529; /* 클릭 시 경계 색상 */
		}
		.purchaseBtn:hover{
		 	color: #fff; /* 호버 시 텍스트 색상 */
		    background-color: #212529; /* 호버 시 배경색 */
		}
        .purchaseConfirmedBtn {
            background-color: #989da2; /* 구매 확정 버튼 색상 */
            color: white;
            cursor: not-allowed; /* 비활성화 시 커서 모양 변경 */
        }
        .total-amount {
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
        }

        .actions {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="../includes/include_top_menu.jsp" />
     <header class="bg-dark py-5">
	     <div class="container px-4 px-lg-5 my-5">
	         <div class="text-center">
	             <h1 class="display-4 fw-bolder">주문내역</h1>
	             <hr>
	         </div>
	     </div>
    </header>
    <div id="container">
        <form id="orderForm" method="POST">
            <input type="hidden" name="ordersNo" value=""> <!-- Hidden input 추가 -->
            <table>
                <thead>
                    <tr style="text-align:center;">
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
                    <% if(orderList != null && !orderList.isEmpty()) { 
                        for(int i = 0; i < orderList.size(); i++) { 
                            int itemPrice = orderList.get(i).getOrdersFinalprice();
                            int itemQty = orderList.get(i).getOrdersTotqty();
                    %>
                    <tr >
                        <td><button type="button" class="basicBtn ordersBtn" onclick="submitForm('detail',<%=orderList.get(i).getOrdersNo()%> )">주문상세</button></td>
                        <td><%=orderList.get(i).getOrdersNo() %></td>
                        <td><%=dateFormat.format(orderList.get(i).getOrdersDate()) %></td>
						 <% if(orderList.get(i).getOrdersStatus().equals("구매확정")) { %>
	                        <td style="color:tomato;"><%=dateFormat.format(orderList.get(i).getOrdersArrivaldate()) %></td>
	                          <% } else { %>
	                        <td><%=orderList.get(i).getOrdersStatus() %></td>
                         <% } %>
                            
                        <td class="item-info"><%=orderList.get(i).getOrdersItemsList().get(0).getProduct().getProductName() %></td>
                        <td><%=orderList.get(i).getOrdersItemsList().size() %></td>
                        <td><%=decimalFormat.format(itemPrice) %>원</td>
                        <td>
                            <% if(orderList.get(i).getOrdersStatus().equals("구매확정")) { %>
                                <button type="button" class="basicBtn purchaseConfirmedBtn" disabled>구매확정</button>
                            <% } else { %>
                                <button type="button" class="basicBtn purchaseBtn" onclick="submitForm('purchaseConfirmed',<%=orderList.get(i).getOrdersNo()%>)">구매확정</button>
                            <% } %>
                        </td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="8">상품 정보가 없습니다.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </form>
    </div>

    <script>
        function submitForm(action, ordersNo) {
            let form = document.getElementById('orderForm');
            let input = document.querySelector('input[name="ordersNo"]');
            input.value = ordersNo; // hidden input에 주문 번호를 설정
            if(action === 'detail'){
                form.action = 'order_detail_view.jsp';
            } else if(action === 'purchaseConfirmed'){
                form.action = 'orders_confirmed_action.jsp';        
            }
            form.method = 'POST';
            form.submit();
        }
    </script>
</body>
</html>
