<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.myPage {
	font-family: 'FontAwesome';
	src: url('../fonts/fontawesome-webfont.eot?v=4.6.3');
	src: url('../fonts/fontawesome-webfont.eot?#iefix&v=4.6.3')
		format('embedded-opentype'),
		url('../fonts/fontawesome-webfont.woff2?v=4.6.3') format('woff2'),
		url('../fonts/fontawesome-webfont.woff?v=4.6.3') format('woff'),
		url('../fonts/fontawesome-webfont.ttf?v=4.6.3') format('truetype'),
		url('../fonts/fontawesome-webfont.svg?v=4.6.3#fontawesomeregular')
		format('svg');
	font-weight: normal;
	font-style: normal width: 200px;
	height: 50px;
	width: 200px;
	border-radius: 5px 5px 5px 5px;
	background: gray;
	color: white;
}

#myPageDiv {
	border: 1px solid gray;
	height: 500px;
	width: 600px;
}
</style>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		String sessionId = (String) session.getAttribute("id");

		if (sessionId.equals("root")) { //관리자일 경우
	%>

	<%@ include file="../main/top.jsp"%>
	<center>
		<br> <br>
		<div id="myPageDiv">
			<br>
			<h1>MY PAGE</h1>
			<hr>
			<button class="myPage" type="button"
				onclick="location.href='memberModify.jsp'">회원정보수정</button>
			<br> <br>
			<button class="myPage" type="button"
				onclick="location.href='memberLeave.jsp'">회원탈퇴</button>
			<br> <br>
			<button class="myPage" type="button"
				onclick="location.href='../cart/orderTList.jsp'">주문 목록</button>
			<br> <br>
			<button class="myPage" type="button"
				onclick="location.href='../productadmin/productAdminList.jsp'">상품관리리스트</button>

		</div>
		<%@ include file="../main/bottom.jsp"%>
	</center>
	<%
		} else { //일반 회원인 경우
	%>
	<center>
		<%@ include file="../main/top.jsp"%>
		<br> <br>
		<div id="myPageDiv">
			<br> <br>
			<h1>MY PAGE</h1>
			<hr>
			<br>

			<button class="myPage" type="button"
				onclick="location.href='memberModify.jsp'">회원정보수정</button>
			<br> <br>
			<button class="myPage" type="button"
				onclick="location.href='memberLeave.jsp'">회원탈퇴</button>
			<br> <br>
			<button class="myPage" type="button"
				onclick="location.href='../cart/orderTList.jsp'">주문 목록</button>
			<br> <br>

		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br>
		<%@ include file="../main/bottom.jsp"%>
	</center>

	<%
		}
	%>
</body>
</html>