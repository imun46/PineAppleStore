<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function customerCouponInsertAction() {
		document.f.action = "customer_coupon_insert_action.jsp";
		document.f.method="POST";
		document.f.submit();
	}
</script>
	
</head>
<body>
<form name="f" method="post">
	<table width=590 border=0 cellpadding=0 cellspacing=0>
	<!-- 쿠폰 일련번호 입력 -->	
		<tr>
			<td width=100 align=center bgcolor="E6ECDE" heigth="22">쿠폰 번호 : </td>
			<td width=300 bgcolor="ffffff" style="padding-left : 10px" align="left">
			<input type="text" style="width: 150px"	name="couponId" 
			value="">
			<!-- 쿠폰 등록하기 클릭 시 insertAction -->	
			<input type="button" value="쿠폰 등록하기"	onClick="customerCouponInsertAction()">
			</td>
		</tr>
	</table>
</form>
			
</body>
</html>