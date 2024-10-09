<%@page import="com.itwill.shop.orders.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("index.jsp");
	}

	String orderNoStr = request.getParameter("orders_no");
	
	if(orderNoStr == null || orderNoStr.equals("")){
		response.sendRedirect("index.jsp");
		return;
	}
	
	OrdersService orderService= new OrdersService();
	/* orderService 구매확정 버튼 */
	int successCount = orderService.updateOrderConfirm(Integer.parseInt(orderNoStr));
	
	response.sendRedirect("order_list_form.jsp");
	
%>