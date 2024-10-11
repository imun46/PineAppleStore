<%@page import="com.itwill.shop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page import="com.itwill.shop.service.ProductService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductService productService = new ProductService();
	List<Product> productList = productService.productList();
%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>PineApple</title>
        <!-- favicon -->
		<link rel="icon" href="../img/favicon.png">
    </head>
<body>
	<jsp:include page="../includes/include_top_menu.jsp" />
	
	<video autoplay muted style="width:100%; height: 600px;">
	 <source src="../img/banner_video.mp4" type="video/mp4">
	</video>
	<img alt="line image" src="../img/line.png" style="display:block; margin:0 auto;">
	 <!-- Section 상품 시작-->
	 <h1 style="margin-top: 5px; font-weight: 600; text-align: center; font-size: 50px;" >
	 STORE
	 </h1>
     <section class="py-5">
         <div class="container px-4 px-lg-5 mt-5">
             <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
             <!-- 상품 전체 list 돌리기 -->
             <% 
             	int product_size = productList.size();
				
				for(int i = 0; i<product_size;i++){
					Product product = productList.get(i);
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
                             <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="product_detail_form.jsp?product_no=<%=product.getProductNo() %>" >상세보기</a></div>
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