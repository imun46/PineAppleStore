<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	/*
	0.login 여부체크
	1.GET방식이면 user_main.jsp redirection
	2.요청객체인코딩설정
	3.파라메타받기(password,name,email)
	4.세션의 sUserId와 파라메타(password,name,email) 로 User객체생성후  UserService.update 메쏘드호출
	5.성공:user_view.jsp redirection
	  실패:user_error.jsp 
	 */
	String customerId = "IDEX1";
	CustomerService customerService = new CustomerService();
	Customer loginCustomer = customerService.findCustomerId(customerId);
try{	 
	 /*** 1. GET방식이면 customer_main.jsp redirection ***/
	 if(request.getMethod().equalsIgnoreCase("GET")) {
		 throw new Exception("get");
	 }

	/*** 3. 파라메타받기 ***/
	String password = request.getParameter("customer_password");
	String name = request.getParameter("customer_name");
	String address = request.getParameter("customer_address");
	String gender = request.getParameter("customer_gender");
	String phone = request.getParameter("customer_phone");
	String email = request.getParameter("customer_email");
	String nickname = request.getParameter("customer_nickname");
	
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
	} catch(Exception e) {
		e.printStackTrace();
		throw new Exception("catch");
	}

>>>>>>> 00b3a1b AcademyCommit
%>  
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
헤헤헤헤헤
</body>
</html>