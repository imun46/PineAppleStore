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

<link rel="stylesheet" href="styles.css" >
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container px-4 px-lg-5">
          <a class="navbar-brand" href="main.jsp">pineApple</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                  <li class="nav-item"><a class="nav-link" aria-current="page" href="index.jsp">Home</a></li>
                  <li class="nav-item"><a class="nav-link" href="menu_phone.jsp">Phone</a></li>
                  <li class="nav-item"><a class="nav-link" href="menu_laptop.jsp">Laptop</a></li>
                  <li class="nav-item"><a class="nav-link" href="menu_pad.jsp">Pad</a></li>
                  <li class="nav-item"><a class="nav-link" href="menu_watch.jsp">Watch</a></li>
                  <li class="nav-item"><a class="nav-link" href="menu_earphone.jsp">EarPhone</a></li>
                  <li class="nav-item"><a class="nav-link" href="menu_accessory.jsp">Accessory</a></li>
              </ul>
              <%if(sCustomerNo== null) {%>
              <form class="d-flex">
                  <a class="btn btn-outline-dark" href="#">
                      <i class="fa-solid fa-user"></i>
                      Login
                  </a>
                  <a class="btn btn-outline-dark" href="#">
                      <i class="fa-solid fa-user-plus"></i>
                      Sign up
                  </a>
                  <a class="btn btn-outline-dark" href="login_form.jsp">
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
                  <a class="btn btn-outline-dark" href="#">
                      <i class="fa-solid fa-user"></i>
                      mypage
                  </a>
                  <a class="btn btn-outline-dark" href="cart_list_form.jsp">
                      <i class="bi-cart-fill me-1"></i>
                      Cart
                      <span class="badge bg-dark text-white ms-1 rounded-pill"><%=cart_item_count %></span>
                  </a>
              </form>
              <%} %>
          </div>
      </div>
  </nav>