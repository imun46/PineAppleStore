function customerCreate() {
	if(f.id.value ==""){
		alert("사용자 아이디를 작성해주세요");
		f.id.focus();
		return false;
	}
	if(f.password1.value ==""){
		alert("사용자 비밀번호를 작성해주세요");
		f.password1.focus();
		return false;
	}
	if(f.password2.value ==""){
		alert("사용자 아이디를 작성해주세요");
		f.password2.focus();
		return false;
	}
	if(f.name.value ==""){
		alert("사용자 이름을 작성해주세요");
		f.name.focus();
		return false;
	}
	
	if(f.nickname.value ==""){
			alert("사용자 닉네임을 작성해주세요");
			f.name.focus();
			return false;
		}
	if(f.dob.value ==""){
		alert("사용자 날짜를 작성해주세요");
		f.dob.focus();
		return false;
	}
	if(f.email.value ==""){
		alert("사용자 이메일를 작성해주세요");
		f.email.focus();
		return false;
	}
	if(f.address.value ==""){
		alert("사용자 주소를 작성해주세요");
		f.address.focus();
		return false;
	}
	if(f.phone.value ==""){
		alert("사용자 전화번호를 작성해주세요");
		f.phone.focus();
		return false;
	}
	if (!f.gender.value) {
	       alert("성별을 선택해주세요");
	       return false;
		   }
	if(f.password1.value != f.password2.value){
		alert("비밀번호가 일치하지 않습니다.");
		f.password1.focus();
		return false;
	}
	f.action = "customer_write_action.jsp";
	f.method='POST';
	f.submit();
	
}