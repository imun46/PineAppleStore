<%@page import="com.itwill.shop.customer.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/customer_write_style.css" />
<script type="text/javascript" src="../js/customer_write.js"></script>


<title>회원가입</title>
<!-- css 파일에 속성 정의 -->


</head>
<body>
<!-- 파인애플 회원가입 화면-->



	<!-- 파인애플 상단의 메뉴 -->
	<jsp:include page="../includes/include_top_menu.jsp" />
	
	
<!-- 해당 메뉴 이름-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">회원가입</h1>
            <p class="lead fw-normal text-white-50 mb-0">어세오세욤 :)</p>
        </div>
    </div>
</header>
	<!-- 컨테이너 레이아웃 -->
	<div>
		<!-- 가운데 레이아웃 -->
		<div>
			<!-- 로고 레이아웃 -->
			<div id="logo-container">
				<a id=logo> Pinapple </a>
			</div>

			<!-- 컨테이너 레이아웃 -->
			<div id="container">
			
				<!-- 아이디 레이아웃 -->
				<form name="f" method="POST" action="customer_write_action.jsp">
				<div class="content">
					<div class="input-label">아이디</div>
					<div class="inline"> 
						<input class="input-style" type="text" name="id" value=""
						 /> <button class="duplicate-style">중복검사</button>
					</div>
				</div>
				<br />

				<!-- 비밀번호 레이아웃 -->
				<div class="content">
					<div class="input-label">비밀번호</div>
					<div class="inline">
						<input class="input-style" type="password" name="password1" />
					</div>
				</div>
				<br />

				<!-- 비밀번호 확인 레이아웃 -->
				<div class="content">
					<div class="input-label">비밀번호 확인</div>
					<div class="inline">
						<input class="input-style" type="password" name=password2 />
					</div>
				</div>
				<br />

				<!-- 이름 레이아웃-->
				<div class="content">
					<div class="input-label">이름</div>
					<div class="inline">
						<input class="input-style" type="text" name="name" />
					</div>
				</div>
				<!-- 사용자 닉네임 레이아웃-->
				<br />
				<div class="content">
					<div class="input-label">닉네임</div>
					<div class="inline">
						<input class="input-style" type="text" name="nickname" />
					</div>
				</div>
				
				<br />
				<!-- 생년월일 레이아웃-->
				<div class="content">
					<div class="input-label">생년월일</div>
					<div class="inline">
						<input class="input-style" type="date" name="dob" />
					</div>
				</div>
				<!--  이메일 레이아웃 -->
				<div class="content">
					<div class="input-label">이메일</div>
					<div class="inline">
						<input class="input-style" type="text" name="email" />
					</div>
				</div>
					<!--  주소 레이아웃 -->
				<div class="content">
					<div class="input-label">주소</div>
					<div class="inline">
						<input class="input-style" type="text" name="address" />

					</div>
				</div>

				<!--  전화번호 레이아웃 -->
				<div class="content">
					<div class="input-label">전화번호</div>
					<div class="inline">
						<input class="input-style" type="text" name="phone" />
					</div>
				</div>

				<!--  성별 레이아웃 -->
				<div class="content">
					<div class="input-label">성별</div>
					<div class="inline">
						<label> <input class="input-style" type="radio"
							name=gender value="M"> 남자
						</label> <label> <input class="input-style" type="radio"
							name=gender value="F"> 여자
						</label>


					</div>
				</div>
				</form>

				<!-- 버튼 레이아웃 -->
				<div class="content">
					<div class="inline">
						<button class="join-button" onclick="customerCreate();">가입하기</button>
					</div>
				</div>
			</div>
			<br />
		</div>
	</div>
	
	
	
</body>

</html>