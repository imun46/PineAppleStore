<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("index.jsp");
	}

	String[] cartNo = request.getParameterValues("cart_no");
		
	System.out.println(cartNo);
	
	if(cartNo == null){
		response.sendRedirect("index.jsp");
		return;
	}
	
	CartService cartService = new CartService();
	/*cartService delete*/
	for(int i = 0 ; i < cartNo.length ; i++){
		cartService.deleteByCartNo(Integer.parseInt(cartNo[i]));
	}
	response.sendRedirect("cart_list_form.jsp");
	
	
%>