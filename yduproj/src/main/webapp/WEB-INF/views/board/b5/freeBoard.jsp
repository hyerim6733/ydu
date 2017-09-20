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
		var url = frm.action;
		window.location.hash = url;
		LoadAjaxContent(url + "?"+$("#frm").serialize());
		
	}
</script>

<!-- home/freeBoard -->
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
		<ol class="breadcrumb">
			<li><a href="">Home</a></li>
			<li><a href="">FreeBoard</a></li>
		</ol>
	</div>
</div>

<!-- FreeBoard  -->
<div id="dashboard-header" class="row">

	<div class="col-xs-10 col-sm-5">
		<h3> FreeBoard <br/> 자유게시판</h3>
	</div>
	
	<div class="col-xs-2 col-sm-1 col-sm-offset-1">
		<div id="social" class="row">		
		</div>
	</div>	
</div>

<!-- 결과값  보여주는 div 영역 -->

<div id="dashboard_tabs" class="col-xs-12 col-sm-10">
<form name="frm" id="frm"action="<%=request.getContextPath()%>/freeBoard.do" method="post">
	<input type="hidden" name="page" >
		<div id="dashboard-notice" class="row"
			style="visibility: visible; position: relative;">
			<div id="ow-marketplace" class="col-xs-12">
				<h4 class="page-header"><i class="fa fa-bullhorn"></i> 자유게시판 </h4>
			
	<div align="right">
	<a href="../insertFreeBoardForm.do" class="ajax-link">[등록]</a>
	</div>
<table id="ticker-table"
					class="table m-table table-bordered table-hover table-heading">
					<thead>
						<tr>
				       		<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach  var="board" items="${freeBoard1}">
							<tr>
								<td>${board.boardNo}</td>
								<td><a href="../detailFreeBoard.do?boardNo=${board.boardNo}"
									class="ajax-link">${board.title}</a></td>
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
</div>
<!-- 내부ajax링크 div classs=ajax-link -->
<script src="<c:url value="/resources/plugins/jquery/jquery-2.1.0.min.js"/>"></script>
<script src="<c:url value="/resources/js/common.js"/>"></script>		







<!-- 검색기능 추가 -->
<%-- 
<form name="frm" action="<%=request.getContextPath()%>/freeBoard.do" method="post">	
	<table>
		<tr>
			<td>
			<select name="searchCondition">
					<option value="TITLE">제목</option>
					<option value="WRITER">작성자</option>
					<option value="CONTENT">내용</option>
			</select> 
			<input type="text" name="searchKeyword" /> 
			<input type="submit" value="검색" />
			</td>
		</tr>
	</table>
 --%>
