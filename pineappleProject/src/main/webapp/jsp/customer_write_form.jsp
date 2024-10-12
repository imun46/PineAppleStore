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
<script type="text/javascript" src="../js/customer_write.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!--css start  -->
<style type="text/css">
body {
    margin: 0;
}

 /*중복시  오류메세지  */
.error-message {
    color: red;
    font-size: 0.9em;
    margin-top: 5px;
}

.addcontent{
	width: 460px;
    margin: 0 auto;
    position: relative;
}




a {
    /* TEXT의 기본 꾸밈 제거 */
    text-decoration: nones;
    color: black;
}

#container{
    margin : 0 auto;
    min-width: 460px;
    max-width: 768px;
}

#logo-container{
    padding-top: 60px;
    padding-bottom: 20px;

}
#logo {
    /* 가로 가운데 정렬 */
    margin: 0 auto;        
    display: block;
    width: 240px;
    height: 44px;
    /*배경 이미지*/
    background: url();
    /*빈 공간에 배경 이미지를 반복해서 보여줄건지*/
    background-repeat: no-repeat;
    background-size: 240px auto;
    font-size: 0;

}

.inline{
    display: flex;
}

.flex{
    display: flex;
    width: 100%;
    justify-content: space-between;
}

.flex-1{
    flex: auto;
}

.content{
    width: 460px;
    margin: 0 auto;
}



.addcontent{
	width: 460px;
    margin: 0 auto;
    position: relative;
}

.input-style {
	
    width: 460px;
    padding-left: 14px;
    padding-right: 14px;
    padding-top: 10px;
    padding-bottom: 10px;
    border: 1px solid #dadada;
    border-radius: 4px;
    margin-right: 30px;
}

.duplicate-style {
	width: 460px;
    padding-left: 14px;
    padding-right: 14px;
    padding-top: 10px;
    padding-bottom: 10px;
    border: 1px solid #dadada;
    margin-right: 30px;
	
}

.input-middle-style{
    width: 119px;
    display: block;
    padding-left: 14px;
    padding-right: 14px;
    padding-top: 10px;
    padding-bottom: 10px;
    border: 1px solid #dadada;
}

.input-label {     
    margin-top: 19px;
    margin-bottom: 8px;
    /* 글자의 크기 */
    font-size: 14px;
    /* 글자의 굵기 */
    font-weight: 700;
}

.join-button {
    color: #212529; /* 버튼 텍스트 색상 */
    border: 1px solid #212529; /* 버튼 경계 색상 */
    background-color: transparent; /* 배경색 투명 */
    padding: 15px 0; /* 상하 패딩 */
    cursor: pointer; /* 마우스 포인터를 손가락 모양으로 변경 */
    font-size: 18px; /* 글자 크기 */
    font-weight: 700; /* 글자 두께 */
    border-radius: 5px; /* 모서리 둥글게 */
    transition: background-color 0.3s, color 0.3s; /* 호버 시 변화 애니메이션 */
    width: 93%; /* 너비를 100%로 설정 */
    margin-top: 20px;
}

.join-button:hover {
    color: #fff; /* 호버 시 텍스트 색상 */
    background-color: #212529; /* 호버 시 배경색 */
    border-color: #212529; /* 호버 시 경계 색상 */
}

.join-button:focus {
    outline: none; /* 포커스 시 외곽선 제거 */
    box-shadow: 0 0 0 0.2rem rgba(33, 37, 41, 0.5); /* 포커스 시 그림자 효과 */
}

.join-button:active {
    color: #fff; /* 클릭 시 텍스트 색상 */
    background-color: #212529; /* 클릭 시 배경색 */
    border-color: #212529; /* 클릭 시 경계 색상 */
}

/*  스타일 적용이 안되서 이것만 밖으로 뺌 */
.addBt {
    position: absolute; 
    top: 45%;
    right: -90px;
    color: #212529; /* 버튼 텍스트 색상 */
    border: 1px solid #212529; /* 버튼 경계 색상 */
    background-color: transparent; /* 배경색 투명 */
    padding: 10px 20px; /* 버튼의 패딩 */
    cursor: pointer; /* 마우스 포인터를 손가락 모양으로 변경 */
    font-size: 11px; /* 글자 크기 */
    font-weight: bold; /* 글자 두께 */
    border-radius: 5px; /* 모서리 둥글게 */
    transition: background-color 0.3s, color 0.3s; /* 호버 시 변화 애니메이션 */
}

.addBt:hover {
    color: #fff; /* 호버 시 텍스트 색상 */
    background-color: #212529; /* 호버 시 배경색 */
    border-color: #212529; /* 호버 시 경계 색상 */
}

.addBt:focus {
    outline: none; /* 포커스 시 외곽선 제거 */
    box-shadow: 0 0 0 0.2rem rgba(33, 37, 41, 0.5); /* 포커스 시 그림자 효과 */
}

.addBt:active {
    color: #fff; /* 클릭 시 텍스트 색상 */
    background-color: #212529; /* 클릭 시 배경색 */
    border-color: #212529; /* 클릭 시 경계 색상 */
}

.addcontent{
	width: 460px;
    margin: 0 auto;
    position: relative;
}


/*성별 레이블  */
.gender-label {
    margin-right: 20px; /* 라벨 간 간격 조정 */
    font-size: 14px; /* 글자 크기 조정 */
}



.inline-gender label {
	text-align: center;
    margin-right: 20px; /* 각 항목 간의 간격 */
    font-size: 15px; /* 글자 크기 조정 */
    
}

.p-gender{
	font-size: 14px;
	font-weight: 700;
}

.input-genderstyle{
	width: 200px;
}



</style>

<!--css End  -->


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

<jsp:include  page="../includes/include_top_menu.jsp"></jsp:include>


<body>
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-dark">
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
                        <div class="inline-gender">
                            <label >
                            <input class="input-genderstyle" type="radio" name="gender" value="남">
                              <p class="p-gender">남자</p> 
                            </label> 
                            <label > 
                            <input class="input-genderstyle" type="radio" name="gender" value="여">
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
    </div>
</body>
</html>
