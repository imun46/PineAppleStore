<%@page import="com.itwill.shop.product.Product"%>
<%@page import="java.util.List"%>
<%@ page import="com.itwill.shop.product.ProductService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductService productService = new ProductService();
	List<Product> productCategoryList = productService.productListByCategory("laptop");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>PineApple</title>
        <!-- Favicon
        <link rel="png" type="image/x-icon" href="assets/logo.png" />-->
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="styles.css" rel="stylesheet" type="text/css" />
        <!-- fontawesome icon-->
        <script src="https://kit.fontawesome.com/2452117347.js" crossorigin="anonymous"></script>
        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&family=Gowun+Batang:wght@400;700&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    </head>
<body>
	<jsp:include page="includes/include_top_menu.jsp" />
	<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">LAPTOP</h1>
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
                         <img class="card-img-top" src="img/macBookAir.jpg" alt="상품이미지" />
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
                             <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
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