<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@page import="com.itwill.shop.service.CustomerCouponsService"%>
<%@page import="com.itwill.shop.domain.CustomerCoupons"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/login_check.jspf"  %>    
<%	
try{ 	
	/*** Customer서비스 객체 생성 ***/
	CustomerService customerService = new CustomerService();
	CustomerCouponsService customerCouponsService = new CustomerCouponsService();
	
	/*** 아이디번호 가져와 int로 형변환 후 Customer객체 생성 ***/
	int customerNo = Integer.parseInt(sCustomerNo);
	Customer loginCustomer = customerService.findCustomerByNo(customerNo);
	
	/*** 선택한 사용자 쿠폰 번호 가져오기 ***/
	String customerCouponNoStr = request.getParameter("selectedCoupon");
	
	/*** 쿠폰이 선택되지 않았을 경우 ***/
    if (customerCouponNoStr == null || customerCouponNoStr.isEmpty()) {
        String msg = "쿠폰을 선택해주세요.";
        /*** script ***/
        out.println("<script>");
        out.println("alert('" + msg + "');");
        out.println("window.location.href='customer_coupon_list.jsp';"); // 리다이렉트
        out.println("</script>");
        return; // 이후 코드 실행 방지
    }
	
	
	/*** 문자열을 정수형으로 바꾸기 ***/
	Integer customerCouponsNo = Integer.parseInt(customerCouponNoStr);
	
	/*** 사용자 쿠폰 업데이트(사용완료로 상태 변경) ***/
	int updateRowCount = customerCouponsService.updateCouponStatusUsed(customerCouponsNo);
	
	if (updateRowCount == 1) {
		String msg = "쿠폰이 사용되었습니다.";
		/*** script ***/
		out.println("<script>");
		out.println("alert('" + msg + "');");
		out.println("window.location.href='customer_coupon_list.jsp';"); // 리다이렉트
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('쿠폰을 다시 확인해주세요.');");
		out.println("window.location.href='customer_coupon_list.jsp';"); // 리다이렉트
		out.println("</script>");
	}
} catch (Exception e) {
	e.printStackTrace();
	out.println("<script>");
	out.println("alert('쿠폰이 정상적으로 사용되지 않았습니다.');");
	out.println("window.location.href='customer_coupon_list.jsp';"); // 리다이렉트
	out.println("</script>");
}
	
	
%>
