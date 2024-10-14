<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.domain.Cart"%>
<%@page import="com.itwill.shop.domain.Product"%>
<%@page import="com.itwill.shop.domain.ProductSelected"%>
<%@page import="com.itwill.shop.domain.ProductSelectedDetail"%>
<%@page import="com.itwill.shop.service.CartService" %>
<%@page import="com.itwill.shop.service.ProductService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="customer_login_check.jspf"  %>    
<%

	int customerNo = Integer.parseInt((String)session.getAttribute("sCustomerNo"));

    CartService cartService = new CartService();
    List<Cart> cartList = cartService.findByCustomerNo(customerNo);
    java.text.DecimalFormat decimalFormat = new java.text.DecimalFormat("#,###");
    int totQty = 0;
    for(Cart cart : cartList) {
    	totQty += cart.getCartQty();
    }
    /*
    // 카트 번호 리스트 세션에 추가
    int[] cartNo = {};
    for(int i=0; i<cartList.size(); i++) {
    	cartNo[i] = cartList.get(i).getCartNo();
	    System.out.println(cartNo[i]);
    }
    session.setAttribute("cartNo", cartNo);
    */
    
    ProductService productService = new ProductService();
    for (int i=0; i<cartList.size(); i++) {
    	int productNo = cartList.get(i).getProduct().getProductNo();
    	String productImageFile = productService.productDetail(productNo).getProductImageList().get(0).getProductImageFile();
    	cartList.get(i).getProduct().getProductImageList().get(0).setProductImageFile(productImageFile);
    }
    
    
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
   	
    <script src="https://kit.fontawesome.com/2452117347.js" crossorigin="anonymous"></script>
    <style>
        .cart-container {
			max-width: 1000px;
			margin: 40px auto;
			padding: 20px;
			border: 1px solid #ccc;
			border-radius: 10px;
			box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
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
        .basic-btn {
			padding: 10px 25px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			font-weight: bold;
        }
        .btn-purchase {
			background-color: #212529; 
			border-color: #212529; 
			border: 1px solid #212529; 
			color:#fff;
        }
		.btn-purchase:hover {
			background-color: #fff; /* 호버 시 배경색 */
			border-color: #fff; /* 호버 시 경계 색상 */
			border: 1px solid #212529; /* 버튼 경계 색상 */
			color:#212529;
		}
        .btn-secondary {
            background-color: #fff;
            color: #000;
            border: 1px solid #000;
        }
		.btn-secondary:hover {
		    background-color: #212529;
		    color: #fff;
		    border: 1px solid #212529;
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
        
        .bold-black-link {
		    font-weight: bold;
		    color: black;
		    text-decoration: none;
		}
        
        .quantity-container {
            display: flex;
            align-items: center;
            justify-content: flex-start;
        }

        .quantity-container input {
            text-align: center;
            width: 50px;
            height: 30px;
            border: none; 
            
        }

        .quantity-container button {
            padding: 5px 10px;
            margin: 0 5px;
            cursor: pointer;
             border: none; 
			    border-radius: 5px; /* 모서리 둥글게 */
        }
        
    </style>
</head>
<body>
<jsp:include page="../includes/include_top_menu.jsp"></jsp:include> 
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-dark">
            <h1 class="display-4 fw-bolder">장바구니</h1>
        </div>
    </div>
</header>
<form name="cart_view_form" style="margin:0">
    <input type="hidden" name="buyType">
</form>

<section>
    <form name="cart_form" id="cartForm" style="margin: 0;"> <!-- 삭제를 위한 폼 추가 -->
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
                for(Cart cart : cartList) {
                	int cartNo = cart.getCartNo();
                	// 카트 아이템 가격 계산
                	int itemEachPrice = cart.getProduct().getProductPrice();
                	// 카트 옵션 이름들
                	String itemsOptions = "";
       				// 옵션 번호 문자열 합
                	String productOptionDetailNos = "";
                	
       				
       				for (int i=0; i<cart.getProductSelectedList().size(); i++) {
                		for(int j=0; j<cart.getProductSelectedList().get(i).getProductSelectedDetailList().size(); j++) {
                			itemEachPrice += cart.getProductSelectedList().get(i).getProductSelectedDetailList().get(j).getProductOptionDetail().getProductOptionDetailPrice();
                			itemsOptions += cart.getProductSelectedList().get(i).getProductSelectedDetailList().get(j).getProductOptionDetail().getProductOptionDetailName()+", ";
                			productOptionDetailNos += cart.getProductSelectedList().get(i).getProductSelectedDetailList().get(j).getProductOptionDetail().getProductOptionDetailNo()+",";
                		}
                	}
       				itemsOptions = itemsOptions.replaceAll(", $", "");
                	int itemTotprice = itemEachPrice*cart.getCartQty();
            %>
            <div class="cart-item">
                <div class="item-info">
                    <input type="hidden" name="cartNo" 					value="<%=cart.getCartNo() 						%>"></input>
                    <input type="hidden" name="itemsPrice"				value="<%=itemTotprice 							%>"></input>
               		<input type="hidden" name="itemsPrice_<%= cart.getCartNo() %>" value="<%= itemTotprice %>">
       				<!-- 
                    <input type="hidden" name="itemsQty[]" 				value="<%=cart.getCartQty() 					%>"></input>
       				 -->
                    <input type="hidden" name="itemsPrice_<%= cart.getCartNo() %>" value="<%= itemTotprice %>">
                    <input type="hidden" name="itemsOptions"			value="<%=itemsOptions 							%>"></input>
                    <input type="hidden" name="productNo" 				value="<%=cart.getProduct().getProductNo() 		%>"></input>
                    <input type="hidden" name="productName" 		    value="<%=cart.getProduct().getProductName() 	%>"></input>
                    
                    <input class='product_select' type="checkbox" name="selectItem" onchange="updatePrice()">
                    <a href="product_detail_form.jsp?product_no=<%= cart.getProduct().getProductNo() %>">
                    	<img src="../product_image/<%=cart.getProduct().getProductImageList().get(0).getProductImageFile() %>" alt="<%= cart.getProductSelectedList() %>">
                    </a>
                    <div class="item-details">
						<a href="product_detail_form.jsp?product_no=<%= cart.getProduct().getProductNo() %>" class="bold-black-link">
    						상품명: <%= cart.getProduct().getProductName() %>
						</a>
							<%
							    String options = "";
								int total = 0;
							    for (int i = 0; i < cart.getProductSelectedList().size(); i++) {
							        for (int j = 0; j < cart.getProductSelectedList().get(i).getProductSelectedDetailList().size(); j++) {
							            options += cart.getProductSelectedList().get(i).getProductSelectedDetailList().get(j)
							                            .getProductOptionDetail().getProductOption().getProductOptionType() +
							                       " - " + cart.getProductSelectedList().get(i).getProductSelectedDetailList().get(j)
							                            .getProductOptionDetail().getProductOptionDetailName() + "(+ " + decimalFormat.format(cart.getProductSelectedList().get(i).getProductSelectedDetailList().get(j).getProductOptionDetail().getProductOptionDetailPrice())
							                            		+"원)<br>"; // 줄바꿈 추가
							                            		 
							            total = cart.getProduct().getProductPrice() + cart.getProductSelectedList().get(i).getProductSelectedDetailList().get(j).getProductOptionDetail().getProductOptionDetailPrice();
							        }
							    }
							%>
                        <span style="font-size: 13px;"><%=options %> </span>
                        <!-- ******************************************수량 관련 내용********************************************************** -->
<div class="quantity-container">
    <span>수량:  </span>

    <!-- Correctly pass cartNo as a number -->
    <button type="button" onclick="changeQuantity(-1, <%= cartNo %>)">-</button>

    <!-- Assign a unique ID to the input -->
    <input type="text" name="quantity_<%= cartNo %>" id="quantity_<%= cartNo %>" value="<%= cart.getCartQty() %>" 
           onblur="validateQuantity(<%= cartNo %>)" 
           onchange="updateItemPrice(<%= cartNo %>)">

    <!-- Correctly pass cartNo as a number -->
    <button type="button" onclick="changeQuantity(1, <%= cartNo %>)">+</button>
</div>

                        <!-- ************************************************************************************************************** -->
                    </div>
                </div>
				<div class="item-price" id="itemPrice_<%= cart.getCartNo() %>">
    				가격: <span class="price-value"><%= decimalFormat.format(itemTotprice) %></span> 원
				</div>
                <input type="hidden" name="unitPrice_<%= cartNo %>" value="<%= itemEachPrice %>">
                
            </div>
            <%
                }
            %>
            <div class="item-price" style="display: flex; justify-content: flex-end;">
                    <input type="hidden" name="ordersTotprice" value=""></input>
                    <input type="hidden" name="ordersTotqty"   value="<%=totQty%>"></input>
                <span>상품 총 금액:</span>
                <span id="total_price">0</span>
                <span>원</span>
            </div>
            <div class="actions" style="justify-content: center; gap: 20px;">
                <button class="basic-btn btn-secondary" type="button">옵션변경</button>
                <button class="basic-btn btn-purchase" type="button" onclick="submitPurchase()">바로주문</button>
            </div>
        </div>
    </form>
</section>

<script>
    document.getElementById('selectAll').addEventListener('change', checkAll);
    document.addEventListener('DOMContentLoaded', function () {
        console.log("Page is fully loaded, enabling inputs...");
        enableAllInputs();  // Enable all inputs when the page is loaded
    });

    // Enable all inputs and checkboxes
	function enableAllInputs() {
    	const inputs = document.querySelectorAll('.cart-item input');
    	inputs.forEach(input => {
  	      console.log("Enabling input: ", input);  // Log each input for debugging
  	      input.disabled = false; // Ensure all inputs are explicitly enabled
  	      input.removeAttribute('disabled'); // Remove 'disabled' attribute if present
  	  });

  	  const checkboxes = document.querySelectorAll('.product_select');
  	  checkboxes.forEach(checkbox => {
  	      console.log("Enabling checkbox: ", checkbox);  // Log each checkbox for debugging
  	      checkbox.disabled = false; // Ensure checkbox is explicitly enabled
  	      checkbox.removeAttribute('disabled'); // Remove 'disabled' attribute if present
    });
}
    
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
		document.querySelector('input[name="ordersTotprice"]').value = total;

    }
    
    function cart_delete_action() {
        var selectedItems = document.querySelectorAll('.product_select:checked');
        var cartNos = []; // 선택된 cart_no를 저장할 배열
        
        selectedItems.forEach(function(item) {
            // 선택된 항목의 cart_no 값을 수집
            var cartNo = item.closest('.cart-item').querySelector('input[name="cartNo"]').value;
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
    
    function submitPurchase() {
		var form = document.getElementById('cartForm');
		
        var selectedItems = document.querySelectorAll('.product_select:checked');
        
        if (selectedItems.length === 0) {
            alert('구매를 원하시는 제품을 체크해주세요.');
            return;
        }

        // Disable inputs for unselected items to prevent them from being submitted
        var allItems = document.querySelectorAll('.cart-item');
        allItems.forEach(function(item) {
            var checkbox = item.querySelector('.product_select');
            if (!checkbox.checked) {
                var inputs = item.querySelectorAll('input');
                inputs.forEach(function(input) {
                    input.disabled = true;
                });
            }
        });

		form.action = 'orders_ready_action.jsp';
		form.method = 'POST';
		form.submit();
    }
    
    
    
    
    // 수량 수정 관련
// Function to change quantity and update the price dynamically
function changeQuantity(change, cartNo) {
    var quantityInputId = 'quantity_' + cartNo;
    var quantityInput = document.getElementById(quantityInputId);

    // Check if the element exists
    if (quantityInput) {
        var currentQuantity = parseInt(quantityInput.value);

        // Ensure currentQuantity is a valid number, otherwise set it to 1
        if (isNaN(currentQuantity)) {
            currentQuantity = 1;
        }

        // Update the quantity based on the change, but don't allow it to go below 1
        var newQuantity = currentQuantity + change;
        if (newQuantity >= 1) {
            quantityInput.value = newQuantity;  // Set the new value in the input field
        }
		
        // 데이터베이스 업데이트
        updateQuantityInDatabase(cartNo, newQuantity);
        
        // Update the item price based on the new quantity
        updateItemPrice(cartNo);
        updateTotalPrice();  // Update the total cart price
    } else {
        console.error('Element with ID ' + quantityInputId + ' not found.');
    }
}

// Function to validate quantity and ensure it's a valid number
function validateQuantity(cartNo) {
    var quantityInputId = 'quantity_' + cartNo;
    var quantityInput = document.getElementById(quantityInputId);

    if (quantityInput) {
        var currentQuantity = parseInt(quantityInput.value);

        // If the input is not a valid number or less than 1, reset it to 1
        if (isNaN(currentQuantity) || currentQuantity < 1) {
            quantityInput.value = 1;
        }

        // Update the item price after validation
        updateItemPrice(cartNo);
        updateTotalPrice();  // Update the total cart price
    } else {
        console.error('Quantity input not found for cartNo: ' + cartNo);
    }
}

// Function to update the price for a specific item
function updateItemPrice(cartNo) {
    var quantityInputId = 'quantity_' + cartNo;
    var quantityInput = document.getElementById(quantityInputId);

    if (quantityInput) {
        var quantity = parseInt(quantityInput.value);

        // Get the unit price element (this is the price for 1 quantity)
        var unitPriceElement = document.querySelector('input[name="unitPrice_' + cartNo + '"]');

        // Check if the unitPriceElement exists
        if (unitPriceElement) {
            var unitPrice = parseFloat(unitPriceElement.value);

            // Calculate the new item price (unit price * quantity)
            var newItemPrice = unitPrice * quantity;

            // Update only the numeric part of the price (within the span)
            var itemPriceDisplay = document.querySelector('#itemPrice_' + cartNo + ' .price-value');
            if (itemPriceDisplay) {
                itemPriceDisplay.innerText = newItemPrice.toLocaleString();
            }
        } else {
            console.error('Unit price element not found for cartNo: ' + cartNo);
        }
    } else {
        console.error('Quantity input not found for cartNo: ' + cartNo);
    }
}

// Function to update the total price for all selected items
function updateTotalPrice() {
    var total = 0;

    // Loop through all cart items and calculate the total price
    document.querySelectorAll('.cart-item').forEach(function(item) {
        var itemPriceElement = item.querySelector('.item-price');
        if (itemPriceElement) {
            var itemPrice = parseInt(itemPriceElement.textContent.replace(/[^0-9]/g, ''));
            total += itemPrice;
        }
    });

    // Update the total price in the UI
    var totalPriceElement = document.getElementById('total_price');
    if (totalPriceElement) {
        totalPriceElement.innerText = total.toLocaleString() + ' 원';
    }

    var ordersTotPriceInput = document.querySelector('input[name="ordersTotprice"]');
    if (ordersTotPriceInput) {
        ordersTotPriceInput.value = total;
    }
}
    
    
    
	//Function to update quantity in the database via AJAX
	function updateQuantityInDatabase(cartNo, newQuantity) {
    	var xhr = new XMLHttpRequest();
    	xhr.open('POST', 'cart_update_quantity_action.jsp', true);
    	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    
    	// Prepare the data to send in the request
    	var params = 'cartNo=' + cartNo + '&newQuantity=' + newQuantity;
    
    	// Handle the response
    	xhr.onreadystatechange = function() {
       		if (xhr.readyState == 4 && xhr.status == 200) {
            	console.log('Quantity updated successfully for cartNo: ' + cartNo);
        	}
    	};

    	// Send the request with cartNo and newQuantity
    	xhr.send(params);
	}
    
    
    
</script>

</body>
</html>
