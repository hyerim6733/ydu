<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!--paging 처리 -->
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  

<!-- 등록일에 자동 날짜 입력되게 하기 위해서  -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>




<script>
	function setOrderColumn(orderColumn) {
		frm.orderColumn.value = orderColumn;
		frm.submit();
	}
	
	
	function goPage(page){
		frm.page.value = page;
		//ajax로 페이지 로딩 
		var url = pannelurl;
		window.location.hash = url;
		LoadAjaxPannel(url + "?"+$("#frm").serialize() , "dashboard_tabs");
		
	}
</script>




	<!--Start Dashboard Tab 1 공지사항  전체 -->
	<form name="frm" id="frm" method="post">
	<input type="hidden" name="page" >
	<input type="hidden" name="boardCode" >
	<input type="text" name="" value="${boardSearchVO.category }" >
		<div id="dashboard-notice" class="row"
			style="visibility: visible; position: relative;">
			<div id="ow-marketplace" class="col-xs-12">
				
				
				<h4 class="page-header"><i class="fa fa-bullhorn"></i> 공지사항 </h4>
			
	<div align="right">
	<a href="../insertNoticeForm.do" class="pannel-link">[등록]</a>
	</div>

	
				<table id="ticker-table"
					class="table m-table table-bordered table-hover table-heading">
					<thead>
						<tr>
				       		<th>번호</th>
							<th>구분</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach  var="board" items="${notice1}">
							<tr>
								<td>${board.boardNo}</td>
								<td>${board.category}</td>
								<td><a href="../detailNotice.do?boardNo=${board.boardNo}"
									class="pannel-link">${board.title}</a></td>
								<td>${board.writer}</td>
								<td><fmt:formatDate value="${board.writeDate}"
										pattern="YYYY/MM/dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
			</form>
		


<!--paging 처리 -->
<my:paging paging="${paging}"/>
