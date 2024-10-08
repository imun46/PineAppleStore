<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%
/*
0  . GET방식요청일때 customer_login_form.jsp로 redirection
1  . 요청객체 인코딩설정
2  . 파라메타 받기
3  . CustomerService객체생성
4  . CustomerService.login() 메쏘드실행
*/
if (request.getMethod().equalsIgnoreCase("GET")) {
    response.sendRedirect("customer_login_form.jsp");
    return;
}

String customerId = request.getParameter("customerId");
String customerPassword = request.getParameter("customerPassword");
CustomerService customerService = new CustomerService();

/*
 * 회원로그인
 * 1:로그인 성공(세션 생성)
 * 0:로그인 실패(아이디 존재 및 비밀번호 불일치 포함)
 */
int result = customerService.login(customerId, customerPassword);
if (result == 1) {
    // 로그인 성공 (세션 설정)
    session.setAttribute("sCustomerId", customerId);
    response.sendRedirect("customer_view.jsp");
} else {
    // 로그인 실패 (아이디 또는 비밀번호 문제)
    String msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
    out.println("<script>");
    out.println(" alert('" + msg + "');");
    out.println(" location.href='customer_login_form.jsp';");
    out.println("</script>");
}
%>













>>>>>>> 7762644 login jsp
=======
>>>>>>> c05fc5c 수정 완료
