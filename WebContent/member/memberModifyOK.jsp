<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="dto" class="member.MemberDTO">
		<jsp:setProperty name="dto" property="*" />
	</jsp:useBean>
	
	<%
		MemberDAO dao = new MemberDAO();
		dao.memUpdate(dto);
	%>
	<script type="text/javascript">
		alert("수정완료!!");
		location.href = "memberMyPage.jsp";
	</script>
</body>
</html>