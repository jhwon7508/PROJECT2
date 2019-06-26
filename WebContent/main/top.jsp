<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ShoesMall by SHOEAHOLIC</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../css/main.css" />
</head>
<body>
<div style="position: relative; top: -60px; height: 300px; background-color: black;">
	<!-- Footer -->
	<footer id="footer">
	<div class="copyright">
	


		<%
			String id = (String) session.getAttribute("id");
			if (id == null || id.equals("")) { //세션 없을 경우
		%>


		<button class="button special" type="button"
			onclick="location.href='../member/memberLogin.jsp'">로그인</button>
		<button class="button" type="button"
			onclick="location.href='../member/memberJoin.jsp'">회원가입</button>

		<%
			} else if (id.equals("root")) {//세션이 관리자인 경우
				out.print(id + ": 관리자님 환영합니다.<br>");
		%>

		<button class="button" type="button"
			onclick="location.href='../member/memberMyPage.jsp'">마이페이지</button>
		<button class="button" type="button"
			onclick="location.href='../member/memberLogout.jsp'">로그아웃</button>

		<%
			} else { //세션 일반 회원인 경우
				out.print(id + " 님 환영합니다.<br>");
		%>
		<button class="button" type="button"
			onclick="location.href='../member/memberMyPage.jsp'">마이페이지</button>
		<button class="button special" type="button"
			onclick="location.href='../cart/cartList.jsp'">장바구니</button>
		<button class="button" type="button"
			onclick="location.href='../member/memberLogout.jsp'">로그아웃</button>
		<%
			}
		%>
	</div>

	</footer>
</div>
	<!-- Header -->
	<header id="header" class="alt">
	<div class="logo">
		<a href="../main/index.jsp">ShoesMall <span>by SHOEAHOLIC</span></a>
	</div>
	<a href="#menu">Menu</a> </header>

	<!-- Nav -->
	<nav id="menu">
	<ul class="links">
		<li><a href="../product/productList.jsp?proSort=menShoes">남성
				구두</a></li>
		<li><a href="../product/productList.jsp?proSort=menSneakers">남성
				운동화</a></li>
		<li><a href="../product/productList.jsp?proSort=menSeason">남성
				계절화</a></li>
		<li><a href="../product/productList.jsp?proSort=womenShoes">여성
				구두</a></li>
		<li><a href="../product/productList.jsp?proSort=womenSneakers">여성
				운동화</a></li>
		<li><a href="../product/productList.jsp?proSort=womenSeason">여성
				계절화</a></li>
	</ul>
	</nav>
	

	<!-- Scripts -->
	 <script src="../js/jquery.min.js"></script>
	<script src="../js/jquery.scrollex.min.js"></script>
	<script src="../js/skel.min.js"></script>
	<script src="../js/util.js"></script>
	<script src="../js/main.js"></script> 

</body>
</html>