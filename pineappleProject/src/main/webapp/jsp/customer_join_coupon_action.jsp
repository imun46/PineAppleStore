<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.domain.Coupon"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@page import="com.itwill.shop.service.CustomerCouponsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="customer_login_check.jspf"  %>    
  
 <%
 	
 	/*** 서비스 객체 생성***/
	CustomerService customerService = new CustomerService();
	CustomerCouponsService customerCouponsService = new CustomerCouponsService();
	
	/*** 아이디번호 가져와 int로 형변환 후 Customer객체 생성 ***/
	int customerNo = Integer.parseInt(sCustomerNo);
	Customer loginCustomer = customerService.findCustomerByNo(customerNo);
	
	/*** 날짜 포맷 설정 ***/
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	/*** 가입 쿠폰 임의 생성 ***/
	String couponId = "JOINCOUPON";
	
	/*** 쿠폰 삽입 ***/
	int rowCount = customerCouponsService.insertCustomerCoupons(couponId, customerNo);
	
	try{
		if(rowCount == 1) {
			String msg = "가입 기념 쿠폰이 발급되었습니다.";
			/*** script ***/
			out.println("<script>");
			out.println(" alert('" + msg + "');");
			out.println("window.parent.closePopup();"); // 팝업 닫기
			out.println(" console.log(\"rowCount1\");");
			out.println("</script>");
			/*** script ***/
		} else if(rowCount == 3) {
			/*** script ***/
			out.println("<script>");
			out.println(" alert('이미 보유한 쿠폰입니다.');");
			// 스크립트를 통해 리다이렉트
			out.println("window.parent.closePopup();"); // 팝업 닫기
			out.println(" console.log(\"rowCount3\");");
			out.println("</script>");
			/*** script ***/
		} else {
			/*** script ***/
			out.println("<script>");
			out.println(" alert('쿠폰이 등록되지 않았습니다.');");
			// 스크립트를 통해 리다이렉트
			out.println("window.parent.closePopup();"); // 팝업 닫기
			out.println(" console.log(\"else\");");
			out.println("</script>");
			/*** script ***/
		}
		
	} catch(Exception e) {
		e.printStackTrace();
		out.println("<script>");
		out.println(" alert('쿠폰이 등록되지 않았습니다.');");
		out.println(" console.log(\"catch\");");
		out.println("window.parent.closePopup();"); // 팝업 닫기
		out.println("</script>");
	}
	
 %>
 
 