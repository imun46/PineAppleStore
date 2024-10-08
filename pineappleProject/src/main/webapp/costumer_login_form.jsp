<%@page import="com.itwill.shop.customer.Customer"%>
<%@page import="com.itwill.shop.customer.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css">
<script type="text/javascript">
	function userCreateForm() {
		location.href = "user_write_form.jsp";
	}

	function login() {
		if (document.f.userId.value == "") {
			alert("아이디를 입력하세요.");
			document.f.userId.focus();
			return;
		}
		if (document.f.password.value == "") {
			alert("비밀번호를 입력하세요.");
			f.password.focus();
			return;
		}

		document.f.action = "user_login_action.jsp";
		document.f.method='POST';
		document.f.submit();
	}
</script>
<style>
	/* 화면 전체를 중앙 정렬 */
	body, html {
		height: 100%;
		margin: 0;
		display: flex;
		justify-content: center; /* 가로 중앙 정렬 */
	}
	/* 로그인 폼을 감싸는 요소 */
	#content {
		width: 100%; /* 필요에 따라 조정 가능 */
		max-width: 600px; /* 최대 넓이 설정 */
		text-align: center;
	}
	/* 내부 테이블 중앙 정렬 */
	form table {
		margin-left: auto;
		margin-right: auto;
	}
</style>
</head>
<body>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page=""/>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page=""/>
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">

				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>사용자 관리
											- 로그인</b></td>
								</tr>
							</table> 
							<!-- login Form  -->
							<form name="f" >
								<table border="0" cellpadding="0" cellspacing="1"
									bgcolor="BBBBBB">
									<tr>
										<td width=150 align=center bgcolor="E6ECDE" height="22">아이디</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 150" name="userId" value="">&nbsp;&nbsp;<font color="red"></font></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="password"
											style="width: 150" name="password" value="">&nbsp;&nbsp;<font color="red"></font></td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
									<input type="button" value="로그인"	onClick="login();"> &nbsp; 
									<input type="button" value="회원가입" onClick="userCreateForm()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page=""/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
