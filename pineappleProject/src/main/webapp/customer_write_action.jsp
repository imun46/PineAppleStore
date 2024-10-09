
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
		if(request.getMethod().equalsIgnoreCase("GET")){
			response.sendRedirect("jsp/index.jsp");
			return;
		}


		String customerId=request.getParameter("id");
		String customerPassword=request.getParameter("password1");
		String customerName=request.getParameter("name");
		String customerAddress=request.getParameter("address");
		String customerGender=request.getParameter("gender");
		String customerPhone=request.getParameter("phone");
		String customerEmail=request.getParameter("email");
		String customerNickname=request.getParameter("nickname");
		
		
		Date customerDob=null;
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		try{
			customerDob = sdf.parse(request.getParameter("dob"));
		}catch(ParseException pe){
			pe.printStackTrace();
		}
		
		
		
		
		Customer customer=Customer.builder()
				.customerId(customerId)
				.customerName(customerName)
				.customerPassword(customerPassword)
				.customerDob(customerDob)
				.customerAddress(customerAddress)
				.customerGender(customerGender)
				.customerPhone(customerPhone)
				.customerEmail(customerEmail)
				.customerNickname(customerNickname)
				.build();
		
		CustomerService customerService = new CustomerService();
		int insertCount = customerService.create(customer);
		response.sendRedirect("jsp/index.jsp");
		
%>


>>>>>>> c25e15a customer_view
