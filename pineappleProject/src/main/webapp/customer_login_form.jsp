<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css">
<script type="text/javascript">
	function customerCreateForm() {
		location.href = "customer_write_form.jsp";
	}

	function login() {
		if (document.f.customerId.value == "") {
			alert("아이디를 입력하세요.");
			document.f.customerId.focus();
			return;
		}
		if (document.f.password.value == "") {
			alert("비밀번호를 입력하세요.");
			f.password.focus();
			return;
		}

		document.f.action = "customer_login_action.jsp";
		document.f.method='POST';
		document.f.submit();
	}
</script>
<style>
	/* 화면 전체 중앙 정렬 및 배경 색상 */
	body, html {
		height: 100%;
		margin: 0;
		display: flex;
		justify-content: center;
		align-items: center;
		font-family: Arial, sans-serif;
		background-color: #f4f4f9;
	}

	/* 로그인 폼을 감싸는 요소 */
	#content {
		width: 100%;
		max-width: 400px;
		padding: 40px;
		background-color: white;
		border-radius: 8px;
		box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
		text-align: center;
	}

	/* 폼 제목 */
	h2 {
		color: #333;
		margin-bottom: 20px;
		font-size: 24px;
	}

	/* 입력 필드 스타일 */
	input[type="text"], input[type="password"] {
		width: 80%;
		padding: 10px;
		margin: 10px 0;
		border: 1px solid #ccc;
		border-radius: 4px;
		font-size: 16px;
	}

	/* 레이블과 입력 필드 간격 조정 */
	label {
		margin-right: 10px;
		display: inline-block;
		width: 100px;
		text-align: right;
	}

	/* 입력 항목 테이블 레이아웃 */
	form table {
		width: 100%;
		margin: 0 auto;
	}

	/* 버튼 스타일 */
	input[type="button"] {
		width: 100%;
		padding: 12px;
		background-color: #5cb85c;
		border: none;
		border-radius: 4px;
		color: white;
		font-size: 16px;
		cursor: pointer;
		margin-top: 10px;
	}

	input[type="button"]:hover {
		background-color: #4cae4c;
	}

	/* 회원가입 버튼 스타일 */
	.signup-btn {
		background-color: #0275d8;
	}

	.signup-btn:hover {
		background-color: #025aa5;
	}

	/* 경고 메시지 텍스트 */
	.error-msg {
		color: red;
		font-size: 14px;
		margin-top: 5px;
	}

	/* 테이블 중앙 정렬 */
	form table td {
		text-align: left; /* 각 셀의 내용을 왼쪽 정렬 */
	}

	/* 버튼 컨테이너 */
	.button-container {
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 100%;
	}
</style>


</head>
<body>
	<div id="content">
		<h2>로그인</h2>
		<form name="f">
			<table border="0" cellpadding="0" cellspacing="1">
				<tr>
					<td align="left"><label for="customerId">아이디</label></td>
					<td><input type="text" name="customerId" id="customerId" placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<td align="left"><label for="customerPassword">비밀번호</label></td>
					<td><input type="password" name="customerPassword" id="customerPassword" placeholder="비밀번호 입력"></td>
				</tr>
			</table>
			<div class="error-msg"></div>
			<input type="button" value="로그인" onClick="login();">
			<input type="button" value="회원가입" class="signup-btn" onClick="customerCreateForm()">
		</form>
	</div>
</body>
</html>
