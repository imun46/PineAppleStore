<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.service.CustomerService"%>
<%@page import="com.itwill.shop.domain.Customer"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="../js/customer_write.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <!-- favicon -->
		<link rel="icon" href="../img/logo2.png">

<!-- CSS 시작 -->
<style type="text/css">
body {
    margin: 0;
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f9;
    color: #333;
}

.big-container{
	width: 40%;
	padding: 20px;
	border-radius: 15px;
	background-color: #fff;
	border: 1px solid #ddd;
	margin: 5px auto;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}
.error-message {
    color: red;
    font-size: 0.9em;
    margin-top: 5px;
}

#container {
    margin: 0 auto;
    max-width: 600px;
}

#logo-container {
    padding: 50px 0 10px;
    text-align: center;
}

#logo {
    display: block;
    margin: 0 auto;
    width: 240px;
    height: 44px;
}

.inline {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.content {
    width: 100%;
    margin: 0 auto;
}

.input-style {
    width: 100%;
    padding: 10px 14px;
    border: 1px solid #dadada;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
}

.input-label {
    margin-top: 8px;
    margin-bottom: 8px;
    font-size: 16px;
    font-weight: 700;
    color: #333;
}

.join-button {
    color: #fff;
    background-color: #212529;
    border: none;
    padding: 15px 0;
    cursor: pointer;
    font-size: 18px;
    font-weight: 700;
    border-radius: 5px;
    transition: background-color 0.3s;
    width: 100%;
    margin-top: 20px;
}

.join-button:hover {
    background-color: #333;
}

.addBt {
    position: relative; 
    color: #212529;
    border: 1px solid #212529;
    background-color: transparent;
    padding: 10px 20px;
    cursor: pointer;
    font-size: 12px;
    font-weight: bold;
    border-radius: 5px;
    transition: background-color 0.3s, color 0.3s;
    margin-left: 10px;
}

.addBt:hover {
    color: #fff;
    background-color: #212529;
}

.inline-gender label {
	margin-left: 20px;
    margin-right: 20px;
    font-size: 15px;
}

.p-gender {
    font-size: 14px;
    font-weight: 700;
    color: #333;
}

.header-container {
    padding-bottom: 20px;
    text-align: center;
}

.header-container h1 {
    font-size: 2.5rem;
    font-weight: bold;
}

.header-container p {
    font-size: 1.2rem;
    margin-top: 10px;
}

@media (max-width: 768px) {
    .container {
        padding: 10px;
    }

    .content {
        margin: 0;
    }
}
</style>
<!-- CSS 끝 -->

<script>
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.f.address.value = data.address;
        }
    }).open();
}
</script>
<title>회원가입</title>
</head>

<jsp:include page="../includes/include_top_menu.jsp"></jsp:include>

<body>
    <div id="logo-container">
        <img src="/img/logo2.png" alt="Pineapple Logo" style="width: 60px; height: auto;">
    </div>
    <header class="header-container">
        <div class="container">
            <div class="text-center">
                <h1>회원가입</h1>
                <p>반갑습니다 ! </p>
            </div>
        </div>
    </header>

    <div class="big-container">
        <div id="container">
            <form name="f" method="POST" action="customer_write_action.jsp">
                <div class="content">
                    <div class="input-label">아이디</div>
                    <div class="inline"> 
                        <input class="input-style" type="text" name="id" placeholder="아이디를 입력하세요" /> 
                    </div>
                </div>
                <br />

                <div class="content">
                    <div class="input-label">비밀번호</div>
                    <div class="inline">
                        <input class="input-style" type="password" name="password1" placeholder="비밀번호를 입력하세요" />
                    </div>
                </div>
                <br />

                <div class="content">
                    <div class="input-label">비밀번호 확인</div>
                    <div class="inline">
                        <input class="input-style" type="password" name="password2" placeholder="비밀번호를 한 번 더 입력하세요" />
                    </div>
                </div>
                <br />

                <div class="content">
                    <div class="input-label">이름</div>
                    <div class="inline">
                        <input class="input-style" type="text" name="name" placeholder="이름을 입력하세요" />
                    </div>
                </div>
                <br />

                <div class="content">
                    <div class="input-label">닉네임</div>
                    <div class="inline">
                        <input class="input-style" type="text" name="nickname" placeholder="닉네임을 입력하세요" />
                    </div>
                </div>
                <br />

                <div class="content">
                    <div class="input-label">생년월일</div>
                    <div class="inline">
                        <input class="input-style" type="date" name="dob" max="2010-12-31" />
                    </div>
                </div>
                <br />

                <div class="content">
                    <div class="input-label">이메일</div>
                    <div class="inline">
                        <input class="input-style" type="text" name="email" placeholder="이메일을 입력하세요" />
                    </div>
                </div>
                <br />

                <div class="addcontent">
                    <div class="input-label">주소</div>
                    <div class="inline">
                        <input class="input-style" type="text" name="address" placeholder="주소를 입력하세요" />
	                    <input class="addBt" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                    </div>
                </div>
                <br />

                <div class="content">
                    <div class="input-label">전화번호</div>
                    <div class="inline">
                        <input class="input-style" type="text" name="phone" placeholder="전화번호를 입력하세요" />
                    </div>
                </div>
                <br />

                <div class="content">
                    <div class="input-label">성별</div>
                    <div class="inline-gender">
                        <label>
                            <input class="input-genderstyle" type="radio" name="gender" value="남자">
                            <p class="p-gender">남자</p> 
                        </label> 
                        <label> 
                            <input class="input-genderstyle" type="radio" name="gender" value="여자">
                            <p class="p-gender">여자</p> 
                        </label>
                    </div>
                </div>

                <div class="content">
                    <div class="inline">
                        <button type="button" class="join-button" onclick="customerCreate();">가입하기</button>
                    </div>
                </div>
            </form>
        </div>
        <br />
    </div>
</body>
</html>
