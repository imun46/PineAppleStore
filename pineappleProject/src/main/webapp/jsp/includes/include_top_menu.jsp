<%@ page import="com.itwill.shop.cart.CartService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int cart_item_count=0;
	String sCustomerId=(String)session.getAttribute("sCustomerId");
	if(sCustomerId!=null){
		CartService cartService = new CartService();
		//cart_item_count = cartService.findByCustomerNo(customerNo).size();
	}
	
%>		
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container px-4 px-lg-5">
          <a class="navbar-brand" href="main.jsp">pineApple</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                  <li class="nav-item"><a class="nav-link" aria-current="page" href="main.jsp">Home</a></li>
                  <li class="nav-item"><a class="nav-link" href="product_list.jsp?category=phone">Phone</a></li>
                  <li class="nav-item"><a class="nav-link" href="#!">Laptop</a></li>
                  <li class="nav-item"><a class="nav-link" href="#!">Pad</a></li>
                  <li class="nav-item"><a class="nav-link" href="#!">Watch</a></li>
                  <li class="nav-item"><a class="nav-link" href="#!">EarPhone</a></li>
                  <li class="nav-item"><a class="nav-link" href="#!">악세사리</a></li>
              </ul>
              <%if(sCustomerId== null) {%>
              <form class="d-flex">
                  <a class="btn btn-outline-dark" href="#">
                      <i class="fa-solid fa-user"></i>
                      Login
                  </a>
                  <a class="btn btn-outline-dark" href="#">
                      <i class="fa-solid fa-user-plus"></i>
                      Sign up
                  </a>
                  <a class="btn btn-outline-dark" href="#">
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
                  <a class="btn btn-outline-dark" href="#">
                      <i class="bi-cart-fill me-1"></i>
                      Cart
                      <span class="badge bg-dark text-white ms-1 rounded-pill"><%=cart_item_count %></span>
                  </a>
              </form>
              <%} %>
          </div>
      </div>
  </nav>