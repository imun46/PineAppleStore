<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.itwill.shop.domain.Orders"%>
<%@page import="com.itwill.shop.domain.Product"%>
<%@page import="com.itwill.shop.domain.ProductOption"%>
<%@page import="com.itwill.shop.domain.OrdersItems"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

// GET 방식 접근 시 메인 페이지 이동
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("index.jsp");
}


// OrdersItems 필드 정보 리스트 받기
String itemsPrice[] 	= request.getParameterValues("itemsPrice");
String itemsQty[] 		= request.getParameterValues("itemsQty");
String itemsOptions[] 	= request.getParameterValues("itemsOptions");
String productNo[] 		= request.getParameterValues("productNo");

String cartNo[] 		= request.getParameterValues("cartNo");

// Orders 멤버 필드는 Orders_Items 받고 계산
int ordersTotprice = Integer.parseInt(request.getParameter("ordersTotprice"));
int ordersTotqty = Integer.parseInt(request.getParameter("ordersTotqty"));


// OrdersItems 객체에 내용 입력
List<OrdersItems> ordersItemsList = new ArrayList<>();
List<ProductOption> productOptionList = new ArrayList<>();

OrdersItems ordersItems = new OrdersItems();
for (int i=0; i<itemsOptions.length; i++) {
	ordersItems.setOrdersItemsPrice(Integer.parseInt(itemsPrice[i]));
	ordersItems.setOrdersItemsQty(Integer.parseInt(itemsQty[i]));
	ordersItems.setOrdersItemsOptions(itemsOptions[i]);
	ordersItems.setProduct(Product.builder()
			.productOptionList(productOptionList)	
			.productNo(Integer.parseInt(productNo[i])).build());
}

// Orders 객체에 내용 입력
Orders orders = new Orders();
orders.setOrdersTotprice(ordersTotprice);
orders.setOrdersTotqty(ordersTotqty);
orders.setOrdersItemsList(ordersItemsList);

// 세션에 Orders 객체 추가
session.setAttribute("sOrders", orders);
session.setAttribute("cartNo", cartNo);

response.sendRedirect("payment.jsp");

%>
