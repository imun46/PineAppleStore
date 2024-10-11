<%@page import="java.util.Date"%>
<%@page import="java.net.URLEncoder"%>

<%@page import="com.itwill.shop.service.CustomerService"%>
<%@page import="com.itwill.shop.domain.Customer"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("customer_write_form.jsp");
		return;
	}

	String customerId = request.getParameter("id");
	String customerPassword = request.getParameter("password1");
	String customerName = request.getParameter("name");
	String customerEmail = request.getParameter("email");
	String customerPhone = request.getParameter("phone");
	String customerAddress = request.getParameter("address");
	String customerGender = request.getParameter("gender");
	String customerNickname = request.getParameter("nickname");
	Date customerDob = null;

	// 생년월일 파싱 코드 추가 (생략 가능)
	// ...
	try {
		// 생년월일 파싱
		if (customerDobStr != null && !customerDobStr.isEmpty()) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 생년월일 형식 지정
			customerDob = dateFormat.parse(customerDobStr);
		}

	Customer newCustomer = null;

	try {
		newCustomer = Customer.builder()
			.customerId(customerId)
			.customerPassword(customerPassword)
			.customerName(customerName)
			.customerEmail(customerEmail)
			.customerPhone(customerPhone)
			.customerAddress(customerAddress)
			.customerGender(customerGender)
			.customerNickname(customerNickname)
			.build();

		CustomerService customerService = new CustomerService();
		int rowCount = customerService.create(newCustomer);
		response.sendRedirect("customer_login_form.jsp");
	
%>
