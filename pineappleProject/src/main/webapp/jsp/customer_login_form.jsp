<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- font -->
     <!-- favicon -->
		<link rel="icon" href="../img/logo2.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&family=Gowun+Batang:wght@400;700&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <script type="text/javascript">
        function customerCreateForm() {
            location.href = "customer_write_form.jsp";
        }

        function login() {
            if (document.f.customerId.value == "") {
                alert("아이디를 입력하세요.");
                document.f.customerId.focus();
                return;
            }
            if (document.f.customerPassword.value == "") {
                alert("비밀번호를 입력하세요.");
                document.f.customerPassword.focus();
                return;
            }

            document.f.action = "customer_login_action.jsp";
            document.f.method='POST';
            document.f.submit();
        }
    </script>
   
</head>
<body style="font-family:Noto Sans KR">
   <!-- 최상단에 메뉴 포함 -->
    <div id="top-menu">
        <jsp:include page="../includes/include_top_menu.jsp" />
    </div>
    <!-- 상단의 메뉴를 고정 -->
	<div id="content">
		<h2>로그인</h2>
	<form name="f">
    <table border="0" cellpadding="0" cellspacing="1">
        <tr>
            <td><label for="customerId">아이디</label></td>
            <td><input type="text" name="customerId" id="customerId" placeholder="아이디 입력"></td>
        </tr>
        <tr>
            <td><label for="customerPassword">비밀번호</label></td>
            <td><input type="password" name="customerPassword" id="customerPassword" placeholder="비밀번호 입력"></td>
        </tr>
    </table>

    <div class="button-container">
        <input type="button" value="로 그 인" class="login-btn" onclick="login();" />
        <input type="button" value="회원가입" class="signup-btn" onclick="customerCreateForm();" />
    </div>
</form>
	</div>
	<!--container end-->

    
</body>

<style type="text/css">
    /* 상단 메뉴 고정 */
 #top-menu {
        width: 100%;
        position: fixed;
        top: 0;
        left: 0;
        background-color: #333;
        color: white;
        text-align: center;
        z-index: 1000;
    }

        /* 로그인 폼을 중앙 정렬 및 배경 색상 */
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            padding-top: 60px; /* 메뉴 높이만큼 여백 추가 */
        }

        /* 로그인 폼을 감싸는 요소 */
#content {
    min-width: 600px;  
    width: 100%;
    max-width: 700px;  
    margin: 80px auto;  
    padding: 40px 50px;  
    background-color: white;
    border-radius: 8px;
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
    text-align: center;
}

        /* 폼 제목 */
        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 27px;
        }


table {
    width: 100%;  
    margin-bottom: 20px; /* 테이블과 버튼 사이 간격 */
    border-spacing: 0 15px; /* 각 행 사이의 수직 간격 */
}

td {
    text-align: center; /* 필드와 라벨 가운데 정렬 */
    padding: 10px 0; /* 셀 내부 여백 */
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px; /* 라벨과 입력 필드 간격 */
}
        /* 입력 필드 스타일 */
       
 input[type="text"], input[type="password"] {
    width: 80%;  /* 입력 필드 너비 확대 */
    padding: 15px;  /* 여백 늘림 */
    font-size: 18px;  /* 폰트 크기 조정 */
    border-radius: 4px;
        }

        /* 레이블과 입력 필드 간격 조정 */
        label {
            margin-right: 20px;
            display: inline-block;
            width: 100px;
            text-align: right;
        }


  /* 회원가입 버튼 스타일 */
      .login-btn, .signup-btn {
    color: #212529;
    border: 1px solid #212529;
    background-color: transparent;
    padding: 14px 50px;
    cursor: pointer;
    font-size: 15px;
    font-weight: bold;
    border-radius: 5px;
    transition: background-color 0.3s, color 0.3s;
}

/* 버튼 컨테이너 */
.button-container {
    margin-top: 30px; /* 폼과 버튼 사이 간격 */
    display: flex;
    justify-content: center; /* 버튼을 가운데 정렬 */
    align-items: center;
    width: 100%;
}
.button-container > input {
	margin-left: 10px;
}
.login-btn:hover, .signup-btn:hover {
    color: #fff;
    background-color: #212529;
    border-color: #212529;
}

.login-btn:focus, .signup-btn :focus {
    outline: none; /* 포커스 시 외곽선 제거 */
    box-shadow: 0 0 0 0.2rem rgba(33, 37, 41, 0.5); /* 포커스 시 그림자 효과 */
}

  .login-btn:active, .signup-btn:active {
    color: #fff; /* 클릭 시 텍스트 색상 */
    background-color: #212529; /* 클릭 시 배경색 */
    border-color: #212529; /* 클릭 시 경계 색상 */
}
</style>
</html>
