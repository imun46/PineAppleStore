<%@page import="com.itwill.shop.coupon.Coupon"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/login_check.jspf"  %>    
 <%
 	/*** 서비스 객체 생성***/
	CustomerService customerService = new CustomerService();
	
	/*** 아이디번호 가져와 int로 형변환 후 Customer객체 생성 ***/
	int customerNo = Integer.parseInt(sCustomerNo);
	Customer loginCustomer = customerService.findCustomerNo(customerNo);
	
	/*** 날짜 포맷 설정 ***/
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	/*** 가입 쿠폰 임의 생성 ***/
	String couponId = "JOINDATE";
	
	/*** 쿠폰ID에 맞는 쿠폰 찾기***/
	Coupon coupon = customerService.getCouponId(couponId);
	
	/*** 쿠폰 삽입 ***/
	int rowCount = customerService.insertCustomerCouponById(coupon, loginCustomer);
	try{
	if(rowCount == 1) {
		String msg = "가입 기념 쿠폰이 발급되었습니다.";
		/*** script ***/
		out.println("<script>");
		out.println(" alert('" + msg + "');");
		// 스크립트를 통해 리다이렉트
		out.println(" window.location.href='customer_coupon_list.jsp';");
		out.println("</script>");
		/*** script ***/
	} else if(rowCount == 3) {
		/*** script ***/
		out.println("<script>");
		out.println(" alert('이미 보유한 쿠폰입니다.');");
		// 스크립트를 통해 리다이렉트
		out.println(" window.location.href='customer_coupon_list.jsp';");
		out.println("</script>");
		/*** script ***/
	} else {
		/*** script ***/
		out.println("<script>");
		out.println(" alert('쿠폰이 등록되지 않았습니다.');");
		// 현재 창 닫기
		out.println(" window.close();");
		// 스크립트를 통해 리다이렉트
		out.println(" window.location.href='customer_join_coupon_form.jsp';"); 
		out.println("</script>");
		/*** script ***/
	}
	} catch(Exception e) {
		e.printStackTrace();
		out.println("<script>");
		out.println(" alert('쿠폰이 등록되지 않았습니다.');");
		// 스크립트를 통해 리다이렉트
		out.println(" window.location.href='customer_join_coupon_form.jsp';"); 
		out.println("</script>");
	}
	
 %>