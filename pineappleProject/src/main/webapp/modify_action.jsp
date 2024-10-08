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
	}
	

<<<<<<< Upstream, based on origin/mj
>>>>>>> 00b3a1b AcademyCommit
=======
	
>>>>>>> 21ac57d 내정보 : 쿠폰 리스트 작업 진행 중
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