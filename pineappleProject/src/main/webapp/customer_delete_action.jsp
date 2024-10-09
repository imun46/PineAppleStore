<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>    
<%
    // GET 방식으로 접근할 경우 메인 페이지로 리다이렉트
    if (request.getMethod().equalsIgnoreCase("GET")) {
        response.sendRedirect("index.jsp");
        return;
    }

    // 세션에서 sCustomerId 가져오기
    String sCustomerId = (String) session.getAttribute("sCustomerId");

    if (sCustomerId != null) {
        // 고객 번호를 Integer로 변환 후 삭제
        int customerId = Integer.parseInt(sCustomerId);
        CustomerService customerService = new CustomerService();
        customerService.deleteCustomerNo(customerId);

        // 세션 무효화
        session.invalidate();

        // 메인 페이지로 리다이렉트
        response.sendRedirect("index_main.jsp");
    } else {
        // 세션에 sCustomerId가 없는 경우 (로그인 상태가 아닌 경우)
        response.sendRedirect("customer_login_form.jsp");
    }
%>
