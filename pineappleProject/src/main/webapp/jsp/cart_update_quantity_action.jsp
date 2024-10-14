<%@page import="java.io.PrintWriter"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// Get the cart number and new quantity from the request
int cartNo = Integer.parseInt(request.getParameter("cartNo"));
int newQuantity = Integer.parseInt(request.getParameter("newQuantity"));

// Create an instance of CartService to update the quantity
CartService cartService = new CartService();

// Update the quantity in the database
int isUpdated = cartService.updateCartQty(cartNo, newQuantity);

%>