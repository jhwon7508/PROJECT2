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
	<jsp:useBean id="dto" class="member.MemberDTO">
		<jsp:setProperty name="dto" property="*" />
	</jsp:useBean>
	<%
		request.setCharacterEncoding("UTF-8");
		MemberDAO dao = new MemberDAO();

		if (dao.memLogin(dto)) { //로그인 성공
			session.setAttribute("id", dto.getMemId());
	%>
	<script type="text/javascript">
		alert("로그인 성공!");
		location.href = "../main/index.jsp";
	</script>

	<%
		} else if (dto.getMemId()==null || dto.getMemPw()==null) { //아이디 비밀번호 공백일 경우
	%>

	<script type="text/javascript">
		alert("아이디나 비밀번호를 확인하세요!");
		location.href = "memberLogin.jsp";
	</script>
	<%
		} else { //로그인 실패
	%>
	<script type="text/javascript">
		alert("아이디나 비밀번호를 확인하세요!");
		location.href = "memberLogin.jsp";
	</script>
	<%
		}
	%>
</body>
</html>