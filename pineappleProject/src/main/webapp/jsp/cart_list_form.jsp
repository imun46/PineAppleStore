<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="com.itwill.shop.cart.CartService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CartService cartService = new CartService();
	List<Cart> cart = cartService.findByCustomerNo(1);
	java.text.DecimalFormat decimalFormat = new java.text.DecimalFormat("#,###");
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
        .item-price, .shipping-fee, .total-price {
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
<jsp:include page="includes/include_top_menu.jsp" />

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
	<form action="order">
	
    <div class="cart-container">
        <div class="select-all-container">
            <input type="checkbox" id="selectAll" name="selectAll" >
            <label for="selectAll" onchange="checkAll()">전체선택</label>
            
            <button class="btn btn-secondary" 
            	onclick="cart_delete_action()"
            	style="margin-left: auto; padding: 5px 8px; font-size: 12px" type="button">삭제</button>
        </div>
        
        <%
            for(Cart carts : cart) {
        %>
        <div class="cart-item">
            <div class="item-info">
            	<input type="hidden" name="cart_no" value="<%=carts.getCartNo() %>"></input>
                <input class='product_select' type="checkbox" name="selectItem" onchange="updatePrice()">
                <!-- 이미지 -->
                <img src="img/macBookAir.jpg" alt="<%= carts.getProductSelectedList().get(0).getProduct().getProductName() %>">
                
                <div class="item-details">
                    <span>상품명: <%= carts.getProductSelectedList().get(0).getProduct().getProductName() %></span>
                    <span>옵션: </span>
                    <span>수량: <input type="number" name="cart_qty %>" value="<%= carts.getCartQty() %>" min="1"></span>
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
            <span >상품 총 금액:</span>
            <span id="total_price"> 0 </span>
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
	// selectAll 체크박스 상태에 따라 모든 항목 선택/해제
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
	    // 선택된 체크박스를 모두 가져옴
	    var selectedItems = document.querySelectorAll('.product_select:checked');
	    var total = 0;
	    
	    selectedItems.forEach(function(item) {
	        // 각 선택된 항목의 가격을 가져와서 숫자만 추출
	        var itemPrice = item.closest('.cart-item').querySelector('.item-price').textContent;
	        var priceValue = parseInt(itemPrice.replace(/[^0-9]/g, '')); // 가격에서 숫자만 추출
	        total += priceValue;  // 가격 합산
	        
	        
	        
	        
	    });
	
	    // 총 금액을 업데이트 (toLocaleString()을 사용해 천 단위로 표시)
	    document.getElementById('total_price').innerText = total.toLocaleString();

		// selectAll 체크박스에 이벤트 리스너 추가
		document.getElementById('selectAll').addEventListener('change', checkAll);
		
		// 모든 개별 체크박스에 이벤트 리스너 추가
		document.querySelectorAll('.product_select').forEach(function(checkbox) {
		    checkbox.addEventListener('change', updatePrice);
		});
		
	}
	
	function cart_delete_action(){
		var selectedItems = document.querySelectorAll('.product_selected:checked');
		var cartNo = item.closest('.cart-item').querySelector('input[name="cart_no"]').value;
		
	    if (cartNos.length === 0) {
	        alert("삭제할 항목을 선택하세요.");
	    } else if (cartNos.length === 1) {
	        document.cart_delete_form.method = 'POST';
	        document.cart_delete_form.action = 'cart_delete_action';
	        document.cart_delete_form.submit();
	    } else if (cartNos.length > 1) {
	        document.cart_delete_form.method = 'POST';
	        document.cart_delete_form.action = 'cart_delete_all_action';
	        document.cart_delete_form.submit();
	    }
	}
	
</script>

</body>
</html>