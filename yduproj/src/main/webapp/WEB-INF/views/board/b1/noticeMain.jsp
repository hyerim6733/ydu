<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!--paging 처리 -->
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  

<!-- 등록일에 자동 날짜 입력되게 하기 위해서  -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>







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
		<ul class="nav nav-pills nav-stacked">
			<li><a href="../notice.do" class="pannel-link" id="notice">공지사항</a></li>
			<li><a href="../noticeGen.do" class="pannel-link" id="Lit">일반 공지</a></li>
			<li><a href="../noticeLit.do" class="pannel-link" id="Lit">학사 공지</a></li>
			<li><a href="../noticeEmp.do" class="pannel-link" id="Emp">취업 공지</a></li>
			<li><a href="../noticeSch.do" class="pannel-link" id="Sch">장학 공지</a></li>
			<li><a href="../noticeVol.do" class="pannel-link" id="Vol">봉사 공지</a></li>
			<li><a href="../noticeEve.do" class="pannel-link" id="Eve">학술/행사</a></li>
		</ul>
		</div>
	</div>
<!-- 결과값  보여주는 div 영역 -->
<div id="dashboard_tabs" class="col-xs-12 col-sm-10">

</div>

<!-- 내부ajax링크 div classs=ajax-link -->
<script src="<c:url value="/resources/plugins/jquery/jquery-2.1.0.min.js"/>"></script>
<!-- <script src="<c:url value="/resources/js/common.js"/>"></script> -->		
<script>
function LoadAjaxPannel(url,target){
	$('.preloader').show();
	$.ajax({
		mimeType: 'text/html; charset=utf-8', // ! Need set mimeType only when run from local file
		url: url,
		cache: false, //jquery cache
		type: 'GET',
		success: function(data) {
			if(target ) {
				$('#'+ target).html(data);
				$('.preloader').hide();
				console.log(target);
			}else{

				$('#ajax-content').html(data);
				$('.preloader').hide();
				
			}
		},
		error: function (jqXHR, textStatus, errorThrown) {
			alert(errorThrown);
		},
		dataType: "html",
		async: false
	});
}

$('#ajax-content').on('click',".pannel-link", function(e){ 
	e.preventDefault();
	pannelurl = $(this).attr('href');
	window.location.hash = pannelurl;
	LoadAjaxPannel(pannelurl,"dashboard_tabs" );
});

//좌측버튼으로 공지부르기
var pannelurl="../notice.do";
LoadAjaxPannel(pannelurl,"dashboard_tabs" );
</script>




