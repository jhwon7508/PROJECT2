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
.b1{
	color: gray;
	font-size: 30px;
}

.b2{
	color:gray;
	font-size: 20px;
}
button {
	color: white;
	width: 100px;
	height: 30px;
	background: gray;
	border-radius: 5px 5px 5px 5px;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("id");
	
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		dto = dao.memSelect(id);
	%>
	
	<script type="text/javascript">
		function nullCheck() { //비밀번호 체크
			var pw = document.getElementById("memPw").value;
			if(pw == "" || pw == null) {
				alert("비밀번호를 입력하세요.");
			} else if(pw != "<%=dto.getMemPw()%>"){
				alert("비밀번호가 틀립니다.");
			} else {
				document.myForm.submit();
			}
		}
		
		function cancel() {//취소 버튼
			history.back();
		}
	</script>
	<center>
	<br><br><br><br>
	<b class="b1">회원탈퇴하시겠습니까?</b><br> <br>
	<b class="b2">비밀번호를 입력해주세요.</b><br><br>
	<form action="memberLeaveOK.jsp" method="post" name="myForm">
		<input type="hidden" name="memId" value="<%=id%>"> 
		<input type="password" name="memPw" id="memPw"><br> <br>
		<button type="button" onclick="nullCheck()">탈   퇴</button>
		<button type="button"  onclick="cancel()">취   소</button>
	</form>
	</center>
</body>
</html>