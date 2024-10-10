<%@page import="com.itwill.shop.customer.CustomerCoupons"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="jsp/includes/login_check.jspf"  %>
    
<%
	/*** 서비스 객체 생성***/
	CustomerService customerService = new CustomerService();
	
	/*** 아이디번호 가져와 int로 형변환 후 Customer객체 생성 ***/
	int customerNo = Integer.parseInt(sCustomerNo);
	Customer loginCustomer = customerService.findCustomerNo(customerNo);
	
	/*** 날짜 포맷 설정 ***/
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	/*** 쿠폰 리스트 객체 생성 ***/
	List<CustomerCoupons> customerCoupons = customerService.findCouponList(loginCustomer.getCustomerNo());
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function customerCouponInsert() {
	
		/* document.f.action = "customer_coupon_insert.jsp" */
		popuWindow = window.open("customer_coupon_insert_form.jsp", "popupWindow", "width=600,height=400,scrollbars=yes");
		document.f.method = 'POST';
		document.f.submit();
		
	}
	
	function customerMain() {
		document.f.action = "jsp/index.jsp"
		document.f.method = 'POST';
		document.f.submit();
	}
	
	 // 부모 창 새로 고침
    function refreshParent() {
        window.location.reload();
    }
	 
	function customerCouponUpdate() {
		let selectedCoupon =  document.querySelector('input[name="selectedCoupon"]:checked');
		document.f.action = "customer_coupon_update_action.jsp";
		document.f.method = 'POST';
		document.f.submit();
	}
	
	function customerModifyView() {
		document.f.action="customer_modify_view.jsp"
		document.f.method='POST';
		document.f.submit();
	}
</script>
</head>
<body>
<form name="f" method="post">
		<%for (CustomerCoupons customerCoupon : customerCoupons) { %>
	<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB" style="border: 2px solid gray;">
		<!-- 사용자 쿠폰 리스트 -->
		<!-- 쿠폰 이름 -->
		<tr>
			<!-- 선택한 쿠폰 정보 가져올 라디오 버튼 -->
			<td width=30 align=center bgcolor="E6ECDE" heigth="22">
            <input type="radio" name="selectedCoupon" value="<%= customerCoupon.getCustomerCouponsNo() %>">
            </td>
            
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">쿠폰 이름 : </td>
            <td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
                <%= customerCoupon.getCoupon().getCouponName() %>
            </td>
		</tr>
		<!-- 쿠폰 설명 -->
		<tr>
            <td bgcolor="ffffff" colspan="3" align="left">
            	<!-- 쿠폰 설명 -->
                쿠폰 설명 : <%=customerCoupon.getCoupon().getCouponDesc()%><br>
                <!-- 쿠폰 상태 -->
                쿠폰 상태 : <%=customerCoupon.getCustomerCouponsStatus()%><br>
                <!-- 쿠폰 만료일   --> 
                쿠폰 만료일 : <%=simpleDateFormat.format(customerCoupon.getCustomerCouponsEnddate())%>
            </td>
          </tr>
		<!-- 쿠폰 사용하기  -->
	</table><br>
		<% } %>
</form>
	<table width=590 border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td align=center>
				<input type="button" value="쿠폰 사용"	onClick="customerCouponUpdate()"> &nbsp;
				<input type="button" value="쿠폰 등록"	onClick="customerCouponInsert()"> &nbsp;
				<input type="button" value="메인" onClick="customerMain()"> &nbsp;
				<input type="button" value="내정보" onClick="customerModifyView()">
				</td>
			</tr>
		</table>
</body>
</html>