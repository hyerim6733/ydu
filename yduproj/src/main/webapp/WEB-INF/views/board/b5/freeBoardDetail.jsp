<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!--paging 처리 -->
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  

<!-- 등록일에 자동 날짜 입력되게 하기 위해서  -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>




<!-- home/freeBoard/Detail -->
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
		<ol class="breadcrumb">
			<li><a href="">Home</a></li>
			<li><a href="">FreeBoard</a></li>
			<li><a href="">Detail</a></li>
		</ol>
	</div>
</div>

<!-- FreeBoard  -->
<div id="dashboard-header" class="row">

	<div class="col-xs-10 col-sm-5">
		<h3> FreeBoard <br/> 자유게시판  <br/> 상세보기</h3>
	</div>
	
	<div class="col-xs-2 col-sm-1 col-sm-offset-1">
		<div id="social" class="row">		
		</div>
	</div>	
</div>

<!-- 결과값  보여주는 div 영역 -->
<div id="dashboard_tabs" class="col-xs-12 col-sm-10">
<br/><br/>
번호:  ${board.boardNo} <br/>
작성자:  ${board.writer} <br/>
작성일: <fmt:formatDate value="${board.writeDate}" pattern="YYYY/MM/dd" /> <br/>
<br/><br/>
[제목] <br/>
${board.title} <br/>
<br/><br/>
[내용]
<br/> ${board.content} <br/>
<br/><br/>
<br/><br/>
<a href="../updateFreeBoardForm.do?boardNo=${board.boardNo}" class="ajax-link">[수정]</a>
<br/><br/>
<a href="../freeBoard.do" class="ajax-link">[목록]</a>
<br/><br/>

</div>
<!-- 내부ajax링크 div classs=ajax-link -->
<script src="<c:url value="/resources/plugins/jquery/jquery-2.1.0.min.js"/>"></script>
<script src="<c:url value="/resources/js/common.js"/>"></script>	

