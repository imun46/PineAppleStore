<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<video autoplay muted style="width:100%; height: 600px;">
	 <source src="banner_video.mp4" type="video/mp4">
	</video>
	<hr style="margin: 0px;">
	 <!-- Section-->
	 <h1 style="margin: 20px auto; font-weight: 600; text-align: center; font-size: 50px;" >
	 STORE
	 </h1>
     <section class="py-5">
         <div class="container px-4 px-lg-5 mt-5">
             <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                 <div class="col mb-5">
                     <div class="card h-100">
                         <!-- Product image-->
                         <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                         <!-- Product details-->
                         <div class="card-body p-4">
                             <div class="text-center">
                                 <!-- Product name-->
                                 <h5 class="fw-bolder">Fancy Product</h5>
                                 <!-- Product price-->
                                 $40.00 - $80.00
                             </div>
                         </div>
                         <!-- Product actions-->
                         <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                             <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                         </div>
                     </div>
                 </div>
     		</div>
     	</div>
     </section>	
	
</body>
</html>