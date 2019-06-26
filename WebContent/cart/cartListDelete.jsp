<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>

<%
	String pid = request.getParameter("cart");
	int pNum = Integer.parseInt(pid);

	ArrayList basket1 = (ArrayList) session.getAttribute("basketList1"); 
	
	basket1.remove(pNum); //ArrayList에서 해당 세션 삭제
	
	
	

%>
 <script type="text/javascript">
	location.href="cartList.jsp";
</script> 
</body>
</html>