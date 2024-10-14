<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.domain.CustomerCoupons"%>
<%@page import="com.itwill.shop.domain.Customer"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="customer_login_check.jspf"  %>      
<%	
/*** 서비스 선언 ***/
	CustomerService customerService = new CustomerService();

	/*** 로그인 아이디 부여 ***/
	int customerNo = Integer.parseInt((String)session.getAttribute("sCustomerNo"));
	Customer loginCustomer = customerService.findCustomerByNo(customerNo);
	
	/*** 날짜 포멧 ***/
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); 
	
	/*** 사용자 보유 쿠폰 리스트 조회 ***/
	//customerService.findCouponList(loginCustomer.getCustomerNo());
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/customer_view.css">
<script type="text/javascript">
		function customerModifyAction() {
			/* if (document.f.password.value == "") {
				alert("비밀번호를 입력하십시요.");
				document.f.password.focus();
				return false;
			}
			if (document.f.password2.value == "") {
				alert("비밀번호확인을 입력하십시요.");
				document.f.password2.focus();
				return false;
			} */
			if (document.f.address.value == "") {
				alert("주소를 입력하십시요.");
				document.f.address.focus();
				return false;
			}
			/* if (document.f.gender.value == "") {
				alert("성별을 입력하십시요.");
				document.f.gender.focus();
				return false;
			} */
			if (document.f.phone.value == "") {
				alert("전화번호를 입력하십시요.");
				document.f.phone.focus();
				return false;
			}
			if (document.f.email.value == "") {
				alert("이메일 주소를 입력하십시요.");
				document.f.email.focus();
				return false;
			}
			if (document.f.nickname.value == "") {
				alert("닉네임을 입력하십시요.");
				document.f.nickname.focus();
				return false;
			}
			/* if (document.f.password.value != document.f.password2.value) {
				alert("비밀번호와 비밀번호확인은 일치하여야합니다.");
				document.f.password.focus();
				document.f.password.select();
				return false;
			} */
			
			let checkPassword = prompt("비밀번호를 입력해주세요");
			
			if(checkPassword == null || checkPassword === "") {
				alert("비밀번호를 입력해주세요");
				return;
			}
			document.getElementById("inputPassword").value=checkPassword;
					
			document.f.action = "customer_modify_action.jsp";
			console.log("customerModifyAction()");
			document.f.method='POST';
			document.f.submit();
		}
		
		function customerView() {
			
			document.f.action = "customer_view.jsp";
			document.f.method='POST';
			document.f.submit();
		}
</script>

<style>
		
         body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            /* display: flex; */
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
        }
      
        .big-container {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
         
        .container2 {
            width: 40%;
            padding: 20px;
            border-radius: 15px;
            background-color: #fff;
            border: 1px solid #ddd;
            margin: 5px auto;
        }
       
        .h1modify {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            margin-top: 20px;
        }
       
        .modifyForm {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
         
        .form-group2 {
            width: 80%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 8px;
         margin-right: 120px;
        }
        
        label {
            width: 35%;
            color: #555;
            font-weight: bold;
            text-align: right;
            margin-right: 10px;
        }
        input[type="text"], input[type="password"], input[type="email"] {
            width: 50%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .buttons {
            margin-top: 10px;
            text-align: center;
            
        }
        button {
         color: #212529; 
         border: 1px solid #212529;
         background-color: transparent;
         padding: 10px 20px; 
         cursor: pointer; 
         font-size: 11px; 
         font-weight: bold; 
         border-radius: 5px; 
         transition: background-color 0.3s, color 0.3s; 
        }
        
        button:hover {
                  color: #fff;
                  background-color: #212529;
                  border-color: #212529;
              }
              button:focus {
                  outline: none;
                  box-shadow: 0 0 0 0.2rem rgba(33, 37, 41, 0.5);
              }
              button:active {
                  color: #fff;
                  background-color: #212529;
                  border-color: #212529;
              }
        
   
</style>
</head>
<body>
<jsp:include page="../includes/include_top_menu.jsp" />
<form name="f" method="post" class="modifyForm">
	<input type="hidden" id="inputPassword" name="inputPassword" value="" />
           <header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-dark">
				<h1 class="display-4 fw-bolder">유저 정보 수정</h1>
				<p class="lead fw-normal text-dark mb-0"></p>
			</div>
		</div>
	</header>
	<div class="big-container">
        <div class="container2">
            
		<!-- 사용자 아이디 -->
		<div class="form-group2">
        <label for="userId">사용자 아이디 :</label>
		<input type="text" id="userId" value="<%=loginCustomer.getCustomerId() %>" disabled>
		</div>	
		 
		<!-- 사용자 비밀번호 -->	
		<div class="form-group2">
		<label for="password">비밀번호 :</label>
		<input type="password" id="password" value="<%=loginCustomer.getCustomerPassword() %>"  disabled>
		</div>
			
		<!-- 사용자 비밀번호 확인 -->	
		<!-- <div class="form-group2">
		<label for="passwordConfirm">비밀번호 확인:</label>
		<input type="password" id="password2" name="password2" value="">
		</div> -->
		
		<!-- 사용자 이름 -->
		<div class="form-group2">	
		<label for="name">사용자 이름 :</label>
		<input type="text" id="name" name="name" value="<%=loginCustomer.getCustomerName() %>" disabled>
		</div>
		
		<!-- 사용자 생년월일 -->	
		<div class="form-group2">
		<label for="birthdate">생년월일 :</label>
		<input type="text" id="birthdate" value="<%=simpleDateFormat.format(loginCustomer.getCustomerDob()) %>" disabled>
		</div>
		
		<!-- 사용자 주소 -->
		<div class="form-group2">
		<label for="address">사용자 주소 :</label>
		<input type="text" id="address" name="address" value="<%=loginCustomer.getCustomerAddress()%>">
		</div>
		
		<!-- 사용자 전화번호 -->
		<div class="form-group2">
		<label for="phone">전화번호 :</label>
		<input type="text" id="phone"name="phone" value="<%=loginCustomer.getCustomerPhone()%>">
		</div>
		
		<!-- 사용자 이메일 -->
		<div class="form-group2">
		<label for="email">이메일 :</label>
		<input type="email" id="email" name="email" value="<%=loginCustomer.getCustomerEmail()%>">
		</div>
		
		<!-- 사용자 닉네임 -->	
		<div class="form-group2">
		<label for="nickname">닉네임 :</label>
		<input type="text" id="nickname" name="nickname" value="<%=loginCustomer.getCustomerNickname() %>">
		</div>
		
		<!-- 사용자 가입날짜 -->
		<div class="form-group2">
		<label for="userId">가입 날짜 :</label>
		<input type="text" id="joindate" value="<%=simpleDateFormat.format(loginCustomer.getCustomerJoindate())%>" disabled>
	 	</div>
	 <div class="buttons" style="margin-top: 50px;">
				<button type="button" onClick="customerModifyAction()">내정보수정</button>
				<button type="button" onClick="customerView()">메인</button>
	</div>
		
		</div>
	</div>
</form>

</body>
</html>