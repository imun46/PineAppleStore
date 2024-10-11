<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="com.itwill.shop.product.ProductOptionDetail"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%     
	request.setCharacterEncoding("UTF-8");
	
	Integer productNo = Integer.parseInt(request.getParameter("product_no"));
	System.out.println(productNo);
	Integer productOptionDetailNo = Integer.parseInt(request.getParameter("product_option_detail_no"));
	ProductService productService = new ProductService();
	Product product = productService.productDetail(productNo);
	
if (request.getMethod().equals("GET")) {
	response.sendRedirect("product_detail_form.jsp?productNo="+product.getProductNo());
	return;
}
	%>
	<div>
        <input type="hidden" name="productNo" value="<%= product.getProductNo() %>">
    </div>
    <div>
        <label for="reviewTitle">상품 이름 :</label>
        <input name="productNo" value="<%= product.getProductNo() %>" >
    </div>
    <div>
        <label for="reviewTitle">상품 설명 :</label>
        <input name="productDesc" value="<%= product.getProductDesc() %>" >
    </div>
    <div>
        <label for="reviewTitle">상품 가격 :</label>
        <input name="productPrice" value="<%= product.getProductPrice()%>" >
    </div>
    <div>
        <label for="reviewTitle">상품 옵션 :</label>
    </div>
    