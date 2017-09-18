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
<!-- home/notice -->
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
		<ol class="breadcrumb">
			<li><a href="">Home</a></li>
			<li><a href="">Notice</a></li>
		</ol>
	</div>
</div>

<!-- Notice  -->
<div id="dashboard-header" class="row">

	<div class="col-xs-10 col-sm-5">
		<h3> Notice <br/> 공지사항 입니다.</h3>
	</div>
	
	<div class="col-xs-2 col-sm-1 col-sm-offset-1">
		<div id="social" class="row">		
		</div>
	</div>	
</div>


<!--Start Notice 우측탭 -->
<div class="row-fluid">
	<div id="dashboard_links" class="col-xs-12 col-sm-2 pull-right">
		<div id="inner-panel"> 	
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="../notice.do" class="ajax-link" id="notice">공지사항</a></li>
			<li><a href="../noticeGen.do" class="ajax-link" id="Lit">일반 공지</a></li>
			<li><a href="../noticeLit.do" class="ajax-link" id="Lit">학사 공지</a></li>
			<li><a href="../noticeEmp.do" class="ajax-link" id="Emp">취업 공지</a></li>
			<li><a href="../noticeSch.do" class="ajax-link" id="Sch">장학 공지</a></li>
			<li><a href="../noticeVol.do" class="ajax-link" id="Vol">봉사 공지</a></li>
			<li><a href="../noticeEve.do" class="ajax-link" id="Eve">학술/행사</a></li>
		</ul>
		</div>
	</div>
<div id="dashboard_tabs" class="col-xs-12 col-sm-10">
<!--Start Dashboard Tab 1 공지사항  전체 -->

<form name="frm" id="frm"action="<%=request.getContextPath()%>/notice.do" method="post">
	<input type="hidden" name="page" >
		<div id="dashboard-notice" class="row"
			style="visibility: visible; position: relative;">
			<div id="ow-marketplace" class="col-xs-12">
				<div id="inner-panel"> 	
				
				<h4 class="page-header">
					<i class="fa fa-bullhorn"></i> 공지사항</h4>
			
	<div align="right">
	<a href="../insertNoticeForm.do" class="ajax-link">[등록]</a>
	</div>
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
						<c:forEach begin="1" end="10" var="board" items="${notice1}">
							<tr>
								<td>${board.boardNo}</td>
								<td>${board.category}</td>
								<td><a href="../detailNotice.do?boardNo=${board.boardNo}"
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
		</div>
	</div>	

<!--paging 처리 -->
<my:paging paging="${paging}"/>
<!-- 내부ajax링크 div classs=ajax-link -->
<script src="<c:url value="/resources/plugins/jquery/jquery-2.1.0.min.js"/>"></script>
<script src="<c:url value="/resources/js/common.js"/>"></script>		




