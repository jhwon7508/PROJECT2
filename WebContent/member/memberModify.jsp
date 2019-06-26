<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#memTel1,#memTel2,#memTel3 {
	width: 40px;
}
div{
	border: 1px solid gray;
	width: 800px;
	height: 800px;
}
.td1{
font-weight:bold;
	color:gray;
	text-align: left;
	font-size:15px;
	background: lightgray;
	width: 200px;
	height: 40px;
	font-family: 굴림;
	border-bottom: 1px solid gray;
	border-right: 1px solid gray;

}
.td2{
	width: 400px;
	border-bottom: 1px solid gray;
}
table {
	border-collapse: collapse;
}
#b1{
	width: 110px;
	height: 40px;
	background: #8a4680;
	color: white;
	border-radius: 5px 5px 5px 5px;
}
#b2{
	width: 110px;
	height: 40px;
	background: gray;
	color: white;
	border-radius: 5px 5px 5px 5px;
}
</style>
</head>

<body>
<center>

	<%
		request.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("id");
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		dto = dao.memSelect(id);
	%>
	<script type="text/javascript">
	
	function update() { //비밀번호 확인
		var pw = document.getElementById("memPw").value;
		if (pw == null || pw == "") {
			alert("비밀번호를 입력해주세요.");
		} else if(pw != "<%=dto.getMemPw()%>" ) {
			alert("비밀번호가 틀립니다.");
		} else {
			document.myForm.submit();
		} 

	}
	
	function cancel() {//취소 버튼
		history.back();
	}
	
	function sample6_execDaumPostcode() { //주소 번호 찾기
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
</script>
<div>
	<h1>회원정보수정</h1>
	<br><br>
	<form action="memberModifyOK.jsp" method="post" name="myForm">
		<table>
			<tr>
				<td colspan="2" align="center"><b><%=id%>님</b>
				<input type="hidden" name="memId" id="memId" value="<%=id%>"></td>
			</tr>
			<tr>
				<td class="td1">&nbsp&nbsp비밀번호</td>
				<td class="td2">&nbsp&nbsp<input type="password" name="memPw" id="memPw"></td>
			</tr>
			<tr>
				<td class="td1">&nbsp&nbsp이름</td>
				<td class="td2">&nbsp&nbsp<input type="text" name="memName" value="<%=dto.getMemName()%>"></td>
			</tr>
			<tr>
				<td class="td1">&nbsp&nbsp주소</td>
				<td class="td2">&nbsp&nbsp<input type="text" name="memAddr1" id="memAddr1"
				value="<%=dto.getMemAddr1() %>" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>&nbsp&nbsp
				<input type="text" name="memAddr2" id="memAddr2" placeholder="주소" value="<%=dto.getMemAddr2()%>">
				<input type="text" name="memAddr3" id="memAddr3" placeholder="상세주소" value="<%=dto.getMemAddr3()%>"></td>
			</tr>
			<tr>
				<td class="td1">&nbsp&nbsp연락처</td>
				<td class="td2">&nbsp&nbsp
				<input type="text" id="memTel1" name="memTel1" value="<%=dto.getMemTel1()%>">&nbsp-&nbsp
				<input type="text" id="memTel2" name="memTel2" value="<%=dto.getMemTel2()%>">&nbsp-&nbsp
				<input type="text" id="memTel3" name="memTel3" value="<%=dto.getMemTel3()%>">
				</td>
			</tr>
			<tr>
				<td class="td1">&nbsp&nbsp이메일</td>
				<td class="td2">&nbsp&nbsp<input type="text" name="memEmail" value="<%=dto.getMemEmail()%>"></td>
			</tr>
		</table>
		<br>
		<button id="b1" type="button" onclick="update()">수 정</button>&nbsp&nbsp
		<button id="b2" type="button" onclick="cancel()">취 소</button>
	</form>
	</div>
	</center>
</body>
</html>