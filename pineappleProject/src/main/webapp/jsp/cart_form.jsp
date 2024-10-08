<%@page import="com.itwill.shop.cart.CartService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String sCustomerId=(String)session.getAttribute("sCustomerId");
	if(sCustomerId!=null){
		CartService cartService = new CartService();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>