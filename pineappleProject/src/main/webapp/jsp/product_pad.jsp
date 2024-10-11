<%@page import="com.itwill.shop.product.Product"%>
<%@page import="java.util.List"%>
<%@ page import="com.itwill.shop.product.ProductService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductService productService = new ProductService();
	List<Product> productCategoryList = productService.productListByCategory("pad");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>PineApple</title>
    </head>
<body>
	<jsp:include page="../includes/include_top_menu.jsp" />
	<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">PAD</h1>
            <p class="lead fw-normal text-white-50 mb-0"></p>
        </div>
    </div>
</header>
	 <!-- Section 상품 시작-->
     <section class="py-5">
         <div class="container px-4 px-lg-5 mt-5">
             <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
             <!-- 상품 전체 list 돌리기 -->
             <% 
             	int product_size = productCategoryList.size();
				
				for(int i = 0; i<product_size;i++){
					Product product = productCategoryList.get(i);
             %>
                 <div class="col mb-5">
                     <div class="card h-100">
                         <!-- Product image-->
                         <img class="card-img-top" src="../img/macBookAir.jpg" alt="상품이미지" />
                         <!-- Product details-->
                         <div class="card-body p-4">
                             <div class="text-center">
                                 <!-- Product name-->
                                 <h5 class="fw-bolder"><%=product.getProductName() %></h5>
                                 <!-- Product price-->
                                 <% 
                                 java.text.DecimalFormat decimalFormat = new java.text.DecimalFormat("#,###");
                                 String price = decimalFormat.format(product.getProductPrice());
                                 %>
                                 <%=price %>원
                             </div>
                         </div>
                         <!-- Product actions-->
                         <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                             <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="product_detail_form.jsp?product_no=<%=product.getProductNo() %>">상세보기</a></div>
                         </div>
                     </div>
                 </div>
                 <!--상품 끝 -->
                 <%} %>
     		</div>
     	</div>
     </section>	
	
</body>
</html>