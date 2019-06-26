<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#loginbutton {
	position: relative;
	bottom: 50px;
	color: white;
	background: gray;
	font-style: 바탕체;
	width: 100px;
	height: 50px;
}

#loginbutton:hover {
	background: blue;
}

.logintext {
	border: 1px solid gray;
}

#loginDiv {
	width: 700px;
	height: 450px;
	border: 1px solid gray;
}

#member {
	font-size: 20px;
	color: gray;
}

#member:hover {
	color: blue;
}

.loginspan {
	padding-right: 10px;
	text-align: right;
	font-weight: bold;
	font-size: 15px;
}

.loginla1 {
	position: relative;
	top: -10px;
}

.loginla1, .loginla2, .loginla3 {
	position: relative;
}

</style>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<center>
		<%@ include file="../main/top.jsp"%>
		<br> <br> 
		<form action="memberLoginOK.jsp" method="post">
			<div id="loginDiv">
				<br>
				<h1>LOGIN</h1>
				<hr>
				<br>
				<label class="loginla1"> 
				<span class="loginspan">아이디</span>
				<input class="logintext" type="text" name="memId">
				</label>
				<br>
				<label class="loginla2">
				<span class="loginspan">비밀번호</span>
				<input class="logintext" type="password" name="memPw">
				</label>
				<br><br> <br> <br> <label class="loginla3">
				<input id="loginbutton"	type="submit" value="로그인">
				</label>
				
				<br><br>
				<a href="memberJoin.jsp"><font id="member">회원가입</font></a>
				<br><br>
			</div>
		</form>
		
		<br> <br> 
		<br> <br> 
		<br> <br> 
		<br> <br> 
		<%@ include file="../main/bottom.jsp"%>
	</center>
</body>
</html>