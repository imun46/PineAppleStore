<%@page import="com.itwill.shop.customer.CustomerCoupons"%>
<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String customerId = "IDEX1";
	CustomerService customerService = new CustomerService();
	Customer loginCustomer = customerService.findCustomerId(customerId);
	
	customerService.findCouponList(loginCustomer.getCustomerNo());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		function customerModifyAction() {
			document.f.action = "modify_action.jsp";
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
			<%=loginCustomer.getCustomerDob() %>
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
			<%=loginCustomer.getCustomerJoindate()%>
			</td>
		</tr>
		
		</table>
	</form>
		<table width=590 border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td align=center><input type="button" value="내정보수정"
				onClick="customerModifyAction()"> &nbsp; <input type="button"
				value="메인" onClick="userMain()"></td>
			</tr>
		</table>
	

</body>
</html>