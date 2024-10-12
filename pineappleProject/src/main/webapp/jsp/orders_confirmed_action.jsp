<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="com.itwill.shop.domain.Orders"%>
<%@page import="com.itwill.shop.service.OrdersService"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	// GET 방식 접근 시 메인 페이지 이동
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("index.jsp");
	}
	
	//ordersNo 파라미터 받기
	String ordersNoStr = request.getParameter("ordersNo");
	//ordersNo 파라미터 Integer로 변경
	Integer ordersNo = Integer.parseInt(ordersNoStr);
	
	//ordersService 초기화
	OrdersService ordersService = new OrdersService();
	
	//주문 배송날짜 현재일로 변경 , 배송상태 '구매확정'으로 변경
	ordersService.updateOrdersConfirm(ordersNo);
	
	response.sendRedirect("order_list_form.jsp");
%>
