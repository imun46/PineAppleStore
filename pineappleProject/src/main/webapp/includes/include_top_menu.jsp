<%@ page import="com.itwill.shop.cart.CartService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  
<%
	int cart_item_count=0;
	String sCustomerNo=(String)session.getAttribute("sCustomerNo");
	if(sCustomerNo!=null){
		CartService cartService = new CartService();
		cart_item_count = cartService.findByCustomerNo(Integer.parseInt(sCustomerNo)).size();
	}
	
%>		

<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/top_menu_styles.css" rel="stylesheet" type="text/css" />
<!-- fontawesome icon-->
<script src="https://kit.fontawesome.com/2452117347.js" crossorigin="anonymous"></script>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&family=Gowun+Batang:wght@400;700&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container px-4 px-lg-5">
          <a class="navbar-brand" href="../jsp/index.jsp">pineApple</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                  <li class="nav-item"><a class="nav-link" aria-current="page" href="../jsp/index.jsp">Home</a></li>
                  <li class="nav-item"><a class="nav-link" href="../jsp/product_phone.jsp">Phone</a></li>
                  <li class="nav-item"><a class="nav-link" href="../jsp/product_laptop.jsp">Laptop</a></li>
                  <li class="nav-item"><a class="nav-link" href="../jsp/product_pad.jsp">Pad</a></li>
                  <li class="nav-item"><a class="nav-link" href="../jsp/product_watch.jsp">Watch</a></li>
                  <li class="nav-item"><a class="nav-link" href="../jsp/product_earphone.jsp">EarPhone</a></li>
                  <li class="nav-item"><a class="nav-link" href="../jsp/product_accessory.jsp">Accessory</a></li>
              </ul>
              <%if(sCustomerNo== null) {%>
              <form class="d-flex">
                  <a class="btn btn-outline-dark" href="../jsp/customer_login_form.jsp">
                      <i class="fa-solid fa-user"></i>
                      Login
                  </a>
                  <a class="btn btn-outline-dark" href="../jsp/customer_write_form.jsp">
                      <i class="fa-solid fa-user-plus"></i>
                      Sign up
                  </a>
                  <a class="btn btn-outline-dark" href="../jsp/customer_login_form.jsp">
                      <i class="bi-cart-fill me-1"></i>
                      Cart
                      <span class="badge bg-dark text-white ms-1 rounded-pill"><%=cart_item_count %></span>
                  </a>
              </form>
              <%} else { %>
              <form class="d-flex">
                  <a class="btn btn-outline-dark" href="#">
                      <i class="fa-solid fa-user"></i>
                      logout
                  </a>
                  <a class="btn btn-outline-dark" href="../jsp/customer_view.jsp">
                      <i class="fa-solid fa-user"></i>
                      mypage
                  </a>
                  <a class="btn btn-outline-dark" href="../jsp/cart_list_form.jsp">
                      <i class="bi-cart-fill me-1"></i>
                      Cart
                      <span class="badge bg-dark text-white ms-1 rounded-pill"><%=cart_item_count %></span>
                  </a>
              </form>
              <%} %>
          </div>
      </div>
  </nav>