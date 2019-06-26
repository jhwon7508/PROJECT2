<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<style type="text/css">
@import url(font-awesome.min.css);

@import
	url("https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700")
	;

</style>
<script type="text/javascript">
function sample6_execDaumPostcode() { //주소 찾기 버튼
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('memAddr1').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('memAddr2').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('memAddr3').focus();
        }
    }).open();
}

function cancel() { // 취소 버튼
	history.back();
}

function isSame() { //비밀번호 확인
	var pw = document.getElementById("memPw").value;
	var pws = document.getElementById("memPws").value;
	
	if(pw.length >= 8){
		if(pw == pws) {
			document.getElementById("same").innerHTML="비밀번호가 일치합니다.";
			document.getElementById("same").style.color="blue";
			document.getElementById("pwsame").value = "1";
		} else {
			document.getElementById("same").innerHTML="비밀번호가 일치하지 않습니다.";
			document.getElementById("same").style.color="red";
			document.getElementById("pwsame").value = "0";
		} 
	} 
	else {
		document.getElementById("same").innerHTML="비밀번호는 8글자 이상이어야 합니다.";
		document.getElementById("same").style.color="red";
		document.getElementById("pwsame").value = "0";
	}
	
}
	
function idCheck() { //아이디 중복 체크
	var id = document.getElementById("memId").value;
	if(id == "" || id == null){
		alert("아이디를 입력하시오!");
	}
	else if(id.length < 6 || id.length > 16){
		alert("아이디는 6글자이상 16글자 이하이여야 합니다.");
	} else {
		url = "memberIdCheck.jsp?memId=" + id;
		window.open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	}
}
	
function checkinput() { //빈 칸 체크
	var id = document.getElementById("memId").value;
	var ids = document.getElementById("c").value;
	var pw = document.getElementById("memPw").value;
	var name = document.getElementById("memName").value;
	var address1 = document.getElementById("memAddr1").value;
	var address2 = document.getElementById("memAddr2").value;
	var address3 = document.getElementById("memAddr3").value;
	var tel2 = document.getElementById("memTel2").value;
	var tel3 = document.getElementById("memTel3").value;
	var email = document.getElementById("memEmail").value;
	
	if(pw == "" || pw == null) {
		alert("비밀번호를 입력하시오!");
	}
	else if(name == "" || name == null) {
		alert("이름을 입력하시오!");
	}
	else if(address1 == "" || address1 == null) {
		alert("주소를 입력하시오!");
	}
	else if(address2 == "" || address2 == null) {
		alert("주소를 입력하시오!");
	}
	else if(address3 == "" || address3 == null) {
		alert("주소를 입력하시오!");
	}
	else if(tel2 == "" || tel2 == null) {
		alert("연락처를 입력하시오!");
	}
	else if(tel3 == "" || tel3 == null) {
		alert("연락처를 입력하시오!");
	}
	else if(email == "" || email == null) {
		alert("이메일을 입력하시오!");
	} 
	else if(ids == 0) {
		alert("아이디 중복확인을 하시오!");
	} 
	else if(id != ids){
		alert("아이디 중복확인을 하시오!");
	} 
	else {
		document.myForm.submit(); 
	}
}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<center>
		<br> <br>
		<div>
			<h1>회원가입</h1>
			<br> <br> <br> <br> <br> <input
				type="hidden" id="c" value="0">
			<form action="memberJoinOK.jsp" method="post" name="myForm">
				<table>
					<tr>
						<td class="td1">&nbsp&nbsp아이디&nbsp&nbsp</td>
						<td class="td2">&nbsp&nbsp<input type="text" id="memId"
							name="memId">
							<button type="button" onclick="idCheck(this.form)">중복확인</button></td>
					</tr>
					<tr>
						<td class="td1">&nbsp&nbsp비밀번호&nbsp&nbsp</td>
						<td class="td2">&nbsp&nbsp<input type="password" id="memPw"
							name="memPw" onkeyup="isSame()"><input type="hidden"
							id="pwsame"></td>
					</tr>
					<tr>
						<td class="td1">&nbsp&nbsp비밀번호확인&nbsp&nbsp</td>
						<td class="td2">&nbsp&nbsp<input type="password" id="memPws"
							name="memPws" onkeyup="isSame()">&nbsp<span id="same"
							style="font-size: 10px;"></span></td>
					</tr>
					<tr>
						<td class="td1">&nbsp&nbsp이름&nbsp&nbsp</td>
						<td class="td2">&nbsp&nbsp<input type="text" name="memName"
							id="memName"></td>
					</tr>
					<tr>
						<td class="td1">&nbsp&nbsp주소&nbsp&nbsp</td>
						<td class="td2">&nbsp&nbsp <input type="text" name="memAddr1"
							id="memAddr1" placeholder="우편번호"> <input type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>&nbsp&nbsp
							<input type="text" name="memAddr2" id="memAddr2" placeholder="주소">
							<input type="text" name="memAddr3" id="memAddr3"
							placeholder="상세주소"> <!-- <input type="text" name="memAddr" id="memAddr"> -->
						</td>
					</tr>
					<tr>
						<td class="td1">&nbsp&nbsp연락처</td>
						<td class="td2">&nbsp&nbsp <select name="memTel1"
							id="memTel1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select>&nbsp-&nbsp <input type="text" name="memTel2" id="memTel2">&nbsp-&nbsp
							<input type="text" name="memTel3" id="memTel3">
						</td>
					</tr>
					<tr>
						<td class="td1">&nbsp&nbsp이메일</td>
						<td class="td2">&nbsp&nbsp<input type="text" name="memEmail"
							id="memEmail"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"></td>
					</tr>
				</table>
				<br>
				<button id="b2" type="button" onclick="checkinput()">회원가입</button>
				&nbsp&nbsp
				<button id="b3" type="button" onclick="cancel()">취 소</button>
			</form>
		</div>
	</center>
</body>
</html>