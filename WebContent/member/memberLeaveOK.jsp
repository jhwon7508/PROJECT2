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

		if (dao.memLogin(dto)) {
			dao.memDelete(dto);
			session.invalidate(); //세션 지우기
	%>
	<script type="text/javascript">
		alert("탈퇴성공!!");
		location.href = "../main/index.jsp";
	</script>

	<%
		} else {
	%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다.");
		location.href = "memberLeave.jsp";
	</script>

	<%
		}
	%>

</body>
</html>