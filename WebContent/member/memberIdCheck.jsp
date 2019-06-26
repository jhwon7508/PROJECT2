<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function cancel() {//취소 버튼
		window.close();
	}
	
	function sendToParent() {// 회원가입 창으로 아이디 보내기
		var txt = document.getElementById("childText").value;
		opener.document.getElementById("c").value = txt;
		window.close();
	}
</script>
</head>
<body><!-- 아이디 중복 체크 -->

	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("memId");
		MemberDAO dao = new MemberDAO();
		boolean result = dao.memIdCheck(id);
		if (result) {//아이디 있을 경우
	%>
	<center>
		<br> <br>
		<h4>이미 사용중인 ID 입니다.</h4>
		<button type="button" onclick="cancel()">취소</button>
	</center>
	<%
		} else {//아이디 없을 경우
	%>
	<center>
		<br> <br>
		<h4>
			입력하신
			<%=id%>는<br> 사용하실 수 있는 ID 입니다.
		</h4>
		<input type="hidden" id="childText" value="<%=id%>">
		<button type="button" name="button" onclick="sendToParent();">사용하기</button>
		
	</center>
	<%
		}
	%>

</body>
</html>