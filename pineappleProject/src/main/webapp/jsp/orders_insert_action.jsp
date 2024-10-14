<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.itwill.shop.domain.Orders"%>
<%@page import="com.itwill.shop.domain.Product"%>
<%@page import="com.itwill.shop.domain.OrdersItems"%>
<%@page import="com.itwill.shop.domain.CustomerCoupons"%>
<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.service.OrdersService"%>
<%@page import="com.itwill.shop.service.CustomerCouponsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="customer_login_check.jspf"  %>    


<%

//GET 방식 접근 시 메인 페이지 이동
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("index.jsp");
}
// 데이터 받기
String ordersAddress = request.getParameter("ordersAddress");
String customerCouponsNo = request.getParameter("customerCouponsNo");
String ordersFinalprice = request.getParameter("ordersFinalprice");
Orders orders = (Orders)session.getAttribute("sOrders");
String[] ordersItemsFinalprice = request.getParameterValues("ordersItemsFinalprice");

// 카트 번호 리스트 세션에서 확인
String cartNo[] = (String[])session.getAttribute("cartNo");

System.out.println("ordersAddress: "+ordersAddress);
System.out.println("customerCouponsNo: "+customerCouponsNo);
System.out.println("ordersFinalprice: "+ordersFinalprice);
System.out.println("orders: "+orders);
for(OrdersItems ordersItems : orders.getOrdersItemsList()) {
	System.out.println("ordersItems: "+ordersItems);
}

System.out.println("cartNo: "+cartNo);
if(cartNo!=null) {
	for(int i=0; i<cartNo.length; i++) {
		System.out.println("cartNo["+i+"]"+cartNo[i]);
	}
	
}
for(int i=0; i<ordersItemsFinalprice.length; i++) {
	System.out.println("ordersItemsFinalPrice["+i+"]"+ordersItemsFinalprice[i]);
}





// 아이템 최종 가격 int cast
int[] ordersItemsFinalpriceInt = new int[ordersItemsFinalprice.length];
for(int i=0; i<ordersItemsFinalprice.length; i++) {
	ordersItemsFinalprice[i] = ordersItemsFinalprice[i].replaceAll("\\.0$", "");
	double price = Double.parseDouble(ordersItemsFinalprice[i]);
	int finalPrice = (int)Math.round(price);
	ordersItemsFinalpriceInt[i] = finalPrice;
	
}

for(int i=0; i<ordersItemsFinalprice.length; i++) {
	System.out.println("ordersItemsFinalPrice["+i+"]"+ordersItemsFinalprice[i]);
}



System.out.println(ordersItemsFinalpriceInt);
for(int i=0; i<ordersItemsFinalpriceInt.length; i++) {
	System.out.println("ordersItemsFinalPriceInt["+i+"]"+ordersItemsFinalpriceInt[i]);
}






// 서비스 객체 생성
OrdersService ordersService = new OrdersService();
CustomerCouponsService customerCouponsService = new CustomerCouponsService();

// 회원 번호 받기
int customerNo = Integer.parseInt((String)session.getAttribute("sCustomerNo"));
System.out.println("customerNo"+customerNo);



// OrdersItems 객체에 내용 입력
List<OrdersItems> ordersItemsList = orders.getOrdersItemsList();
for (int i=0; i<ordersItemsList.size(); i++) {
	ordersItemsList.get(i).setOrdersItemsFinalprice(ordersItemsFinalpriceInt[i]);
}

for(OrdersItems ordersItems : ordersItemsList) {
	System.out.println("ordersItemsFinalprice: "+ordersItems.getOrdersItemsFinalprice());
}



// Orders 객체에 내용 입력
orders.setOrdersFinalprice(Integer.parseInt(ordersFinalprice));
orders.setOrdersAddress(ordersAddress);
orders.setOrdersStatus("배송전");

System.out.println("orders: "+orders);

// 쿠폰 사용 시 쿠폰 번호 입력
if(customerCouponsNo!=null) {
	orders.setCustomerCoupons(CustomerCoupons.builder().customerCouponsNo(Integer.parseInt(customerCouponsNo)).build());
}

orders.setCustomer(Customer.builder().customerNo(customerNo).build());

// 주문 입력
// 카트에서 주문하는지 체크
if(cartNo==null) {
	// 카트가 아닌 경우 바로 구매
	ordersService.insertOrders(orders);
} else {
	// 카트 구매 시 카트 내용 삭제
	List<Integer> cartNoList = new ArrayList<>();
	for(int i=0; i<cartNo.length; i++) {
		cartNoList.add(Integer.parseInt(cartNo[i]));
	}
	ordersService.insertOrdersCart(orders, cartNoList);
}

// 쿠폰 사용 시 사용 완료로 상태 변경
if(customerCouponsNo!=null) {
	customerCouponsService.updateCouponStatusUsed(Integer.parseInt(customerCouponsNo));
}

// Orders 객체 세션에서 삭제
session.removeAttribute("sOrders");
session.removeAttribute("cartNo");

// 주문 내역으로  페이지 이동
response.sendRedirect("order_list_form.jsp");
/*
*/
%>
    
    