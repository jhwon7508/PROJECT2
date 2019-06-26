<%@page import="product.ProductDAO"%>
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

String proId = request.getParameter("proId");
int proIdNum = Integer.parseInt(proId);

ProductDAO dao = new ProductDAO();

dao.proDelete(proIdNum);
%>
<script type="text/javascript">
	alert("삭제완료!!");
	location.href="productAdminList.jsp";

</script>
</body>
</html>