<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 여부 체크   -->
<!-- include file="login_check.jspf" -->
<%	
	/*
	0.login 여부체크
	1.GET방식이면 jsp/index.jsp redirection
	2.요청객체인코딩설정
	3.파라메타받기
	4.세션의 sUserId와 파라메타(password,name,email) 로 User객체생성후  UserService.update 메쏘드호출
	5.성공:jsp/index.jsp redirection
	  실패:customer_error.jsp 
	 */
	 
	String customerId = "IDEX1";
	CustomerService customerService = new CustomerService();
	Customer loginCustomer = customerService.findCustomerId(customerId);
try{	 
	 /*** 1. GET방식이면 customer_main.jsp redirection ***/
	 if(request.getMethod().equalsIgnoreCase("GET")) {
		 	response.sendRedirect("modify_view.jsp");
			return;
	 }

	/*** 3. 파라메타받기 ***/
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String nickname = request.getParameter("nickname");
	
	int rowCount = customerService.updateCustomerId(Customer.builder()
			.customerNo(loginCustomer.getCustomerNo())
			.customerPassword(password)
			.customerName(name)
			.customerAddress(address)
			.customerGender(gender)
			.customerPhone(phone)
			.customerEmail(email)
			.customerNickname(nickname)
			.build());
	
	if(rowCount == 0) {
		throw new Exception("0");
	}
	response.sendRedirect("modify_view.jsp");
	
	} catch(Exception e) {
		e.printStackTrace();
	    request.setAttribute("errorMessage", e.getMessage());
	    response.sendRedirect("jsp/index.jsp");
	}
	

	
%>  
