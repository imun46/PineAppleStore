<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.itwill.shop.domain.Orders"%>
<%@page import="com.itwill.shop.domain.Product"%>
<%@page import="com.itwill.shop.domain.OrdersItems"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//GET 방식 접근 시 메인 페이지 이동
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("index.jsp");
}

// Orders 객체 세션으로부터 받기
Orders 






%>
    
    