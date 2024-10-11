<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.itwill.shop.domain.Orders"%>
<%@page import="com.itwill.shop.domain.Product"%>
<%@page import="com.itwill.shop.domain.OrdersItems"%>
<%@page import="com.itwill.shop.domain.CustomerCoupons"%>
<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

//GET 방식 접근 시 메인 페이지 이동
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("index.jsp");
}

// 카트 번호 리스트 세션에서 확인
String cartNo[] = session.getAttribute("cartNo");

// 주문 서비스 객체 생성
OrdersService ordersService = new OrdersService();

// 회원 번호 받기
int customerNo = Integer.parseInt(request.getParameter("sCustomerNo"));

// Orders 객체 세션으로부터 받기
Orders orders = (Orders)session.getAttribute("sOrders");

// OrdersItems 필드 정보 받기
String[] itemsFinalprice = request.getParameterValues("itemsFinalprice");

// Orders 멤버 필드 정보 받기
int ordersFinalprice = Integer.parseInt(request.getParameter("ordersFinalprice"));
int customerCouponsNo = Integer.parseInt(request.getParameter("customerCouponsNo"));

// OrdersItems 객체에 내용 입력
List<OrdersItems> ordersItemsList = orders.getOrdersItemsList();
for (int i=0; i<itemsFinalprice.length; i++) {
	ordersItemsList.get(i).setOrdersItemsFinalprice(Integer.parseInt(itemsFinalprice[i]));
}

// Orders 객체에 내용 입력
orders.setOrdersFinalprice(ordersFinalprice);
orders.setCustomerCoupons(CustomerCoupons.builder().customerCouponsNo(customerCouponsNo).build());
orders.setCustomer(Customer.builder().customerNo(customerNo).build());

// 주문 입력
// 카트에서 주문하는지 체크
if(cartNo==null) {
	// 카트가 아닌 경우 바로 구매
	ordersService.insertOrders(orders);
} else {
	// 카트 구매 시 카트 내용 삭제
	ordersService.insertOrdersCart(orders);
}

// Orders 객체 세션에서 삭제
session.removeAttribute("sOrders");
session.removeAttribute("cartNo");

// 주문 내역으로  페이지 이동
response.sendRedirect("orders_list_form");

%>
    
    