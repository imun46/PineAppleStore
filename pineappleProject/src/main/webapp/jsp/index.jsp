<%@page import="com.itwill.shop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page import="com.itwill.shop.service.ProductService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	
	/*** 로그인 체크, 로그인 안했으면 팝업창 띄우지 않음 ***/
	String sCustomerNo = (String)session.getAttribute("sCustomerNo");
	if(sCustomerNo == null) {
		out.println("<script>");
		out.println("document.addEventListener('DOMContentLoaded', function() { closePopup(); });");
		out.println(" console.log(\"sCustomerNo\");");
		out.println("</script>");
	}
	/*************************************************************/
	
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
	<!-- 팝업창 스타일 설정 start -->
	<style>
	.popup1 {
    display: none; /* 기본적으로 숨김 */
    position: fixed;
    top: 50%;
    left: 15%;
    transform: translate(-50%, -50%);
    width: 412px; 
    max-width: 320px; 
    height: 583px; /* 높이를 자동으로 조절 */
    z-index: 1000; /*** 위치가 z축 1000, 위에 있게 ***/
    margin: 0px;
}

 .popup1 iframe {
        width: 412px; /* iframe이 팝업의 너비를 가득 채움 */
        height: 583px; /* iframe 높이를 팝업의 높이에 맞춤 */
        border: none; /* iframe 테두리 제거 */
    }

.checkbox-container {
    padding: 5px; /* 내부 여백 조정 */
    position: relative;
    bottom: 41px; /* 이미지 하단에서 44px 위에 위치 */
    
	}
	</style>
	
	<!-- 팝업창 스타일 설정 end -->
	
	<jsp:include page="../includes/include_top_menu.jsp" />
	
	<video autoplay muted loop style="width:100%; height: 600px;">
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
           -  <% 
             	int product_size = productList.size();
				
				for(int i = 0; i<product_size;i++){
					Product product = productList.get(i);
             %>
                 <div class="col mb-5">
                     <div class="card h-100">
                         <!-- Product image-->
                         <img class="card-img-top" src="../product_image/<%= product.getProductImageList().get(0).getProductImageFile() %>" alt="상품이미지" />
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
	
	<!-- 팝업창 설정 start -->
	<div class="popup1" id="popup1">
    <iframe src="customer_join_coupon_form.jsp" frameborder="0"></iframe>
    <div class="checkbox-container">
        <label id="todayDontShowAgain" style="color: white;">
            <input type="checkbox" id="dontShowAgain" > 오늘 하루 보지 않음
        </label>
    </div>
</div>
	
	<!-- 팝업창 스크립트 start -->
	<script>
	function closePopup() {
		console.log("closePopup()");
		document.getElementById('popup1').style.display = 'none';
	}
	
	// 팝업 표시 여부 확인
	function shouldShowPopup() {
	    const lastClosed = localStorage.getItem('lastClosed');
	    if (!lastClosed) return true; // 값이 없으면 팝업을 보여줌
	    const now = new Date().getTime();
	    const twelveHours = 12 * 60 * 60 * 1000; // 12시간을 밀리초로 변환
	    return now - lastClosed > twelveHours; // 12시간이 지났으면 true
	};
	
	// 체크박스 클릭 시 팝업 닫기
	document.getElementById('dontShowAgain').onclick = function() {
	    if (this.checked) {
	        localStorage.setItem('lastClosed', new Date().getTime()); // 현재 시간을 로컬 스토리지에 저장
	    }
	    document.getElementById('popup1').style.display = 'none';
	};

	// 페이지 로드 시 팝업 표시
	window.onload = function() {
		<% if (sCustomerNo != null) { %>
	        if (shouldShowPopup()) {
	            document.getElementById('popup1').style.display = 'block';
	        }
	    <% } %>
	};
	
	</script>
	<!-- 팝업창 스크립트 end -->
	<!-- 팝업창 설정 end  -->
</body>
</html>