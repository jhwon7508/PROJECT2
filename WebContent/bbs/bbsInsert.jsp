<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ShoesMall by SHOEAHOLIC</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../css/main.css" />
<style>
#table{
width: 1200px;
}
</style>
</head>
<body><!-- 게시글 입력 -->
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		String proId = request.getParameter("proId");	//제품 번호 받아옴
		String memId = (String) session.getAttribute("id"); //아이디 세션 받아옴
		Date date = new Date(System.currentTimeMillis());	//날짜 클래스
		String now = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date); //오늘 날짜
	%>
	<form name="myForm" action="bbsInsertOK.jsp">
	<br><br><br><br>
	<center>
		<table id="table">
			<tr>
				<td>제품 아이디</td>
				<td><input type="text" name="bbsProId" value="<%=proId%>"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="bbsName" value="<%=memId%>"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><input type="text" name="bbsDate" value="<%=now%>"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="bbsContent"></td>
			</tr>
		</table>
		<input type="submit" value="글쓰기" class="button special">
		</center>	
	</form>
</body>
</html>