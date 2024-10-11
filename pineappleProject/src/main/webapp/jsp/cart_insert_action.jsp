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

<% 
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("index.jsp");
	}

	String itemsQty = request.getParameter("itemsQty");
	//String customer_no = request.getParameter("customer_no");
	String customerNo = "1";
	String productNo = request.getParameter("productNo");
	String[] productOptionDetailNo = request.getParameterValues("productOptionDetailNo");
	
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
				
				.cartQty(Integer.parseInt(itemsQty))
				.customer(Customer.builder().customerNo(Integer.parseInt(customerNo)).build())
				.product(Product.builder().productNo(Integer.parseInt(productNo)).build())
				.productSelectedList(productSelectedList)
				.build();
	
	cartService.insertCart(cart);
	
	response.sendRedirect("cart_list_form.jsp");
	
%>