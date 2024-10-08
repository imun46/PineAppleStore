<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="com.itwill.shop.cart.CartService"%>
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
	
	CartService cartService = new CartService();
	/*cartService insert*/
	Cart cart = new Cart();
	//cartService.insertCart(cart);
	
	response.sendRedirect("cart_list_form.jsp");
	
%>