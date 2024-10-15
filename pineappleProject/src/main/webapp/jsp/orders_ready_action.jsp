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
String itemsPrice[]		= null;
itemsPrice			 	= request.getParameterValues("itemsPrice");

String optionDetails[]  = request.getParameterValues("productOptionDetailNos");
String cartNo[] 		= request.getParameterValues("cartNo");
String itemsQty[]		= null;
itemsQty 				= request.getParameterValues("itemsQty");
List<Integer> itemsQtyCart = new ArrayList<>(); 
System.out.println("itemsQtyCart: "+itemsQtyCart);
List<Integer> itemsPriceCart = new ArrayList<>(); 

System.out.println("itemsQty: "+itemsQty);

if (cartNo!=null) {
	for (int i=0; i<cartNo.length; i++) {
		System.out.println(cartNo[i]);	
	}
	for (int i=0; i<cartNo.length; i++) {
		String quantityParamName = "quantity_"+cartNo[i];
		String quantityStr = request.getParameter(quantityParamName);
		System.out.println(quantityStr);
		itemsQtyCart.add(Integer.parseInt(quantityStr));
		String priceParamName = "itemsPrice_"+cartNo[i];
		String priceStr = request.getParameter(priceParamName);
		System.out.println("priceStr: "+priceStr);
		itemsPriceCart.add(Integer.parseInt(priceStr));
	}
}

System.out.println(itemsQtyCart);


/*
for(int i=0; i<itemsPrice.length; i++) {
	System.out.println(itemsPrice[i]);
}
*/




String itemsOptions[] 	= request.getParameterValues("itemsOptions");
System.out.println(itemsOptions);
if(itemsOptions!=null) {
	for(int i=0; i<itemsOptions.length; i++) {
		System.out.println("itemsOptions: "+itemsOptions[i]);
	}
}


String productNo[] 		= request.getParameterValues("productNo");
String productName[] 	= request.getParameterValues("productName");
// 상세페이지에서 바로 올 때
String optionDetail[]	= request.getParameterValues("productOptionDetailNo");
// 카트에서 올 때


// OrdersItems 개수 파악
int ordersItemsCount = itemsPrice.length;


String otp = request.getParameter("ordersTotprice");



// Orders 멤버 필드는 Orders_Items 받고 계산
String ordersTotpriceStr = request.getParameter("ordersTotprice");
System.out.println("ordersTotprice: "+ordersTotpriceStr);

int ordersTotprice = Integer.parseInt(request.getParameter("ordersTotprice"));
int ordersTotqty = 0;
if (itemsQty!=null) {
	for(int i=0; i<itemsQty.length; i++) {
		ordersTotqty += Integer.parseInt(itemsQty[i]);
	}
} else if (cartNo!=null) {
	for(int i=0; i<cartNo.length; i++) {
		ordersTotqty += itemsQtyCart.get(i);
	}
}

// OrdersItems 객체에 내용 입력
List<OrdersItems> ordersItemsList = new ArrayList<>();
List<ProductOptionDetail> productOptionDetailList = new ArrayList<>();
List<ProductOption> productOptionList = new ArrayList<>();
ProductOption productOption = new ProductOption();
	
/*
if(optionDetail != null) {
	// 바로 주문 시
	for(int i=0; i<ordersItemsCount; i++){
		ProductOptionDetail productOptionDetail = new ProductOptionDetail();
		productOptionDetail.setProductOptionDetailNo(Integer.parseInt(optionDetail[i]));
		productOptionDetailList.add(productOptionDetail);
	}	
		productOption.setProductOptionDetailList(productOptionDetailList);
}	
} else {
	// 카트 주문 시
	for(int i=0; i<ordersItemsCount; i++) {
		// optionDetails 분리
		for(int j=0; j<optionDetails[i].length(); j++) {
			String[] optionDetailsSplit = optionDetails[i].split(",");
			productOptionDetail.setProductOptionDetailNo(Integer.parseInt(optionDetailsSplit[i]));
		}
			ProductOptionDetail productOptionDetail = new ProductOptionDetail();
		productOption.setProductOptionDetailList(productOptionDetailList);
	}
	
	
	
}
	

// 카트 주문 시
List<ProductOptionDetail> productOptionDetailList = new ArrayList<>();
List<ProductOption> productOption
for (int i=0; i<optionDetails.length; i++) {
	String[] optionDetailsSplit = optionDetails[i].split(",");
}
*/


System.out.println("********** We are here ***************");
System.out.println("cartNo: "+cartNo);


if (itemsQtyCart.isEmpty()) {
	for (int i=0; i<ordersItemsCount; i++) {
		OrdersItems ordersItems = new OrdersItems();
		//OrdersItems 각 총 가격 계산 및 입력 (개수*가격)
		ordersItems.setOrdersItemsPrice(Integer.parseInt(itemsPrice[i]));
		ordersItems.setOrdersItemsQty(Integer.parseInt(itemsQty[i]));
		ordersItems.setOrdersItemsOptions(itemsOptions[i]);
		ordersItems.setProduct(Product.builder()
				.productName(productName[i])
				.productOptionList(productOptionList)	
				.productNo(Integer.parseInt(productNo[i])).build());
		ordersItemsList.add(ordersItems);
	}
	
System.out.println("********** We are here ***************");
} else {
	
	System.out.println("********** else문 ***************");
	for (int i=0; i<ordersItemsCount; i++) {
		OrdersItems ordersItems = new OrdersItems();
		//OrdersItems 각 총 가격 계산 및 입력 (개수*가격)
		ordersItems.setOrdersItemsPrice(itemsPriceCart.get(i));
		ordersItems.setOrdersItemsQty(itemsQtyCart.get(i));
		ordersItems.setOrdersItemsOptions(itemsOptions[i]);
		ordersItems.setProduct(Product.builder()
				.productName(productName[i])
				.productOptionList(productOptionList)	
				.productNo(Integer.parseInt(productNo[i])).build());
		ordersItemsList.add(ordersItems);
	}
	
	
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
