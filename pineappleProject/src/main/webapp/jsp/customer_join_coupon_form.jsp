<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/login_check.jspf"  %>

 <%
 	/*** 서비스 객체 생성***/
	CustomerService customerService = new CustomerService();
	
	/*** 아이디번호 가져와 int로 형변환 후 Customer객체 생성 ***/
	int customerNo = Integer.parseInt(sCustomerNo);
	Customer loginCustomer = customerService.findCustomerByNo(customerNo);
	
	/*** 날짜 포맷 설정 ***/
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	
 %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>첫 가입 기념 쿠폰</title>
<style>
    body {
        margin: 0; /* 기본 여백 제거 */
    }
    .top-menu {
        background-color: #f8f9fa; /* 메뉴 배경색 */
        padding: 10px; /* 메뉴의 여백 */
        text-align: center; /* 메뉴 중앙 정렬 */
    }
    .image-container {
        text-align: center; /* 이미지와 버튼을 중앙 정렬 */
        position: relative; /* 버튼을 이미지 안에 위치시키기 위해 relative로 설정 */
        margin-top: 10px; /* 메뉴와 이미지 간격 설정 */
    }
    .coupon-img {
        width: 100vw; /* 화면의 100% 너비 */
        max-width: 700px; /* 최대 너비 설정 */
        height: auto; /* 비율에 맞게 높이 자동 설정 */
        display: block; /* 이미지가 블록 요소로 취급되도록 설정 */
        margin: 0 auto; /* 이미지가 중앙에 배치되도록 설정 */
    }
    .coupon-issue-img {
        width: 70%; /* 버튼 크기에 맞춤 */
        height: auto;
    }
    button {
        position: absolute; /* 버튼을 절대 위치로 설정 */
        bottom: 300px; /* 이미지 하단에서 100px 위에 위치 */
        left: 50%; /* 이미지의 중앙에 위치 */
        transform: translateX(-50%); /* 버튼을 중앙 정렬 */
        border: none; /* 버튼 테두리 제거 */
        background: none; /* 버튼 배경 제거 */
        cursor: pointer; /* 마우스 커서를 포인터로 변경 */
    }
</style>
<script>
    // 버튼 클릭 시 이미지 숨기는 함수
    function hideCouponImage() {
        var couponImage = document.querySelector('.image-container');
        couponImage.style.display = 'none'; // 이미지와 버튼을 감싼 컨테이너 숨기기
        document.f.action="customer_join_coupon_action.jsp"
		document.f.method='POST';
		document.f.submit();
    }
</script>
</head>
<body>
<form name="f" method="post">
    <div class="top-menu">
        <jsp:include page="../includes/include_top_menu.jsp" />
    </div>
    <div class="image-container">
        <img class="coupon-img" src="첫가입쿠폰.png" alt="쿠폰 이미지">
        <button onclick="hideCouponImage()">
            <img class="coupon-issue-img" src="쿠폰 발급.png" alt="쿠폰 발급 이미지">
        </button>
    </div>
</form>
</body>
</html>

