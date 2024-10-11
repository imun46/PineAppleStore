<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.domain.Cart"%>
<%@page import="com.itwill.shop.service.CartService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int customerNo = 1;
    CartService cartService = new CartService();
    List<Cart> cart = cartService.findByCustomerNo(1);
    java.text.DecimalFormat decimalFormat = new java.text.DecimalFormat("#,###");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
   
    <script src="https://kit.fontawesome.com/2452117347.js" crossorigin="anonymous"></script>
    <style>
        .cart-container {
            width: 80%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
        }
        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
        }
        .item-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .item-info img {
            width: 100px;
            height: auto;
        }
        .item-details {
            display: flex;
            flex-direction: column;
        }
        .item-price {
            text-align: right;
            margin-top: 10px;
            font-weight: bold;
        }
        .actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .btn {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn-primary {
            background-color: #000;
            color: #fff;
            border: none;
        }
        .btn-secondary {
            background-color: #fff;
            color: #000;
            border: 1px solid #000;
        }
        .select-all-container {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .select-all-container label {
            margin-left: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="../includes/include_top_menu.jsp" />

<form name="cart_view_form" style="margin:0">
    <input type="hidden" name="buyType">
</form>
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">장바구니</h1>
        </div>
    </div>
</header>

<section>
    <form name="cart_delete_form" style="margin: 0;"> <!-- 삭제를 위한 폼 추가 -->
        <input type="hidden" name="customer_no" value="<%= customerNo %>"> <!-- customer_no 추가 -->
        <div class="cart-container">
            <div class="select-all-container">
                <input type="checkbox" id="selectAll" name="selectAll">
                <label for="selectAll">전체선택</label>
                
                <button class="btn btn-secondary" 
                    onclick="cart_delete_action()"
                    style="margin-left: auto; padding: 5px 8px; font-size: 12px" type="button">삭제</button>
            </div>
            
            <%
                for(Cart carts : cart) {
            %>
            <div class="cart-item">
                <div class="item-info">
                    <input type="hidden" name="cart_no" value="<%=carts.getCartNo() %>">
                    <input class='product_select' type="checkbox" name="selectItem" onchange="updatePrice()">
                    <img src="../img/macBookAir.jpg" alt="<%= carts.getProductSelectedList().get(0).getProduct().getProductName() %>">
                    
                    <div class="item-details">
                        <span>상품명: <%= carts.getProductSelectedList().get(0).getProduct().getProductName() %></span>
                        <span>옵션: </span>
                        <span>수량: <input type="number" name="cart_qty" value="<%= carts.getCartQty() %>" min="1"></span>
                    </div>
                </div>
                <div class="item-price">
                   <%= decimalFormat.format(carts.getProductSelectedList().get(0).getProduct().getProductPrice()) %> 원                     
                </div>
            </div>
            <%
                }
            %>


            <div class="item-price" style="display: flex; justify-content: flex-end;">
                <span>상품 총 금액:</span>
                <span id="total_price">0</span>
                <span>원</span>
            </div>
            <div class="actions" style="justify-content: center; gap: 20px;">
                <button class="btn btn-secondary" type="button">옵션변경</button>
                <button class="btn btn-primary" type="submit">바로주문</button>
            </div>
        </div>
    </form>
</section>

<script>
    document.getElementById('selectAll').addEventListener('change', checkAll);
    
    function checkAll() {
        var selectAllCheckbox = document.getElementById('selectAll');
        var productCheckboxes = document.querySelectorAll('.product_select');

        productCheckboxes.forEach(function(checkbox) {
            checkbox.checked = selectAllCheckbox.checked;  // selectAll 체크박스의 상태에 맞춰서 개별 체크박스도 선택/해제
        });

        // 가격을 업데이트
        updatePrice();
    }
   
    function updatePrice() {
        var selectedItems = document.querySelectorAll('.product_select:checked');
        var total = 0;
        
        selectedItems.forEach(function(item) {
            var itemPrice = item.closest('.cart-item').querySelector('.item-price').textContent;
            var priceValue = parseInt(itemPrice.replace(/[^0-9]/g, '')); // 가격에서 숫자만 추출
            total += priceValue;  // 가격 합산
        });
    
        // 총 금액을 업데이트
        document.getElementById('total_price').innerText = total.toLocaleString();
    }
    
    function cart_delete_action() {
        var selectedItems = document.querySelectorAll('.product_select:checked');
        var cartNos = []; // 선택된 cart_no를 저장할 배열
        
        selectedItems.forEach(function(item) {
            // 선택된 항목의 cart_no 값을 수집
            var cartNo = item.closest('.cart-item').querySelector('input[name="cart_no"]').value;
            cartNos.push(cartNo);
        });
        
        if (cartNos.length === 0) {
            alert("삭제할 항목을 선택하세요.");
            return;
        }

        // hidden input을 통해 cart_no 값 전송
        var cartDeleteForm = document.cart_delete_form;

        // 기존에 있는 hidden input 제거
        while (cartDeleteForm.firstChild) {
            cartDeleteForm.removeChild(cartDeleteForm.firstChild);
        }

        // customer_no를 hidden input으로 추가
        var hiddenCustomerNo = document.createElement('input');
        hiddenCustomerNo.type = 'hidden';
        hiddenCustomerNo.name = 'customer_no'; // 서버에서 받을 이름
        hiddenCustomerNo.value = "<%= customerNo %>"; // customer_no 값
        cartDeleteForm.appendChild(hiddenCustomerNo);

        // cart_no를 hidden input으로 추가
        cartNos.forEach(function(cartNo) {
            var hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = 'cart_no'; // 서버에서 받을 이름
            hiddenInput.value = cartNo; // cart_no 값
            cartDeleteForm.appendChild(hiddenInput);
        });

        // 삭제 요청을 보낼 action 설정
        if (cartNos.length === 1) {
            cartDeleteForm.action = 'cart_delete_action.jsp';
        } else {
            cartDeleteForm.action = 'cart_delete_all_action.jsp';
        }

        cartDeleteForm.method = 'POST'; // POST 방식으로 전송
        cartDeleteForm.submit(); // 폼 제출
    }
</script>

</body>
</html>
