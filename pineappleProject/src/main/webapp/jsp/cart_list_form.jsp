<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="com.itwill.shop.cart.CartService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CartService cartService = new CartService();
	List<Cart> cart = cartService.findByCustomerNo(1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="styles.css" rel="stylesheet" type="text/css" />
	<!-- fontawesome icon-->
	<script src="https://kit.fontawesome.com/2452117347.js" crossorigin="anonymous"></script>
	<style>
        td {
            padding: 5px;
        }
    </style>
	<script>
        // 수량 업데이트 함수
        function updateQuantity(id, delta) {
            const quantityElement = document.querySelector(`#cartQty-${id}`);
            let currentQuantity = parseInt(quantityElement.innerText);

            // 수량이 1 이상일 때만 감소 가능
            if (currentQuantity + delta > 0) {
                currentQuantity += delta;
                quantityElement.innerText = currentQuantity; // 수량 표시 부분 업데이트
            }
        }
    </script>
</head>
<body>
<jsp:include page="includes/include_top_menu.jsp" />
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">장바구니</h1>
        </div>
    </div>
</header>

<section>
    <table style="margin: 10px auto 0 auto; width: 600px; height: 120px; border: 1px solid #ccc; border-radius: 20px; padding: 3px 10px;">
    <%for(int i=0; i < cart.size(); i ++){ %>
        <tr>   
            <td><input type="checkbox"></td>
            <td rowspan="2" style="width: 150px;"><img src="macBookAir.jpg" alt="" style="width: 120px; height: 120px;"></td>
            <td>상품이름</td>
            <td></td>
            <td></td>
            <td style="text-align: right;">
                <button>
                    <i class="fa-solid fa-circle-xmark"></i>
                </button>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>옵션정보 String</td>
            <td>
                <button onclick="updateQuantity(1, -1)">-</button>
                <span id="cartQty-1">1</span>
                <button onclick="updateQuantity(1, 1)">+</button>
            </td>
            <td></td>
        </tr>
        <%} %>
    </table>
</section>

</body>
</html>