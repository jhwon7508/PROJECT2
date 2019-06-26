<%@page import="bbs.BbsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
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
</style>
</head>
<body>

	<center>
<% request.setCharacterEncoding("UTF-8"); %>
<%!	// 페이지 번호 정수형으로 변환
	public Integer toInt(String x) {
		int a = 0;
		try { a = Integer.parseInt(x); } 
		catch (Exception e) { }
		return a;
	}
%>
<h2>상품평</h2>
<table border="1">
	<tr>
		<td>제품아이디</td>
		<td>작성자</td>
		<td>작성일자</td>
		<td width="700">내용</td>
		<td width="200"></td>
	</tr>
<%
	String proId1 = request.getParameter("proId");	//제품 번호 받아옴
	String memId1 = (String) session.getAttribute("id"); //아이디 세션 받아옴
	int proIdNum1 = Integer.parseInt(proId1);	// 제품번호 정수형으로 변경
	ArrayList list1 = new ArrayList();
	BbsDAO dao1 = new BbsDAO();

	ArrayList reqlist = (ArrayList) request.getAttribute("list");

	int pageno = toInt(request.getParameter("pageno"));//현재 페이지
	if (pageno < 1) { //페이지 번호가 1보다 작으면 1부터 시작
		pageno = 1;
	}
	int total_record = dao1.bbsPageList(proIdNum1); //총 레코드 수
	int page_per_record_cnt = 10; //페이지 당 레코드 수
	int group_per_page_cnt = 5; //페이지 당 보여줄 번호 수

	int record_start_no = (pageno - 1) * page_per_record_cnt;//시작 번호 (DB에 들어갈 숫자)
