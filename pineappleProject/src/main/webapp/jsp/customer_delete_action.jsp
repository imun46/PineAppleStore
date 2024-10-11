<%@page import="com.itwill.shop.service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="customer_login_check.jspf" %>    

<%
    // GET 방식으로 접근할 경우 메인 페이지로 리다이렉트
    if (request.getMethod().equalsIgnoreCase("GET")) {
        response.sendRedirect("index.jsp");
        return;
    }
	
    int customerDeleteNo = Integer.parseInt(sCustomerNo); 
    CustomerService customerService = new CustomerService();
    int deleteCount = customerService.deleteCustomer(customerDeleteNo);
	
    // 세션 무효화 후 로그인 페이지로 리다이렉트
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
