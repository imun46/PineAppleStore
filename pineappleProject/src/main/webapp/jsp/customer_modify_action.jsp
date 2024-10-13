<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="customer_login_check.jspf"  %>          
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
	 
	
	CustomerService customerService = new CustomerService();
	
	/*** 아이디번호 가져와 int로 형변환 후 Customer객체 생성 ***/
	//int customerNo = Integer.parseInt(sCustomerNo);
	int customerNo = Integer.parseInt(sCustomerNo);
	Customer loginCustomer = customerService.findCustomerByNo(customerNo);
	
		try{	 
	 /*** 1. GET방식이면 customer_main.jsp redirection ***/
	 if(request.getMethod().equalsIgnoreCase("GET")) {
		 	response.sendRedirect("customer_view.jsp");
			return;
	 }

	/*** 3. 파라메타받기 ***/
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String nickname = request.getParameter("nickname");
	
	
	int rowCount = customerService.updateCustomer(Customer.builder()
			.customerNo(customerNo)
			.customerAddress(address)
			.customerPhone(phone)
			.customerEmail(email)
			.customerNickname(nickname)
			.build());
	
	if(rowCount == 0) {
		throw new Exception("0");
	}
	response.sendRedirect("customer_view.jsp");
	
	} catch(Exception e) {
		e.printStackTrace();
	    request.setAttribute("errorMessage", e.getMessage());
	    response.sendRedirect("index.jsp");
	}
	

	
%>  
