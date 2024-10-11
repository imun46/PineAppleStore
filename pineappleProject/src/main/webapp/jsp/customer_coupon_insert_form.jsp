<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 등록</title>

<script type="text/javascript">
	function customerCouponInsertAction() {
		document.f.action = "customer_coupon_insert_action.jsp";
		document.f.method="POST";
		document.f.submit();
	}
</script>
	
</head>
<body>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: white;
			display: flex;
			justify-content: center;
			align-items: center;
			height: 100vh;
			margin: 0;
		}
		
		.container {
			background-color: white;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
			text-align: center;
			width: 300px;
		}
		
		h1 {
			font-size: 24px;
			margin-bottom: 20px;
		}
		
		input[type="text"] {
			width: 100%;
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 5px;
			margin-bottom: 20px;
			font-size: 16px;
			box-sizing: border-box;
		}
		
		button {
			width: 50%;
			padding: 10px;
			background-color: black;
			border: none;
			border-radius: 5px;
			font-size: 16px;
			color: white;
			cursor: pointer;
		}
</style>
	<form name="f" method="post">
	<div class="container">
	<h1>쿠폰 등록</h1>
			<!-- 쿠폰 일련번호 입력 -->	
			<input type="text" id="couponCode" style="width: 200px"	name="couponId" 
			value="" placeholder="쿠폰코드를 입력하세요">
			<!-- 쿠폰 등록하기 클릭 시 insertAction -->
			<button class="submiBtn" onClick="customerCouponInsertAction()">쿠폰 등록하기</button>
	</div>
</form>
			
</body>
</html>