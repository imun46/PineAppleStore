<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@page import="com.itwill.shop.customer.CustomerCoupons"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
try{ 	
	/*** Customer서비스 객체 생성 ***/
	CustomerService customerService = new CustomerService();

	/*** 로그인 아이디 부여 ***/
	String customerId = "IDEX1";
	Customer loginCustomer = customerService.findCustomerId(customerId);
	
	
	/*** 선택한 사용자 쿠폰 번호 가져오기 ***/
	String customerCouponNoStr = request.getParameter("selectedCoupon");
	
	/*** 문자열을 정수형으로 바꾸기 ***/
	Integer customerCouponNo = Integer.parseInt(customerCouponNoStr);
	
	/*** CustomerCoupons번호에 맞는 쿠폰 찾기***/
	CustomerCoupons findCoupon = customerService.findCoupon(customerCouponNo);
	
	/*** 사용자 쿠폰 업데이트(사용불가로 상태 변경) ***/
	int updateRowCount = customerService.updateCoupon(findCoupon);
	
	if(updateRowCount == 1) {
		String msg = "쿠폰이 사용되었습니다.";
		/*** script ***/
		out.println("<script>");
		out.println(" alert('" + msg + "');");
		out.println(" window.location.href='customer_coupon_list.jsp';"); // 리다이렉트
		out.println("</script>");
		} else {
			out.println("<script>");
			out.println(" alert('쿠폰을 다시 확인해주세요.');");
			out.println(" window.location.href='customer_coupon_list.jsp';"); // 리다이렉트
			out.println("</script>");
		}
	} catch(Exception e) {
		e.printStackTrace();
		out.println("<script>");
		out.println(" alert('쿠폰이 정상적으로 사용되지 않았습니다.');");
		out.println(" window.location.href='customer_coupon_list.jsp';"); // 리다이렉트
		out.println("</script>");
	}
	
	
%>
