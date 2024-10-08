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
 * 
 * 0:아이디존재안함
 * 1:패쓰워드 불일치
 * 2:로그인성공(세션)
 */
int result = customerService.login(customerId, customerPassword);
if (result == 0) {
	//0:아이디존재안함
	String msg1=customerId+" 는 존재하지않는 아이디입니다.";
	/*****************case1 script***********************/
	out.println("<script>");
	out.println(" alert('" + msg1 + "');");
	out.println(" location.href='customer_login_form.jsp';");
	out.println("</script>");
	/***************************************************/
} else if (result == 1) {
	//1:패쓰워드 불일치
	String msg2="비밀번호가 일치하지않습니다.";
	/*****************case1 script***********************/
	out.println("<script>");
	out.println(" alert('" + msg2 + "');");
	out.println(" location.href='customer_login_form.jsp';");
	out.println("</script>");
	/***************************************************/
} else if (result == 2) {
	//2:로그인성공(세션)
	session.setAttribute("sCustomerId", customerId);
	response.sendRedirect("customer_main.jsp");
}
%>













>>>>>>> 4f916a4 login jsp