//		시작 번호 = ( 현재 페이지 번호 - 1) * 페이지 당 레코드 수
	int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt > 0 ? 1 : 0); 
	// 총 페이지 수	 = 총 레코드 수 / 페이지 당 레코드 수 + (총 레코드 수 % 페이지 당 레코드 수 > 0 ? 1 : 0)
											//  나머지가 0보다 크면 1 아니면 0
	if (pageno > total_page) { // 현재 페이지가 총 페이지 수 보다 크면
		pageno = total_page;	//현재 페이지에 총 페이지 수 삽입
	}

	int group_no = pageno / group_per_page_cnt + (pageno % group_per_page_cnt > 0 ? 1 : 0);
	//					현재 그룹번호 = 현재페이지 / 페이지당 보여줄 번호수 (현재 페이지 % 페이지당 보여줄 번호 수 >0 ? 1:0)	
	//				ex) 	14		=	13(몫)		=	 (66 / 5)		1	(1(나머지) = 66 % 5)			  

	int page_eno = group_no * group_per_page_cnt;
	//					현재 그룹 끝 번호 = 현재 그룹번호 * 페이지당 보여줄 번호 
	//				ex) 	70		=	14	*	5
	int page_sno = page_eno - (group_per_page_cnt - 1);
	//			 		현재 그룹 시작 번호 = 현재 그룹 끝 번호 - (페이지당 보여줄 번호 수 -1)
	//				ex) 	66	=	70 - 	4 (5 -1)

	if (page_eno > total_page) {
	//				   현재 그룹 끝 번호가 전체페이지 수 보다 클 경우		
	page_eno = total_page;
	//				   현재 그룹 끝 번호와 = 전체페이지 수를 같게
	}

	int prev_pageno = pageno - 1; // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>
	//					이전 페이지 번호	= 현재 그룹 시작 번호 - 페이지당 보여줄 번호수	
	//				ex)		46		=	51 - 5				
	int next_pageno = pageno + 1; // <<  [이전] [21],[22],[23]... [30] *[다음]*  >>
	//					다음 페이지 번호 = 현재 그룹 시작 번호 + 페이지당 보여줄 번호수
	//				ex)		56		=	51 - 5
	if (prev_pageno < 1) {
	//					이전 페이지 번호가 1보다 작을 경우		
		prev_pageno = 1;
					//					이전 페이지를 1로
	}
	if (next_pageno > total_page) {
		next_pageno = total_page;
	//					다음 페이지보다 전체페이지 수보가 클경우		
	//					next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
	//					next_pageno=total_page
	//					다음 페이지 = 전체페이지수 / 페이지당 보여줄 번호수 * 페이지당 보여줄 번호수 + 1 
	//				ex)			   = 	76 / 5 * 5 + 1	???????? 		
	}

	if (reqlist == null) { //
		list1 = dao1.selectAll(proIdNum1, record_start_no, page_per_record_cnt);
	} else {
		list1 = reqlist;
	}

	if(total_record!=0){ // 총 레코드 수가 0이 아니면
		for (int i = 0; i < list1.size(); i++) {
			BbsDTO dto1 = (BbsDTO) list1.get(i);
			if (memId1.equals(dto1.getBbsName())) { //세션 아이디가 일반 회원일 경우
													//개인이 작성한 게시글만 수정, 삭제 가능
%>
	<tr>
		<td><%=proId1%>
			<input type="hidden" id="bbsNu" value="<%=dto1.getBbsNum()%>">
			<input type="hidden" id="bbspr" value="<%=proId1%>">
		</td>
		<td><%=dto1.getBbsName()%></td>
		<td><%=dto1.getBbsDate()%></td>
		<td><%=dto1.getBbsContent()%></td>
		<td><button type="button" onclick="location.href='../bbs/bbsUpdate.jsp?bbsNum=<%=dto1.getBbsNum()%>'">수정</button>
			<button type="button" class="button special" onclick="bbsDelete()">삭제</button></td>
	</tr>
			
<%
			} else if (memId1.equals("root")) { //세션 아이디가 관리자일 경우 모두 수정 삭제 가능
%>
	<tr>
		<td><%=proId1%>
			<input type="hidden" id="bbsNu" value="<%=dto1.getBbsNum()%>">
			<input type="hidden" id="bbspr" value="<%=proId1%>">
		</td>
		<td><%=dto1.getBbsName()%></td>
		<td><%=dto1.getBbsDate()%></td>
		<td width="500"><%=dto1.getBbsContent()%></td>
		<td><button type="button" onclick="location.href='../bbs/bbsUpdate.jsp?bbsNum=<%=dto1.getBbsNum()%>'">수정</button>
			<button type="button" class="button special" onclick="bbsDelete()">삭제</button></td>
	</tr>
			

<%
			} else { // 게시글 이 남이 작성한 경우 수정, 삭제 불가
%>
	<tr>
		<td><%=dto1.getBbsProId()%></td>
		<td><%=dto1.getBbsName()%></td>
		<td><%=dto1.getBbsDate()%></td>
		<td><%=dto1.getBbsContent()%></td>
	</tr>
				
<%
			}
		}
			
%>
<!-- 페이지 번호 -->
	<tr>
		<td colspan="5" align="center">
			<a class="page" href="productView.jsp?proId=<%=proIdNum1%>&pageno=1"><<</a> 
			<a class="page" href="productView.jsp?proId=<%=proIdNum1%>&pageno=<%=prev_pageno%>"><</a>
<%
		for (int j = page_sno; j <= page_eno; j++) {
		%> <a class="page" href="productView.jsp?proId=<%=proIdNum1%>&pageno=<%=j%>"> <%
			if (pageno == j) {
		%> <font class="pagefont1"><%=j%></font> <%
			} else if(pageno != j) {
		%> <font class="pagefont2"><%=j%></font> <%
			} 
		 %> </a> <%
 		}
		%>  <a class="page" href="productView.jsp?proId=<%=proIdNum1%>&pageno=<%=next_pageno%>">></a>
			<a class="page" href="productView.jsp?proId=<%=proIdNum1%>&pageno=<%=total_page%>">>></a>
		</td>
	</tr>
<%
	} else {// 총 레코드 수가 0이면 글이 없다고 표시
%>
	<tr>
		<td colspan="5" align="center">글이 없습니다.</td>
	</tr>	
<%
	} 
%>
</table>
<script type="text/javascript">
var bbsnum = document.getElementById("bbsNu").value;

function bbsDelete() {//글쓰기 삭제 버튼
	var ok = confirm("삭제하시겠습니까?");
	if (ok == true) {
		location.href = "../bbs/bbsDelete.jsp?bbsNum=" + bbsnum;
	}
}
 function bbsWrite() {//글쓰기 버튼
location.href="../bbs/bbsInsert.jsp?proId="+<%=proId1%>;
} 
</script>
<button type="button" class="button special" onclick="bbsWrite()">글쓰기</button><br><br>
</center>
</body>
</html>