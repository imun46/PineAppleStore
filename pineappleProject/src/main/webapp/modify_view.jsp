<%@page import="com.itwill.shop.customer.CustomerCoupons"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String customerId = "IDEX1";
	CustomerService customerService = new CustomerService();
	Customer loginCustomer = customerService.findCustomerId(customerId);
	List<CustomerCoupons> customerCoupons = customerService.findCouponList(loginCustomer.getCustomerNo());
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		function customerModifyForm() {
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
			if (document.f.name.value == "") {
				alert("이름을 입력하십시요.");
				document.f.name.focus();
				return false;
			}
			if (document.f.email.value == "") {
				alert("이메일 주소를 입력하십시요.");
				document.f.email.focus();
				return false;
			}
			if (document.f.password.value != f.password2.value) {
				alert("비밀번호와 비밀번호확인은 일치하여야합니다.");
				document.f.password.focus();
				document.f.password.select();
				return false;
			}
			
			document.f.action = "modify_form.jsp";
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
			<%=loginCustomer.getCustomerPassword() %>
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
			<%=loginCustomer.getCustomerAddress()%>
			</td>
		</tr>
		<!-- 사용자 성별 -->
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 성별 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<%=loginCustomer.getCustomerGender()%>
			</td>
		</tr>
		<!-- 사용자 전화번호 -->
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 전화번호 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<%=loginCustomer.getCustomerPhone()%>
			</td>
		</tr>
		<!-- 사용자 이메일 -->
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 이메일 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<%=loginCustomer.getCustomerEmail()%>
			</td>
		</tr>
		<!-- 사용자 닉네임 -->	
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 닉네임 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<%=loginCustomer.getCustomerNickname() %>
			</td>
		</tr>
		<!-- 사용자 가입날짜 -->
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">사용자 가입날짜 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<%=loginCustomer.getCustomerJoindate()%>
			</td>
		</tr>
		
		<!-- 사용자 쿠폰 리스트 -->
		<%for (CustomerCoupons customerCoupon : customerCoupons) { %>
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">쿠폰 이름 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<%=customerCoupon.getCoupon().getCouponName()%>
			</td>
		</tr>
		<% } %>
		
		
		</table>
	</form>
		<table width=590 border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td align=center><input type="button" value="내정보수정"
				onClick="customerModifyForm()"> &nbsp; <input type="button"
				value="메인" onClick="userMain()"></td>
			</tr>
		</table>
	

</body>
</html>