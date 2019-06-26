<%@page import="shoes.ShoesCart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="sCart" class="shoes.ShoesCart">
	<jsp:setProperty name="sCart" property="*" />
</jsp:useBean>
<%
ArrayList<ShoesCart> basket1 = (ArrayList<ShoesCart>)session.getAttribute("basketList1");
 if(basket1 == null ) {
	 basket1 = new ArrayList();
	 
}
 basket1.add(sCart); //세션 클래스 넣음
 session.setAttribute("basketList1", basket1);//세션 생성

%>
<script type="text/javascript">
	alert("장바구니에 넣었습니다.");
	history.go(-1); 

</script>

	
</body>
</html>