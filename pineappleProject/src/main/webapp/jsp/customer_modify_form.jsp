<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.customer.CustomerCoupons"%>
<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="jsp/includes/login_check.jspf"  %>    
<%	

	CustomerService customerService = new CustomerService();

	int customerNo = Integer.parseInt(sCustomerNo);
	Customer loginCustomer = customerService.findCustomerNo(customerNo);
	
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); 
	
	/*** 서비스 선언 ***/
	//CustomerService customerService = new CustomerService();

	/*** 로그인 아이디 부여 ***/
	//Customer loginCustomer = customerService.findCustomerId(sCustomerNo);

	
	/*** 날짜 포멧 ***/
	//SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); 
	
	/*** 사용자 보유 쿠폰 리스트 조회 ***/
	//customerService.findCouponList(loginCustomer.getCustomerNo());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		function customerModifyAction() {
			if (document.f.password.value == "") {
				alert("비밀번호를 입력하십시요.");
				document.f.password.focus();
				return false;
			}
			if (document.f.password2.value == "") {
				alert("비밀번호확인을 입력하십시요.");
				document.f.password2.focus();
				return false;
			}
			if (document.f.address.value == "") {
				alert("주소를 입력하십시요.");
				document.f.address.focus();
				return false;
			}
			if (document.f.gender.value == "") {
				alert("성별을 입력하십시요.");
				document.f.gender.focus();
				return false;
			}
			if (document.f.phone.value == "") {
				alert("전화번호를 입력하십시요.");
				document.f.phone.focus();
				return false;
			}
			if (document.f.email.value == "") {
				alert("이메일 주소를 입력하십시요.");
				document.f.email.focus();
				return false;
			}
			if (document.f.nickname.value == "") {
				alert("닉네임을 입력하십시요.");
				document.f.nickname.focus();
				return false;
			}
			if (document.f.password.value != f.password2.value) {
				alert("비밀번호와 비밀번호확인은 일치하여야합니다.");
				document.f.password.focus();
				document.f.password.select();
				return false;
			}
			
			document.f.action = "customer_modify_action.jsp";
			document.f.method='POST';
			document.f.submit();
		}
		
		function customerMain() {
			
			document.f.action = "jsp/index.jsp";
			document.f.method='POST';
			document.f.submit();
		}
</script>
</head>
<body>
<form name="f" method="post">
	<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
		<!-- 사용자 아이디 -->
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 아이디 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<%=loginCustomer.getCustomerId() %>
			</td>
		</tr>
		<!-- 사용자 비밀번호 -->	
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 비밀번호 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<input type="password" style="width: 150px"	name="password" 
			value="<%=loginCustomer.getCustomerPassword() %>">
			</td>
		</tr>
		<!-- 사용자 비밀번호 확인 -->	
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 비밀번호 확인 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<input type="password" style="width: 150px"	name="password2" 
			value="">
			</td>
		</tr>
		<!-- 사용자 이름 -->	
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 이름 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			
			<%=loginCustomer.getCustomerName() %>
			</td>
		</tr>
		<!-- 사용자 생년월일 -->	
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 생년월일 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<%=simpleDateFormat.format(loginCustomer.getCustomerDob()) %>
			</td>
		</tr>
		
		<!-- 사용자 주소 -->
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 주소 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<input type="text" style="width: 150px"	name="address" 
			value="<%=loginCustomer.getCustomerAddress()%>">
			</td>
		</tr>
		<!-- 사용자 성별 -->
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 성별 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<input type="text" style="width: 150px"	name="gender" 
			value="<%=loginCustomer.getCustomerGender()%>">
			</td>
		</tr>
		<!-- 사용자 전화번호 -->
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 전화번호 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<input type="text" style="width: 150px"	name="phone" 
			value="<%=loginCustomer.getCustomerPhone()%>">
			</td>
		</tr>
		<!-- 사용자 이메일 -->
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 이메일 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<input type="text" style="width: 150px"	name="email" 
			value="<%=loginCustomer.getCustomerEmail()%>">
			</td>
		</tr>
		<!-- 사용자 닉네임 -->	
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 닉네임 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<input type="text" style="width: 150px"	name="nickname" 
			value="<%=loginCustomer.getCustomerNickname() %>">
			</td>
		</tr>
		<!-- 사용자 가입날짜 -->
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 가입날짜 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<%=simpleDateFormat.format(loginCustomer.getCustomerJoindate())%>
			</td>
		</tr>
		
		</table>
	</form>
		<table width=590 border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td align=center><input type="button" value="내정보수정"
				onClick="customerModifyAction()"> &nbsp; <input type="button"
				value="메인" onClick="customerMain()"></td>
			</tr>
		</table>
	

</body>
</html>