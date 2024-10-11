<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@page import="com.itwill.shop.domain.Customer"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
    if (request.getMethod().equalsIgnoreCase("GET")) {
        response.sendRedirect("customer_write_form.jsp");
        return;
    }

    String customerId = request.getParameter("id");
    String customerPassword = request.getParameter("password1");
    String customerName = request.getParameter("name");
    String customerEmail = request.getParameter("email");
    String customerPhone = request.getParameter("phone");
    String customerAddress = request.getParameter("address");
    String customerGender = request.getParameter("gender");
    String customerNickname = request.getParameter("nickname");
    String customerDobStr = request.getParameter("dob");

    Date customerDob = null;
    Customer newCustomer = null;

    try {
        if (customerDobStr != null && !customerDobStr.isEmpty()) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            customerDob = dateFormat.parse(customerDobStr);
        }

        newCustomer = Customer.builder()
            .customerId(customerId)
            .customerPassword(customerPassword)
            .customerName(customerName)
            .customerEmail(customerEmail)
            .customerDob(customerDob)
            .customerPhone(customerPhone)
            .customerAddress(customerAddress)
            .customerGender(customerGender)
            .customerNickname(customerNickname)
            .customerJoindate(new Date())
            .build();

        CustomerService customerService = new CustomerService();
        int result = customerService.createId(newCustomer);

        
        if (result > 0) {
            response.sendRedirect("customer_login_form.jsp"); // 회원가입 성공
        } else {
            String errMsg = "회원가입 중 오류가 발생했습니다.";

            // 중복 메시지 설정
            if (result == -1) {
            	// 사용자 아이디 중복체크
                if (customerService.checkIdDupl(customerId)) {
                    errMsg = "해당 아이디는 이미 사용 중입니다.";
                // 사용자 닉네임 중복체크
                } else if (customerService.checkNicknameDupl(customerNickname)) {
                    errMsg = "해당 닉네임은 이미 사용 중입니다.";
                // 사용자 전회번호 중복체크
                } else if (customerService.checkPhoneDupl(customerPhone)) {
                    errMsg = "해당 전화번호는 이미 등록되어 있습니다.";
                }
            }
			// alert 메세지와 중복되면 뒤로가기
            out.println("<script>alert('" + errMsg + "'); history.back();</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('예기치 못한 오류가 발생했습니다.'); history.back();</script>");
    }
%>
