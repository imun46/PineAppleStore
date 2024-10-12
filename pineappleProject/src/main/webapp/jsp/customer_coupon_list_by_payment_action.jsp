<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.domain.CustomerCoupons"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@page import="com.itwill.shop.service.CustomerCouponsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="customer_login_check.jspf"  %>    
<%
	/*** GET방식으로 접근 시 리다이렉션 ***/
	if(request.getMethod().equals("GET")){
		response.sendRedirect("index.jsp");
		return;
	}

	/*** 서비스 객체 생성 ***/
	CustomerService customerService = new CustomerService();
	CustomerCouponsService customerCouponsService = new CustomerCouponsService();
	
	/*** 아이디번호 가져와 int로 형변환 후 Customer객체 생성 ***/
	int customerNo = Integer.parseInt(sCustomerNo);
	Customer loginCustomer = customerService.findCustomerByNo(customerNo);
	
	String customerCouponNoStr = request.getParameter("selectedCoupon");	
	request.getSession().setAttribute("selectedCoupon", customerCouponNoStr);
	
	
	/*** 쿠폰이 선택되지 않았을 경우 ***/
    if (customerCouponNoStr == null || customerCouponNoStr.isEmpty()) {
        String msg = "쿠폰을 선택해주세요.";
        /*** script ***/
        out.println("<script>");
        out.println("alert('" + msg + "');");
        out.println("window.location.href='jsp/payment.jsp';"); // 리다이렉트
        out.println("</script>");
        return; // 이후 코드 실행 방지
    }
	
    /*** 문자열을 정수형으로 바꾸기 ***/
	Integer customerCouponsNo = Integer.parseInt(customerCouponNoStr);
	
	/*** CustomerCoupons번호에 맞는 쿠폰 찾기***/
	CustomerCoupons findCoupon = customerCouponsService.findCustomerCouponsDetailByNo(customerCouponsNo);
	
	
	
	
	
	
	
%>