<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("index.jsp");
	}

	String customerNo = request.getParameter("customer_no");
		
	CartService cartService = new CartService();
	/*cartService 전체delete*/
	cartService.deleteByCustomerNo(Integer.parseInt(customerNo));
	
	response.sendRedirect("cart_list_form.jsp");
	
%>