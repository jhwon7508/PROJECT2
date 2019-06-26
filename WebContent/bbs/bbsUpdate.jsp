<%@page import="bbs.BbsDTO"%>
<%@page import="bbs.BbsDAO"%>
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
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String bbsNum = request.getParameter("bbsNum");
	int bbsN = Integer.parseInt(bbsNum);
	
	BbsDAO dao = new BbsDAO();
	BbsDTO dto = dao.select(bbsN); //게시글에 맞는 데이터 가져옴
%>

<form name="myForm" action="bbsUpdateOK.jsp">
<input type="hidden" name="bbsNum" value="<%=bbsN%>">
<center>
	<br><br><br><br>
<table id="table">
	<tr>
		<td>제품 아이디</td><td><input type="text" name="bbsProId" value="<%=dto.getBbsProId()%>" readonly="readonly"></td>
	</tr>
	<tr>
		<td>작성자</td><td><input type="text" name="bbsName" value="<%=dto.getBbsName()%>" readonly="readonly"></td>
	</tr>
	<tr>
		<td>작성일</td><td><input type="text" name="bbsDate" value="<%=dto.getBbsDate()%>" readonly="readonly"></td>
	</tr>
	<tr>
		<td>내용</td><td><input type="text" name="bbsContent"></td>
	</tr>
</table>
		<input type="submit" value="수정" class="button special">
</center>
</form>
</body>
</html>