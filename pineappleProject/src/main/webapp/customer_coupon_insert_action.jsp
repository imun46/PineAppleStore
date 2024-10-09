<%@page import="com.itwill.shop.coupon.Coupon"%>
<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	/*** GET방식으로 접근 시 리다이렉션 ***/
	if(request.getMethod().equals("GET")){
		response.sendRedirect("/jsp/index.jsp");
		return;
	}
	try{
		/*** 아이디 임시 설정 ***/
		String customerId = "IDEX1";
		/*** 입력한 쿠폰ID 읽어옴 ***/
		String couponId = request.getParameter("couponId");
		
		CustomerService customerService = new CustomerService();
	
		/*** 로그인한 사용자 찾기 ***/
		Customer loginCustomer = customerService.findCustomerId(customerId);
		
		/*** 쿠폰ID에 맞는 쿠폰 찾기***/
		Coupon coupon = customerService.getCouponId(couponId);
		
		/*** 쿠폰 삽입 ***/
		int rowCount = customerService.insertCustomerCouponById(coupon, loginCustomer);
		
		if(rowCount == 1) {
			String msg = "쿠폰이 등록되었습니다.";
			/*** script ***/
			out.println("<script>");
			out.println(" alert('" + msg + "');");
			// 부모 창의 새로 고침 함수 호출
			out.println(" window.opener.refreshParent();");
			// 현재 창 닫기
			out.println(" window.close();");
			//out.println(" location.href='customer_coupon_list.jsp';");
			out.println("</script>");
			/*** script ***/
		} else if(rowCount == 2) {
			out.println("<script>");
			out.println(" alert('유효한 쿠폰 번호가 아닙니다.');");
			out.println(" window.close();"); // 현재 창 닫기
			out.println("</script>");
		} else if(rowCount == 3) {
			out.println("<script>");
			out.println(" alert('이미 보유한 쿠폰입니다.');");
			out.println(" window.close();"); // 현재 창 닫기
			out.println("</script>");
		}
		
	} catch(Exception e) {
		e.printStackTrace();
		out.println("<script>");
		// 부모 창의 새로 고침 함수 호출	
		out.println(" window.opener.refreshParent();");
		out.println(" alert('쿠폰이 등록되지 않았습니다.');");
		out.println(" window.close();"); // 현재 창 닫기
		out.println("</script>");
	}
%>


<!-- <script type="text/javascript">
	/*** 작업 완료 후 부모 창 새로 고침 ***/
	// 부모 창의 새로 고침 함수 호출
	window.opener.refreshParent();
	// 현재 창 닫기
	window.close(); 
</script> -->