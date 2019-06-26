<%@page import="shoes.OrderView"%>
<%@page import="orderT.OrderTDTO"%>
<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="orderT.OrderTDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<%@ include file="../main/top.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	String orderId = request.getParameter("orderId");
	
	OrderTDAO dao = new OrderTDAO();
	ArrayList list = new ArrayList();
	
	int sum = 0; //합계
	
	list = dao.ordViewSelect(orderId); //주문번호로 데이터 검색

	for(int i=0;i<list.size();i++) {
		OrderView view = (OrderView)list.get(i);
		
		%>
		<table>
		<tr>
			<td rowspan="5"><img width="100" height="100" src="<%=view.getProImg() %>"></td>
			<th width="500" colspan="2">정보</th>
			<th width="100">수량</th>
			<th width="100">상품 가격</th>
		</tr>
		<tr>
			<td>상품이름</td><td><%=view.getProName() %></td>
			
		</tr>
		<tr>
			<td>상품설명</td>
			<td><%=view.getProExp() %></td>
			<td rowspan="4"><%=view.getOrderCount() %></td>
			<td rowspan="4"><%=view.getProPrice() %>,000</td>
		</tr>
		<tr>
			<td>상품 사이즈</td>
			<td><%=view.getOrderSize() %></td>
		</tr>
	</table>
	
	<%	
	sum = sum + view.getOrderCount()*view.getProPrice();//합계
	}

%>
<table border="1" id="total">
		<tr>
			<td>합계</td>
			<td><input readonly="readonly" type="text" name="total"
				value="<%=sum%>,000"></td>
		</tr>
	</table>
	<br><br><br><br><br><br>

<%@ include file="../main/bottom.jsp"%>
</center>
</body>
</html>