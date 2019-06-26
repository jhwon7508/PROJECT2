<%@page import="java.text.SimpleDateFormat"%>
<%@page import="shoes.ShoesCart"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="com.sun.tracing.dtrace.ArgsAttributes"%>
<%@page import="com.sun.glass.ui.Size"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#table1 {
	padding: 5px 5px 5px 5px;
	width: 1200px;
	
}

</style>
<title>장바구니</title>
<script type="text/javascript">
	function paid() {//결제 버튼 누를 경우
		var paid = confirm("결제하시겠습니까?");

		if (paid == true) {
			document.paidForm.action="paid.jsp";
			document.paidForm.submit();
		}
	}
	function cartDelete() {//삭제 버튼 누를 경우
		var ok = confirm("삭제하시겠습니까?");
		var num = document.getElementById("num").value;
		if (ok == true) {
			location.href = "cartListDelete.jsp?cart=" + num;
		}
	}
</script>

</head>
<body>
<center>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<br><br>
	<%@ include file="../main/top.jsp"%>

		<%
		
			Date date = new Date(System.currentTimeMillis());
			String now = new SimpleDateFormat("yyyyMMddhhmmss").format(date); //현재 시간 (주문번호 삽입을 위해서)
			String now1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date); //현재 시간
			int sum = 0;	//합계
			int count1 = 0; //수량
			String oid = (String)session.getAttribute("id");//회원 아이디 세션
			ArrayList basket1 = (ArrayList) session.getAttribute("basketList1");
			String orderid = now+oid; //주문 번호(주문날짜+회원아이디)

			if (basket1 == null) { //장바구니 세션 비어있을 경우
		%>
		<br><br>
		<h1>장바구니가 비었습니다</h1>
		<br><br>
		<%
			} else { //장바구니 세션 있을 경우

				for (int i = 0; i < basket1.size(); i++) {
					ShoesCart cart = (ShoesCart) basket1.get(i);
					int proNum = Integer.parseInt(cart.getProId());
					ProductDAO dao = new ProductDAO();
					ProductDTO dto = dao.proSelect(proNum);
		%>
		<input type="hidden" id="num" value="<%=i%>"> <!-- ArrayList에서 Index값 -->
		<br><br>	
		<table id="table1">
			<tr>
				<td width="300" ></td>
				<td width="500" colspan="2" align="center">정보</td>
				<td width="100">수량</td>
				<td width="100">가격</td>
				<td width="100"></td>
			</tr>
			<tr>

				<td rowspan=5" width="300" height="300">
				<a href="../product/productView.jsp?proId=<%=dto.getProId()%>">
				<img src="<%=dto.getProImg()%>" height="200" width="200"></a></td>

				<td width="200">상품 ID</td>
				<td><%=dto.getProId()%></td>

				<td rowspan="4" align="center"><%=cart.getOrderCount()%></td>
				<td rowspan="4" align="center"><%=dto.getProPrice() + ",000"%></td>
				<td rowspan="5" align="center" width="50"><button type="button" onclick="cartDelete()">삭제</button></td>
			</tr>
			<tr>
				<td width="200">상품 이름</td>
				<td><%=dto.getProName()%></td>
			</tr>
			<tr>
				<td width="200">상품 설명</td>
				<td><%=dto.getProExp()%></td>
			</tr>
			<tr>
				<td width="200">상품 사이즈</td>
				<td rowspan="4"><%=cart.getOrderSize()%></td>
			</tr>


		</table>
			<%
				int count = Integer.parseInt(cart.getOrderCount()); // 수량 정수형으로 변환
						sum = sum + (dto.getProPrice() * count);   // 합계 
						count1 = i;
					}
				}
			%>


	<table border="1" id="table1">
		<tr>
			<td>합계</td>
			<td><input readonly="readonly" type="text" name="total"
				value="<%=sum%>,000"></td>
		</tr>
	</table>
	<form name="paidForm">
	<input type="hidden" name="orderId" value="<%=orderid%>"> <!-- 주문 번호 -->
	<input type="hidden" name="orderDate" value="<%=now1%>"> <!-- 주문 날짜 -->
	<input type="hidden" name="count" value="<%=count1%>"> <!-- 주문한 갯수 -->
	<button type="button" class="alt icon fa-check" onclick="paid()">결제하기</button>
	</form>
</center>
</body>
</html>