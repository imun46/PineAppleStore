<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="customer_login_check.jspf" %>    

<%
    // GET 방식으로 접근할 경우 메인 페이지로 리다이렉트
    if (request.getMethod().equalsIgnoreCase("GET")) {
        response.sendRedirect("index.jsp");
        return;
    }
	
	String inputPassword = request.getParameter("inputPassword");
    int customerNo = Integer.parseInt(sCustomerNo); 
    CustomerService customerService = new CustomerService();
	Customer customer = customerService.findCustomerByNo(customerNo);
		
	if(inputPassword != null && inputPassword.equals(customer.getCustomerPassword())){
	
	int deleteCount = customerService.deleteCustomer(customerNo);
	%>
	        <script>
	            alert('탈퇴가 완료되었습니다.');
	            location.href = 'index.jsp'; // 탈퇴 완료 후 메인 페이지로 이동
	        </script>
	<%
	    } else {
	        // 비밀번호가 일치하지 않으면 경고 메시지를 출력
	%>
	        <script>
	            alert('비밀번호가 일치하지 않습니다. 다시 시도해주세요.');
	            history.back(); // 이전 페이지로 돌아가기
	        </script>
	<%
	    }
	%>
	
    // 세션 무효화 후 로그인 페이지로 리다이렉트
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
