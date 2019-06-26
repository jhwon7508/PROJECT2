<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function updatePro() { //제품 정보 수정
		var id = document.getElementById("id").value;
		location.href = "productAdminUpdate.jsp?proId=" + id;
	}

	function deletePro() {//제품 삭제
		var id = document.getElementById("id").value;
		var dele = confirm("삭제하시겠습니까?");
		if (dele == true) {
			location.href = "productAdminDelete.jsp?proId=" + id;
		}
	}
</script>
<style type="text/css">
.page{
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
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%!
			public Integer toInt(String x){
				int a = 0;
				try{
					a = Integer.parseInt(x);
				}catch(Exception e){}
				return a;
			}
		%>
	리스트
	<input type="button" onclick="location.href='productAdminInsert.jsp'"
		value="상품등록">&nbsp&nbsp&nbsp
	<input type="button" onclick="location.href='../main/index.jsp'"
		value="메인으로">
	<table border="1">
		<tr>
			<td>상품 이미지</td>
			<td>상품 아이디</td>
			<td>상품 이름</td>
			<td>상품 가격</td>
			<td>상품 설명</td>
			<td>상품 종류</td>
		</tr>

		<%
			ArrayList list = new ArrayList();
			ProductDAO dao = new ProductDAO();
			
			ArrayList reqlist = (ArrayList) request.getAttribute("list");
		
			int pageno = toInt(request.getParameter("pageno"));
			if(pageno<1){//현재 페이지
				pageno = 1;
			}
			int total_record = dao.proPage();		   //총 레코드 수
			int page_per_record_cnt = 10;  //페이지 당 레코드 수
			int group_per_page_cnt =5;     //페이지 당 보여줄 번호 수

			int record_end_no = pageno*page_per_record_cnt;				
			int record_start_no = (pageno-1)*page_per_record_cnt;
			if(record_end_no>total_record){
				record_end_no = total_record;
			}
												   
												   
			int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt>0 ? 1 : 0);
			if(pageno>total_page){
				pageno = total_page;
			}

			

//		 	현재 페이지(정수) / 한페이지 당 보여줄 페지 번호 수(정수) + (그룹 번호는 현제 페이지(정수) % 한페이지 당 보여줄 페지 번호 수(정수)>0 ? 1 : 0)
			int group_no = pageno/group_per_page_cnt+( pageno%group_per_page_cnt>0 ? 1:0);
//				현재 그룹번호 = 현재페이지 / 페이지당 보여줄 번호수 (현재 페이지 % 페이지당 보여줄 번호 수 >0 ? 1:0)	
//			ex) 	14		=	13(몫)		=	 (66 / 5)		1	(1(나머지) =66 % 5)			  
			
			int page_eno = group_no*group_per_page_cnt;		
//				현재 그룹 끝 번호 = 현재 그룹번호 * 페이지당 보여줄 번호 
//			ex) 	70		=	14	*	5
			int page_sno = page_eno-(group_per_page_cnt-1);	
//		 		현재 그룹 시작 번호 = 현재 그룹 끝 번호 - (페이지당 보여줄 번호 수 -1)
//			ex) 	66	=	70 - 	4 (5 -1)
			
			if(page_eno>total_page){
//			   현재 그룹 끝 번호가 전체페이지 수 보다 클 경우		
				page_eno=total_page;
//			   현재 그룹 끝 번호와 = 전체페이지 수를 같게
			}
			
			int prev_pageno = pageno-1;  // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>
//				이전 페이지 번호	= 현재 그룹 시작 번호 - 페이지당 보여줄 번호수	
//			ex)		46		=	51 - 5				
			int next_pageno = pageno+1;	// <<  [이전] [21],[22],[23]... [30] *[다음]*  >>
//				다음 페이지 번호 = 현재 그룹 시작 번호 + 페이지당 보여줄 번호수
//			ex)		56		=	51 - 5
			if(prev_pageno<1){
//				이전 페이지 번호가 1보다 작을 경우		
				prev_pageno=1;
//				이전 페이지를 1로
			}
			if(next_pageno>total_page){
				next_pageno = total_page;
//				다음 페이지보다 전체페이지 수보가 클경우		
//				next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
//				next_pageno=total_page
//				다음 페이지 = 전체페이지수 / 페이지당 보여줄 번호수 * 페이지당 보여줄 번호수 + 1 
//			ex)			   = 	76 / 5 * 5 + 1	???????? 		
			}
			
			if (reqlist == null) {
				list = dao.proSelectAll(record_start_no, page_per_record_cnt);
			} else {
				list = reqlist;
			}
			
			//list = dao.proSelectAll();

			for (int i = 0; i < list.size(); i++) {
				ProductDTO dto = (ProductDTO) list.get(i);
		%>

		<tr>
			<td><img width="100px" height="100px"
				src="<%=dto.getProImg()%>"></td>
			<td><%=dto.getProId()%><input type="hidden" id="id"
				value="<%=dto.getProId()%>"></td>
			<td><%=dto.getProName()%></td>
			<td><%=dto.getProPrice()%></td>
			<td><%=dto.getProExp()%></td>
			<td><%=dto.getProSort()%></td>
			<td>
				<button type="button" onclick="updatePro()">수정</button>
				<button type="button" onclick="deletePro()">삭제</button>
			</td>
		</tr>

<%
			}
%>
		<tr>
  			<td colspan="7" align="center">
  				<a class="page" href="productAdminList.jsp?pageno=1"><<</a>
				<a class="page" href="productAdminList.jsp?pageno=<%=prev_pageno%>"><</a> 
				<%for(int i =page_sno;i<=page_eno;i++){%>
				<a class="page" href="productAdminList.jsp?pageno=<%=i %>">
				<%if(pageno == i){ %>
				<font class="pagefont1"><%=i %></font>
				<%}else{ %>
				<font class="pagefont2"><%=i %></font>
				<%} %>
				</a> 
				<%} %>
 
				<a class="page" href="productAdminList.jsp?pageno=<%=next_pageno%>" >></a>
				<a class="page" href="productAdminList.jsp?pageno=<%=total_page %>">>></a>
 		 </td>
 	</tr>
</table>
</body>
</html>