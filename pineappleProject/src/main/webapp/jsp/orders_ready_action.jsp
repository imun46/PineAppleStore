<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.itwill.shop.domain.Orders"%>
<%@page import="com.itwill.shop.domain.Product"%>
<%@page import="com.itwill.shop.domain.ProductOption"%>
<%@page import="com.itwill.shop.domain.ProductOptionDetail"%>
<%@page import="com.itwill.shop.domain.OrdersItems"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="customer_login_check.jspf"  %>    

<%

// GET 방식 접근 시 메인 페이지 이동
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("index.jsp");
}

// OrdersItems 필드 정보 리스트 받기
String itemsPrice[] 	= request.getParameterValues("itemsPrice");
String itemsQty[] 		= request.getParameterValues("itemsQty");
String itemsOptions[] 	= request.getParameterValues("itemsOptions");
String productNo[] 		= request.getParameterValues("productNo");
String productName[] 	= request.getParameterValues("productName");
// 상세페이지에서 바로 올 때
String optionDetail[]	= request.getParameterValues("productOptionDetailNo");
// 카트에서 올 때
String optionDetails[]  = request.getParameterValues("productOptionDetailNos");

String cartNo[] 		= request.getParameterValues("cartNo");

// OrdersItems 개수 파악
int ordersItemsCount = itemsPrice.length;


/*
// 정보 수령 여부 체크
for(int i=0; i<itemsPrice.length; i++) {
	System.out.println("itemsPrice: "+itemsPrice[i]);
	System.out.println("itemsQty: "+itemsQty[i]);
	System.out.println("itemsOptions: "+itemsOptions[i]);
	System.out.println("productNo: "+productNo[i]);
	System.out.println("optionDetail: "+optionDetail[i]);
}
	System.out.println("cartNo: "+cartNo);
for(int i=0; i<optionDetails.length; i++) {
	System.out.println("optionDetails: "+optionDetails[i]);
}
*/

// Orders 멤버 필드는 Orders_Items 받고 계산
int ordersTotprice = Integer.parseInt(request.getParameter("ordersTotprice"));
int ordersTotqty = Integer.parseInt(request.getParameter("ordersTotqty"));







// OrdersItems 객체에 내용 입력
List<OrdersItems> ordersItemsList = new ArrayList<>();
List<ProductOptionDetail> productOptionDetailList = new ArrayList<>();
List<ProductOption> productOptionList = new ArrayList<>();
	
if(optionDetail!=null) {
	for(int i=0 ; i<ordersItemsCount; i++){
		ProductOptionDetail productOptionDetail = new ProductOptionDetail();
		productOptionDetail.setProductOptionDetailNo(Integer.parseInt(optionDetail[i]));
		productOptionDetailList.add(productOptionDetail);
	}	
} else {
	for(int i=0 ; i<ordersItemsCount; i++){
		ProductOptionDetail productOptionDetail = new ProductOptionDetail();
		

		productOptionDetail.setProductOptionDetailNo(Integer.parseInt(optionDetails[i]));
		productOptionDetailList.add(productOptionDetail);
	}	
	
}

	ProductOption productOption = new ProductOption();
	productOption.setProductOptionDetailList(productOptionDetailList);

for (int i=0; i<ordersItemsCount; i++) {
	OrdersItems ordersItems = new OrdersItems();
	//OrdersItems 각 총 가격 계산 및 입력 (개수*가격)
	ordersItems.setOrdersItemsPrice(Integer.parseInt(itemsPrice[i])*Integer.parseInt(itemsQty[i]));
	ordersItems.setOrdersItemsQty(Integer.parseInt(itemsQty[i]));
	ordersItems.setOrdersItemsOptions(itemsOptions[i]);
	ordersItems.setProduct(Product.builder()
			.productName(productName[i])
			.productOptionList(productOptionList)	
			.productNo(Integer.parseInt(productNo[i])).build());
	ordersItemsList.add(ordersItems);
}


// Orders 객체에 내용 입력
Orders orders = new Orders();
orders.setOrdersTotprice(ordersTotprice);
// 우선 임시 최종 가격 입력
orders.setOrdersFinalprice(ordersTotprice);
orders.setOrdersTotqty(ordersTotqty);
orders.setOrdersItemsList(ordersItemsList);

// 세션에 Orders 객체 추가
session.setAttribute("sOrders", orders);
session.setAttribute("cartNo", cartNo);


response.sendRedirect("payment.jsp");
%>
