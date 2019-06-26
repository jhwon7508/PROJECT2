<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	 function proInsert() { //공백 확인
		var proName = document.getElementById("proName").value;
		var proPrice = document.getElementById("proPrice").value;
		var proExp = document.getElementById("proExp").value;
		var proImg = document.getElementById("proImg").value;
		var proImg2 = document.getElementById("proImg2").value;
		
		if(proName == "" || proName == null){
			alert("상품이름을 입력하세요.");
			proName.foucs();
		} else if(proPrice == "" || proPrice == null) {
			alert("상품가격을 입력하세요.");
			proPrice.foucs();
		} else if(proExp == "" || proExp == null) {
			alert("상품가격을 입력하세요.");
			proExp.foucs();
		} else if(proImg == "" || proImg == null) {
			alert("상품가격을 입력하세요.");
			proImg.foucs();
		} else if(proImg2 == "" || proImg2 == null) {
			alert("상품가격을 입력하세요.");
			proImg.foucs();
		} 
		
			document.myForm.action="productInsertOK.jsp";
			document.myForm.submit();
	} 
	
	function proList() {
		
		location.href="productList.jsp";
	}
</script>
</head>
<body>
<form name="myForm"  method="post">
	<table border="1">
		<tr>
			<td>상품명</td>
			<td><input type="text" name="proName" id="proName"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="proPrice" id="proPrice"></td>
		</tr>
		<tr>
			<td>상품설명</td>
			<td><input type="text" name="proExp" id="proExp"></td>
		</tr>
		<tr>
			<td>상품이미지</td>
			<td><input type="file" name="proImg" id="proImg"></td>
		</tr>
		<tr>
			<td>상품이미지</td>
			<td><input type="file" name="proImg2" id="proImg2"></td>
		</tr>
		<tr>
			<td>상품종류</td>
			<td>
				<select name="proSort">
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
				<button type="button" onclick="proInsert()">등록</button>
				<button type="button" onclick="proList()">목록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>