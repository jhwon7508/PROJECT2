<%@page import="orderT.OrderTDAO"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="shoes.ShoesCart"%>
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
	<%
		request.setCharacterEncoding("UTF-8");
	%>

	<%
		OrderTDAO orderdao = new OrderTDAO();
		String orderId = request.getParameter("orderId"); //주문 번호
		String orderDate = request.getParameter("orderDate"); //주문 날짜
		String count = request.getParameter("count"); // 주문 갯수
		String id = (String) session.getAttribute("id"); //세션 아이디
		ShoesCart cart = null;
		ArrayList basket1 = (ArrayList) session.getAttribute("basketList1");

		if (basket1 == null) { //주문세션 없을 경우
	%>
	<script type="text/javascript">
		alert("결제할 제품이 없습니다.");
		location.href = "../main/index.jsp";
	</script>
	<%
		} else { //주문 세션 있을 경우
			for (int i = 0; i < basket1.size(); i++) {
				cart = (ShoesCart) basket1.get(i);

				int proNum = Integer.parseInt(cart.getProId());
				int proCount = Integer.parseInt(cart.getOrderCount());
				

				orderdao.ordInsert(orderId, id, proNum, proCount, cart.getOrderSize(), orderDate);
				//주문번호, 회원 아이디, 제품 번호, 제품 갯수, 제품 사이즈, 주문 날짜

			}
			basket1.removeAll(basket1); //삽입하고 전체 지움
		}
	%>
<script type="text/javascript">
	alert("결제완료");
	location.href="cartList.jsp";
</script> 
</body>
</html>