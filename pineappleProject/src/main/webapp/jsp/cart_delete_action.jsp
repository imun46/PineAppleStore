<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("index.jsp");
	}

	String cartNo = request.getParameter("cart_no");
		
	CartService cartService = new CartService();
	/*cartService 1개 delete*/
	cartService.deleteByCartNo(Integer.parseInt(cartNo));
	
	response.sendRedirect("cart_list_form.jsp");
	
%>