<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#pv{
width: 600px;
}
#ban{
		background-color: #8a4680;
		color: #e2d1df;
		padding: 8em 0;
		position: relative;
}
</style>
<style type="text/css">
#img2 {
display: none;
width: 480px;
height: 360px;
}
#img1 {
width: 480px;
height: 360px;
}
#imgBtn1:hover{
	opacity: 0.5;
}
#imgBtn2:hover{
	opacity: 0.5;
	
}
#imgBtn1 {
	position:relative;
	width: 50px; 
	height: 50px;
	top:-300px;
	left:-10px;
}

#imgBtn2 {
	position:relative;
	width:50px; 
	height: 50px;
	top:-290px;
	left:-10px;
}
</style>
<script type="text/javascript">
	function basket() { //로그인 안 되어있을 경우
		var mId = document.getElementById("mId").value;
		if (mId == "null" || mId == "") {
			alert("상품을 구매하려면 로그인을 하세요.");
			location.href = "../member/memberLogin.jsp";
		} else {
			document.myForm.action = "../cart/process.jsp";
			document.myForm.submit();
		}
	}
	function basketMove() {//로그인 안 되어있을 경우
		var mId = document.getElementById("mId").value;
		if (mId == "null" || mId == "") {
			alert("장바구니를 보시려면 로그인을 하세요");
			location.href = "../member/memberLogin.jsp";
		} else {
			location.href = "../cart/cartList.jsp";
		}
	}
	function img1() { //이미지1 마우스 올리면 보이고 이미지2 안보임
		var img1 = document.getElementById("img1");
		var img2 = document.getElementById("img2");
		img2.style.display="none";
		img1.style.display="block";
		
	}
	function img2() {//이미지2 마우스 올리면 보이고 이미지1 안보임
		var img1 = document.getElementById("img1");
		var img2 = document.getElementById("img2");
		img1.style.display="none";
		img2.style.display="block";
	}

</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>

	<%
		String proId = request.getParameter("proId");
		int proIdNum = Integer.parseInt(proId);

		ProductDAO dao = new ProductDAO();

		ProductDTO dto = dao.proSelect(proIdNum);
	%>
	
	<%@ include file="../main/top.jsp"%>

	<center>
		<form name="myForm">
			<input type="hidden" name="proId" value="<%=dto.getProId()%>">
			<input type="hidden" id="mId" value="<%=id%>">

			<table id="pv">
				<tr>
					<td colspan="2" width="400px;">
						<div id="img1"><img alt="shoes" src="<%=dto.getProImg()%>"></div>
						<div id="img2"><img alt="shoes" src="<%=dto.getProImg2()%>"></div>
					</td>
					<td>
						<img id="imgBtn1" onmouseover="img1()" src="<%=dto.getProImg()%>">
						<img id="imgBtn2" onmouseover="img2()" src="<%=dto.getProImg2()%>">
					</td>
				</tr>
				<tr>
					<th>상품ID</th>
					<td><%=dto.getProId()%></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><%=dto.getProName()%></td>
				</tr>
				<tr>
					<th>상품종류</th>
					<td><%=dto.getProSort()%></td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td><%=dto.getProPrice() + ",000"%></td>
				</tr>
				<tr>
					<th>상품설명</th>
					<td><%=dto.getProExp()%></td>
				</tr>
				<tr>
					<th>수량</th>
					<td><select name="orderCount">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td><select name="orderSize">
							<option value="230">230</option>
							<option value="240">240</option>
							<option value="250">250</option>
							<option value="260">260</option>
							<option value="270">270</option>
							<option value="280">280</option>
							<option value="290">290</option>
							<option value="300">300</option>
					</select></td>
				</tr>
			</table>
			<br>


			<button type="button" class="button alt icon fa-download" onclick="basket()">장바구니에 넣기</button>

			<button type="button" class="button alt" onclick="basketMove()">장바구니로 이동</button>
			
		</form>
		<br><br>
		<%
			if (id == null) {

			} else {//로그인 하면 게시판 보여줌
		%>
		<%@ include file="../bbs/bbsList.jsp"%>
		<%
			}
		%>
		
		<br><br><br><br>

		<%@ include file="../main/bottom.jsp"%>

	</center>


</body>
</html>