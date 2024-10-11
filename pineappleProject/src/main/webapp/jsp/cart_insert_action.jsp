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

	String cart_qty = request.getParameter("cart_qty");
	//String customer_no = request.getParameter("customer_no");
	String customer_no = "1";
	String product_no = request.getParameter("product_no");
	String product_option_no = request.getParameter("product_option_no");
	String[] product_option_detail_no = request.getParameterValues("product_option_detail_no");
	
	CartService cartService = new CartService();
	/*cartService insert*/
	ProductSelected productSelected = new ProductSelected();
	List<ProductSelectedDetail> productSelectedDetailList = new ArrayList<>();
	
	for(int i = 0 ; i < product_option_detail_no.length ; i++){
		ProductSelectedDetail productSelectedDetail = ProductSelectedDetail.builder()
				.productOptionDetail(ProductOptionDetail.builder().productOptionDetailNo(Integer.parseInt(product_option_detail_no[i])).build())
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
				.cartQty(Integer.parseInt(cart_qty))
				.customer(Customer.builder().customerNo(Integer.parseInt(customer_no)).build())
				.product(Product.builder().productNo(Integer.parseInt(product_no)).build())
				.productSelectedList(productSelectedList)
				.build();
	
	cartService.insertCart(cart);
	
	response.sendRedirect("cart_list_form.jsp");
	
%>