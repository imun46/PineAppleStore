<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>첫 가입 기념 쿠폰</title>
<style>
    body {
        margin: 0; /* 기본 여백 제거 */
    }
    .image-container {
        text-align: center; /* 이미지와 버튼을 중앙 정렬 */
        position: relative; /* 버튼을 이미지 안에 위치시키기 위해 relative로 설정 */
        margin-top: 0px; /* 메뉴와 이미지 간격 설정 */
    }
    .coupon-img {
        width: 412px; /* 화면의 100% 너비 */
        max-width: 700px; /* 최대 너비 설정 */
        height: 583px; /* 비율에 맞게 높이 자동 설정 */
        display: block; /* 이미지가 블록 요소로 취급되도록 설정 */
        margin: 0px; /* 이미지가 중앙에 배치되도록 설정 */
    }
    .coupon-issue-img {
        width: 80%; /* 버튼 크기에 맞춤 */
        height: auto;
        
    }
    button {
        position: absolute; /* 버튼을 절대 위치로 설정 */
        bottom: 183px; /* 이미지 하단에서 187px 위에 위치 */
        left: 50%; /* 이미지의 중앙에 위치 */
        transform: translateX(-50%); /* 버튼을 중앙 정렬 */
        border: none; /* 버튼 테두리 제거 */
        background: none; /* 버튼 배경 제거 */
        cursor: pointer; /* 마우스 커서를 포인터로 변경 */
        
    }
</style>
<script>
    function InsertAction(event) {
    	event.preventDefault()// 기본 동작(페이지 새로고침) 방지
		console.log("InsertAction()");
        document.f.action="customer_join_coupon_action.jsp";
		document.f.method='POST';
		document.f.submit();
    }
    
</script>
</head>
<body>
<form name="f" method="post">
    <div class="top-menu">
      <%--   <jsp:include page="../includes/include_top_menu.jsp" /> --%>
    </div>
    <div class="image-container">
        <img class="coupon-img" src="../img/첫가입쿠폰.png" alt="쿠폰 이미지">
        <button onclick="InsertAction(event)">
            <img class="coupon-issue-img" src="../img/쿠폰 발급.png" alt="쿠폰 발급 이미지">
        </button>
    </div>
</form>
</body>
</html>

