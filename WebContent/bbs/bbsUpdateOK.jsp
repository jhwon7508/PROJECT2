<%@page import="bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="bbs.BbsDTO">
	<jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<% 
	BbsDAO dao = new BbsDAO();
	dao.update(dto);
%>
<script type="text/javascript">
	alert("수정되었습니다.");
	location.href="../product/productView.jsp?proId=<%=dto.getBbsProId()%>";
</script>
</body>
</html>