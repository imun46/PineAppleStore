<%page import="java" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// GET 방식 접근 시 메인 페이지 이동
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("index.jsp");
}

request.getParameter()




// Orders 멤버 필드는 Orders_Items 받고 계산
int ordersTotprice = 0;
int ordersTotqty = 0;








%>
