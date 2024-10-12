<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.domain.ProductSelectedDetail"%>
<%@page import="com.itwill.shop.domain.Product"%>
<%@page import="com.itwill.shop.domain.ProductOptionDetail"%>
<%@page import="com.itwill.shop.domain.ProductSelected"%>
<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.domain.Cart"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="customer_login_check.jspf"  %>    
    

<% 
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("index.jsp");
	}

	String itemsQty = request.getParameter("itemsQty");
	int customerNo = Integer.parseInt(sCustomerNo);
	String productNo = request.getParameter("productNo");
	String[] productOptionDetailNo = request.getParameterValues("productOptionDetailNo");
	
    if (itemsQty == null || productNo == null || sCustomerNo == null || productOptionDetailNo == null) {
        // Redirect to an error page or handle invalid input gracefully
        response.sendRedirect("index.jsp");
        return;
    }
	
	CartService cartService = new CartService();
	
	/*cartService insert*/
	ProductSelected productSelected = new ProductSelected();
	List<ProductSelectedDetail> productSelectedDetailList = new ArrayList<>();
	
	for(int i = 0 ; i < productOptionDetailNo.length ; i++){
		ProductSelectedDetail productSelectedDetail = ProductSelectedDetail.builder()
				.productOptionDetail(ProductOptionDetail.builder().productOptionDetailNo(Integer.parseInt(productOptionDetailNo[i])).build())
				.productSelected(productSelected)
				.build();
		
		productSelectedDetailList.add(productSelectedDetail);
	}
	
	ProductSelected productSelected2 = ProductSelected.builder()
									.productSelectedDetailList(productSelectedDetailList)
									.build();
	
	List<ProductSelected> productSelectedList = new ArrayList<>();
	productSelectedList.add(productSelected2);
	
	
	Cart cart = Cart.builder()
				.cartNo(0)
				.cartQty(Integer.parseInt(itemsQty))
				.customer(Customer.builder().customerNo(customerNo).build())
				.product(Product.builder().productNo(Integer.parseInt(productNo)).build())
				.productSelectedList(productSelectedList)
				.build();
	
	cartService.insertCart(cart);
	
	response.sendRedirect("cart_list_form.jsp");
	
%>