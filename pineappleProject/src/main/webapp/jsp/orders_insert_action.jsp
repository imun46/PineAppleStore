<%@page import="com.itwill.shop.orders.Orders"%>
<%@page import="com.itwill.shop.orders.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("index.jsp");
	}

	String cart_qty = request.getParameter("cart_qty");
	String customer_no = request.getParameter("customer_no");
	String product_no = request.getParameter("product_no");
	String product_option_no = request.getParameter("product_option_no");
	String product_option_detail_no = request.getParameter("product_option_detail_no");
		
	OrdersService ordersService = new OrdersService();
	Orders orders= new Orders();
	
	if(cart_qty != null){
		ordersService.insertOrderCart(orders);
		response.sendRedirect("cart_list_form.jsp");
	}
	ordersService.insertOrder(orders);
	response.sendRedirect("orders_list_form.jsp");	
	
%>