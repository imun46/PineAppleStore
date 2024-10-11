<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.domain.Cart"%>
<<<<<<< HEAD
<%@page import="com.itwill.shop.domain.ProductSelected"%>
=======
>>>>>>> branch 'newMaster' of https://github.com/2024-07-JAVA-DEVELOPER-155/web-project-team1-pineapple.git
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
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
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
    <form name="cart_form" style="margin: 0;"> <!-- 삭제를 위한 폼 추가 -->
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
                    <input type="hidden" name="cart_qty" value="<%= carts.getCartQty() %>"></input>
                    <input type="hidden" name="product_price" value="carts.getProduct().getProductPrice()"></input>
                    
                    <input class='product_select' type="checkbox" name="selectItem" onchange="updatePrice()">
                    <img src="../img/macBookAir.jpg" alt="<%= carts.getProductSelectedList() %>">
                    
                    <div class="item-details">
                        <span>상품명: <%= carts.getProduct().getProductName() %></span>
							<%
							    String options = "";
								int total = 0;
							    for (int i = 0; i < carts.getProductSelectedList().size(); i++) {
							        for (int j = 0; j < carts.getProductSelectedList().get(i).getProductSelectedDetailList().size(); j++) {
							            options += carts.getProductSelectedList().get(i).getProductSelectedDetailList().get(j)
							                            .getProductOptionDetail().getProductOption().getProductOptionType() +
							                       " - " + carts.getProductSelectedList().get(i).getProductSelectedDetailList().get(j)
							                            .getProductOptionDetail().getProductOptionDetailName() + "(+ " + decimalFormat.format(carts.getProductSelectedList().get(i).getProductSelectedDetailList().get(j).getProductOptionDetail().getProductOptionDetailPrice())
							                            		+"원)<br>"; // 줄바꿈 추가
							                            		
							            total = carts.getProduct().getProductPrice() + carts.getProductSelectedList().get(i).getProductSelectedDetailList().get(j).getProductOptionDetail().getProductOptionDetailPrice();
							        }
							    }
							%>
                        <span style="font-size: 13px;"><%=options %> </span>
                        <span>수량: <%= carts.getCartQty() %> </span>
                    </div>
                </div>
                <div class="item-price">
                	가격: <%= decimalFormat.format(total) %> 원
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
        var cartDeleteForm = document.cart_form;

        // 기존에 있는 hidden input 제거
        while (cartDeleteForm.firstChild) {
            cartDeleteForm.removeChild(cartDeleteForm.firstChild);
        }

        // 선택된 cart_no를 hidden input으로 추가
        cartNos.forEach(function(cartNo) {
            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'cart_no'; // 같은 이름으로 여러 개 추가 가능
            input.value = cartNo;
            cartDeleteForm.appendChild(input);
        });

        // 삭제 요청을 보낼 action 설정
        cartDeleteForm.action = 'cart_delete_action.jsp';
        cartDeleteForm.method = 'POST'; // POST 방식으로 전송
        cartDeleteForm.submit(); // 폼 제출
    }
</script>

</body>
</html>
