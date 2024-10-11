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
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/customer_write_style.css" />
<script type="text/javascript" src="../js/customer_write.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
/*  스타일 적용이 안되서 이것만 밖으로 빼놈 */
.addBt {
	position: absolute !important;
	top: 50% !important;
	right: -76px !important;
}

.addcontent{
	width: 460px;
    margin: 0 auto;
    position: relative;
}
</style>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
    			console.log(data);
    			console.log(data.address);
    			
    			document.f.address.value=data.address;
    			
            }
        }).open();
    }
</script>
<title>회원가입</title>
</head>



<body>
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">회원가입</h1>
                <p class="lead fw-normal text-white-50 mb-0">어세오세욤 :)</p>
            </div>
        </div>
    </header>

    <div>
        <div>
            <div id="logo-container">
                <a id="logo">Pinapple</a>
            </div>

            <div id="container">
                <form name="f" method="POST" action="customer_write_action.jsp">
                    <div class="content">
                        <div class="input-label">아이디</div>
                        <div class="inline"> 
                            <input class="input-style" type="text" name="id"  /> 
                        </div>
                    </div>
                    <br />

                    <div class="content">
                        <div class="input-label">비밀번호</div>
                        <div class="inline">
                            <input class="input-style" type="password" name="password1" />
                        </div>
                    </div>
                    <br />

                    <div class="content">
                        <div class="input-label">비밀번호 확인</div>
                        <div class="inline">
                            <input class="input-style" type="password" name="password2" />
                        </div>
                    </div>
                    <br />

                    <div class="content">
                        <div class="input-label">이름</div>
                        <div class="inline">
                            <input class="input-style" type="text" name="name" />
                        </div>
                    </div>
                    <br />

                    <div class="content">
                        <div class="input-label">닉네임</div>
                        <div class="inline">
                            <input class="input-style" type="text" name="nickname"  />
                        </div>
                    </div>
                    <br />

                    <div class="content">
                        <div class="input-label">생년월일</div>
                        <div class="inline">
                            <input class="input-style" type="date" name="dob" />
                        </div>
                    </div>
                    <br />

                    <div class="content">
                        <div class="input-label">이메일</div>
                        <div class="inline">
                            <input class="input-style" type="text" name="email" />
                        </div>
                    </div>
                    <br />

                    <div class="addcontent">
                    	<input class="addBt" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                        <div class="input-label">주소</div>
                        <div class="inline">
                            <input class="input-style"  type="text" name="address" />
                        </div>
                    </div>
                    <br />

                    <div class="content">
                        <div class="input-label">전화번호</div>
                        <div class="inline">
                            <input class="input-style" type="text" name="phone"  />
                        </div>
                    </div>
                    <br />

                    <div class="content">
                        <div class="input-label">성별</div>
                        <div class="inline">
                            <label> <input class="input-style" type="radio" name="gender" value="M"> 남자 </label> 
                            <label> <input class="input-style" type="radio" name="gender" value="F"> 여자 </label>
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
    </div>
</body>
</html>
