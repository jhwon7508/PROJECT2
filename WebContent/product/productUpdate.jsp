<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function proUpdate() {
		var sort = document.getElementById("proSort").value;
		var img = document.getElementById("proImg").value;
		var img2 = document.getElementById("proImg2").value;

		if (sort == null || sort == "") {
			alert("종류를 선택하세요.");
		} else if(img == null || img == ""){
			alert("사진을 선택하세요.");
		} else if(img2 == null || img2 == ""){
			alert("사진을 선택하세요.");
		} else {
			document.myForm.action = "productUpdateOK.jsp";
			document.myForm.submit();
		}
	}
		
	function proList() {
		location.href = "productList.jsp";
	}
	
</script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String id = request.getParameter("proId");

	int idNum = Integer.parseInt(id);

	ProductDAO dao = new ProductDAO();
	ProductDTO dto = dao.proSelect(idNum);
%>
	<form name="myForm" method="post">
		<input type="hidden" name="proId" value="<%=dto.getProId()%>">
		<table border="1">
			<tr>
				<td>상품명</td>
				<td><input type="text" name="proName" id="proName"
					value="<%=dto.getProName()%>"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="proPrice" id="proPrice"
					value="<%=dto.getProPrice()%>"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><input type="text" name="proExp" id="proExp"
					value="<%=dto.getProExp()%>"></td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td><input type="file" name="proImg" id="proImg" >
				</td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td><input type="file" name="proImg2" id="proImg2" >
				</td>
			</tr>
			<tr>
				<td>상품종류</td>
				<td><select name="proSort" id="proSort">
						<option value="">선택</option>
						<option value="menShoes">남성 구두</option>
						<option value="menSneakers">남성 운동화</option>
						<option value="menSeason">남성 계절화</option>
						<option value="womenShoes">여성 구두</option>
						<option value="womenSneakers">여성 운동화</option>
						<option value="womenSeason">여성 계절화</option>
				</select> 
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" onclick="proUpdate()">수정</button>
					<button type="button" onclick="proList()">목록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>