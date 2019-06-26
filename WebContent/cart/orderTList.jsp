<%@page import="orderT.OrderTDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="orderT.OrderTDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.page {
	text-decoration: none;
	font-weight: bold;
	color: gray;
}

.page:hover {
	color: black;
	font-weight: bold;
}

.pagefont1 {
	color: orange;
	font-weight: bold;
}

.pagefont2 {
	color: skyblue;
	font-weight: bold;
}

.pagefont1:hover, .pagefont2:hover {
	color: gray;
}

#tb {
	width: 1200px;
}
</style>
</head>
<body>
	<center>
		<%@ include file="../main/top.jsp"%>
		<br>
		<br>
		<h2>주문 목록</h2>
		<table id="tb">
			<%!//페이 번호 정수형으로 변환
	public Integer toInt(String x) {
		int a = 0;
		try {
			a = Integer.parseInt(x);
		} catch (Exception e) {
		}
		return a;
	}%>
			<%
				request.setCharacterEncoding("UTF-8");

				ArrayList list = new ArrayList(); //일반회원 데이터 넣을 곳
				ArrayList list1 = new ArrayList(); //관리자용 데이터 넣을 곳
				OrderTDAO dao = new OrderTDAO();

				ArrayList reqlist = (ArrayList) request.getAttribute("list");//일반회원 데이터 넣을 곳
				ArrayList reqlist1 = (ArrayList) request.getAttribute("list1");//관리자용 데이터 넣을 곳

				int pageno = toInt(request.getParameter("pageno"));
				if (pageno < 1) {//현재 페이지
					pageno = 1;
				}
				int total_record = dao.ordPageList(id); //총 레코드 수
				int page_per_record_cnt = 10; //페이지 당 레코드 수
				int group_per_page_cnt = 5; //페이지 당 보여줄 번호 수

				int record_start_no = (pageno - 1) * page_per_record_cnt; //레코드 시작 번호

				int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt > 0 ? 1 : 0);
				if (pageno > total_page) {
					pageno = total_page;
				}

				// 	현재 페이지(정수) / 한페이지 당 보여줄 페지 번호 수(정수) + (그룹 번호는 현제 페이지(정수) % 한페이지 당 보여줄 페지 번호 수(정수)>0 ? 1 : 0)
				int group_no = pageno / group_per_page_cnt + (pageno % group_per_page_cnt > 0 ? 1 : 0);
				//		현재 그룹번호 = 현재페이지 / 페이지당 보여줄 번호수 (현재 페이지 % 페이지당 보여줄 번호 수 >0 ? 1:0)	
				//	ex) 	14		=	13(몫)		=	 (66 / 5)		1	(1(나머지) =66 % 5)			  

				int page_eno = group_no * group_per_page_cnt;
				//		현재 그룹 끝 번호 = 현재 그룹번호 * 페이지당 보여줄 번호 
				//	ex) 	70		=	14	*	5
				int page_sno = page_eno - (group_per_page_cnt - 1);
				// 		현재 그룹 시작 번호 = 현재 그룹 끝 번호 - (페이지당 보여줄 번호 수 -1)
				//	ex) 	66	=	70 - 	4 (5 -1)

				if (page_eno > total_page) {
					//	   현재 그룹 끝 번호가 전체페이지 수 보다 클 경우		
					page_eno = total_page;
					//	   현재 그룹 끝 번호와 = 전체페이지 수를 같게
				}

				int prev_pageno = pageno - 1; // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>
				//		이전 페이지 번호	= 현재 그룹 시작 번호 - 페이지당 보여줄 번호수	
				//	ex)		46		=	51 - 5				
				int next_pageno = pageno + 1; // <<  [이전] [21],[22],[23]... [30] *[다음]*  >>
				//		다음 페이지 번호 = 현재 그룹 시작 번호 + 페이지당 보여줄 번호수
				//	ex)		56		=	51 - 5
				if (prev_pageno < 1) {
					//		이전 페이지 번호가 1보다 작을 경우		
					prev_pageno = 1;
					//		이전 페이지를 1로
				}
				if (next_pageno > total_page) {
					next_pageno = total_page;
					//		다음 페이지보다 전체페이지 수보가 클경우		
					//		next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
					//		next_pageno=total_page
					//		다음 페이지 = 전체페이지수 / 페이지당 보여줄 번호수 * 페이지당 보여줄 번호수 + 1 
					//	ex)			   = 	76 / 5 * 5 + 1	???????? 		
				}

				if (reqlist == null) {
					list = dao.ordSelect(id, record_start_no, page_per_record_cnt);
					//					회원 아이디,시작 번호, 가져올 데이터 수
				} else {
					list = reqlist;
				}

				/* ------------------------------------root--------------------------------------------------- */
				int pageno1 = toInt(request.getParameter("pageno"));
				if (pageno1 < 1) {//현재 페이지
					pageno1 = 1;
				}
				int total_record1 = dao.ordPageListAll(); //총 레코드 수
				int page_per_record_cnt1 = 10; //페이지 당 레코드 수
				int group_per_page_cnt1 = 5; //페이지 당 보여줄 번호 수

				int record_start_no1 = (pageno1 - 1) * page_per_record_cnt1;

				int total_page1 = total_record1 / page_per_record_cnt1 + (total_record1 % page_per_record_cnt1 > 0 ? 1 : 0);
				if (pageno1 > total_page1) {
					pageno1 = total_page1;
				}

				// 	현재 페이지(정수) / 한페이지 당 보여줄 페지 번호 수(정수) + (그룹 번호는 현제 페이지(정수) % 한페이지 당 보여줄 페지 번호 수(정수)>0 ? 1 : 0)
				int group_no1 = pageno1 / group_per_page_cnt1 + (pageno1 % group_per_page_cnt1 > 0 ? 1 : 0);
				//		현재 그룹번호 = 현재페이지 / 페이지당 보여줄 번호수 (현재 페이지 % 페이지당 보여줄 번호 수 >0 ? 1:0)	
				//	ex) 	14		=	13(몫)		=	 (66 / 5)		1	(1(나머지) =66 % 5)			  

				int page_eno1 = group_no1 * group_per_page_cnt1;
				//		현재 그룹 끝 번호 = 현재 그룹번호 * 페이지당 보여줄 번호 
				//	ex) 	70		=	14	*	5
				int page_sno1 = page_eno1 - (group_per_page_cnt1 - 1);
				// 		현재 그룹 시작 번호 = 현재 그룹 끝 번호 - (페이지당 보여줄 번호 수 -1)
				//	ex) 	66	=	70 - 	4 (5 -1)

				if (page_eno1 > total_page1) {
					//	   현재 그룹 끝 번호가 전체페이지 수 보다 클 경우		
					page_eno1 = total_page1;
					//	   현재 그룹 끝 번호와 = 전체페이지 수를 같게
				}

				int prev_pageno1 = pageno1 - 1; // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>
				//		이전 페이지 번호	= 현재 그룹 시작 번호 - 페이지당 보여줄 번호수	
				//	ex)		46		=	51 - 5				
				int next_pageno1 = pageno1 + 1; // <<  [이전] [21],[22],[23]... [30] *[다음]*  >>
				//		다음 페이지 번호 = 현재 그룹 시작 번호 + 페이지당 보여줄 번호수
				//	ex)		56		=	51 - 5
				if (prev_pageno1 < 1) {
					//		이전 페이지 번호가 1보다 작을 경우		
					prev_pageno1 = 1;
					//		이전 페이지를 1로
				}
				if (next_pageno1 > total_page1) {
					next_pageno1 = total_page1;
					//		다음 페이지보다 전체페이지 수보가 클경우		
					//		next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
					//		next_pageno=total_page
					//		다음 페이지 = 전체페이지수 / 페이지당 보여줄 번호수 * 페이지당 보여줄 번호수 + 1 
					//	ex)			   = 	76 / 5 * 5 + 1	???????? 		
				}

				if (reqlist1 == null) {
					list1 = dao.ordSelectAll(record_start_no1, page_per_record_cnt1);
					//							시작 번호 , 가져올 데이터 갯수
				} else {
					list1 = reqlist1;
				}

				if (id.equals("root")) { // 관리자
			%>

			<tr>
				<th>회원 아이디</th>
				<th>주문 번호</th>
				<th>주문 날짜</th>
			</tr>
			<%
				if (total_record1 != 0) { //상품 레코드가 0이 아니면 페이지 번호 띄움
						for (int i = 0; i < list1.size(); i++) {
							OrderTDTO dto = (OrderTDTO) list1.get(i);
			%>

			<tr>
				<td><%=dto.getOrderMId()%></td>
				<td><a href="orderTView.jsp?orderId=<%=dto.getOrderId()%>"><%=dto.getOrderId()%></a></td>
				<td><%=dto.getOrderDate()%></td>
			</tr>

			<%
				}
			%>
			<tr>
				<td colspan="5" align="center"><a class="page" href="orderTList.jsp?pageno=1"><<</a>
					<a class="page" href="orderTList.jsp?pageno=<%=prev_pageno1%>"><</a>
					<%
						for (int i = page_sno1; i <= page_eno1; i++) {
					%> <a class="page" href="orderTList.jsp?pageno=<%=i%>"> <%
 	if (pageno1 == i) {
 %> <font class="pagefont1"><%=i%></font> <%
 	} else {
 %> <font class="pagefont2"><%=i%></font> <%
 	}
 %>
				</a> <%
 	}
 %> <a class="page" href="orderTList.jsp?pageno=<%=next_pageno1%>">></a>
					<a class="page" href="orderTList.jsp?pageno=<%=total_page1%>">>></a>
				</td>
			</tr>

			<%
				} else { //상품 레코드가 0이면 주문한 상품이 없다고 띄움
			%>
			<tr>
				<td colspan="3" align="center">주문한 상품이 없습니다.</td>
			</tr>

			<%
				}

				} else { //일반 회원
			%>
			<tr>
				<th>주문 번호</th>
				<th>주문 날짜</th>
			</tr>
			<%
				if (total_record != 0) {//상품 레코드가 0이 아니면 페이지 번호 띄움
						for (int i = 0; i < list.size(); i++) {
							OrderTDTO dto = (OrderTDTO) list.get(i);
			%>
			<tr>
				<td><a href="orderTView.jsp?orderId=<%=dto.getOrderId()%>"><%=dto.getOrderId()%></a></td>
				<td><%=dto.getOrderDate()%></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="5" align="center"><a class="page" href="orderTList.jsp?pageno=1"><<</a>
					<a class="page" href="orderTList.jsp?pageno=<%=prev_pageno%>"><</a>
					<%
						for (int i = page_sno; i <= page_eno; i++) {
					%> <a class="page" href="orderTList.jsp?pageno=<%=i%>"> <%
 	if (pageno == i) {
 %> <font class="pagefont1"><%=i%></font> <%
 	} else {
 %> <font class="pagefont2"><%=i%></font> <%
 	}
 %>
				</a> <%
 	}
 %> <a class="page" href="orderTList.jsp?pageno=<%=next_pageno%>">></a>
					<a class="page" href="orderTList.jsp?pageno=<%=total_page%>">>></a>
				</td>
			</tr>
			<%
				} else {//상품 레코드가 0이면 주문한 상품이 없다고 띄움
			%>
			<tr>
				<td colspan="2" align="center">주문한 상품이 없습니다.</td>
			</tr>
			<%
				}

				}
			%>

		</table>
		<br> <br> <br> <br> <br> <br>

		<%@ include file="../main/bottom.jsp"%>
	</center>
</body>
</html>