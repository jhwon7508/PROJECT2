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

	<% request.setCharacterEncoding("UTF-8"); %>
	
	<%@ include file="../main/top.jsp"%>
	<div style="position: relative; top:-150px; background-color: black;">
	<!-- Banner -->
	<section class="banner full"> <article> <img
		src="../images/background1.png" alt="" />
	<div class="inner">
		<header>
		<p>by SHOEAHOLIC</p>
		<h2>SHOESMALL</h2>
		</header>
	</div>
	</article> <article> <img src="../images/background2.png" alt="" />
	<div class="inner">
		<header>
		<p>by SHOEAHOLIC</p>
		<h2>SHOESMALL</h2>
		</header>
	</div>
	</article> <article> <img src="../images/background3.png" alt="" />
	<div class="inner">
		<header>
		<p>by SHOEAHOLIC</p>
		<h2>SHOESMALL</h2>
		</header>
	</div>
	</article> <article> <img src="../images/background4.png" alt="" />
	<div class="inner">
		<header>
		<p>by SHOEAHOLIC</p>
		<h2>SHOESMALL</h2>
		</header>	
	</div>
	</article> <article> <img src="../images/background.png" alt="" />
	<div class="inner">
		<header>
		<p>by SHOEAHOLIC</p>
		<h2>SHOESMALL</h2>
		</header>
	</div>
	</article></section>

	<!-- Three -->
	<section id="three" class="wrapper style2">
	<div class="inner">
		<header class="align-center">
		<p class="special">If the shoe fits buy it in every color</p>
		<h2>SHOEAHOLIC</h2>
		</header>
		<div class="gallery">
			<div>
				<div class="image fit">
					<a href="../product/productList.jsp?proSort=menShoes"><img
						src="../img/menShoes.jpg" alt="" /></a>
				</div>
			</div>
			<div>
				<div class="image fit">
					<a href="../product/productList.jsp?proSort=womenShoes"><img
						src="../img/womenShoes.jpg" alt="" /></a>
				</div>
			</div>
			<div>
				<div class="image fit">
					<a href="../product/productList.jsp?proSort=menSneakers"><img
						src="../img/menSneakers.jpg" alt="" /></a>
				</div>
			</div>
			<div>
				<div class="image fit">
					<a href="../product/productList.jsp?proSort=womenSneakers"><img
						src="../img/womenSneakers.jpg" alt="" /></a>
				</div>
			</div>
			<div>
				<div class="image fit">
					<a href="../product/productList.jsp?proSort=menSeason"><img
						src="../img/menSeason.jpg" alt="" /></a>
				</div>
			</div>
			<div>
				<div class="image fit">
					<a href="../product/productList.jsp?proSort=womenSeason"><img
						src="../img/womenSeason.jpg" alt="" /></a>
				</div>
			</div>
		</div>
	</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style3">
	<div class="inner">
		<header class="align-center">
		<p>good shoes take you good places</p>
		<h2>SHOEAHOLIC</h2>
		<br><br>
		<table>
			<tr>
				<td><iframe width="560" height="315"
						src="https://www.youtube.com/embed/9Ev3XrqDEH4" frameborder="0"
						allow="autoplay; encrypted-media" allowfullscreen></iframe></td>
				<td><iframe width="560" height="315"
						src="https://www.youtube.com/embed/Hn8GQOrcoIs" frameborder="0"
						allow="autoplay; encrypted-media" allowfullscreen></iframe></td>
			</tr>
		</table>
		</header>
	</div>
	</section>
</div>
	<!-- Footer -->
<%@ include file="../main/bottom.jsp"%>

</body>
</html>