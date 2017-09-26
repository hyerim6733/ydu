<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--Start Breadcrumb-->
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
		<ol class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li><a href="#">Dashboard</a></li>
		</ol>
	</div>
</div>
<!--End Breadcrumb-->
<!--Start Dashboard 1-->
<div id="dashboard-header" class="row">
	<% if(session.getAttribute("userId") == null) { %>
	<div class="col-xs-10 col-sm-5">
		<h3> 환영합니다.<br/> 예담대학교입니다.</h3>
	</div>
	<% }else if(session.getAttribute("stuInfo") != null) { %>
	<div class="col-xs-10 col-sm-5">
		<h3> 환영합니다. <br/> ${stuInfo.name } 학생  </h3>
	</div>
	<% } 
		else if(session.getAttribute("proInfo") != null) { %>
	<div class="col-xs-10 col-sm-5">
		<h3> 환영합니다. <br/> ${proInfo.name } 교수님  </h3>
	</div>
	<% } %>

	<div class="col-xs-2 col-sm-1 col-sm-offset-1">
		<div id="social" class="row">
			
		</div>
	</div>
	<div class="clearfix visible-xs"></div>
	<div class="col-xs-12 col-sm-8 col-md-7 pull-right">
		<div class="row">
			<div class="col-xs-4">
				<div class="sparkline-dashboard" id="sparkline-1"></div>
				<div class="sparkline-dashboard-info">
					<span>자신감</span>
					<i class="fa fa-check-circle"></i> 대학
				</div>
			</div>
			<div class="col-xs-4">
				<div class="sparkline-dashboard" id="sparkline-2"></div>
				<div class="sparkline-dashboard-info">
					<span class="txt-info">행복</span>
					<i class="fa fa-check-circle"></i> 대학원
				</div>
			</div>
			<div class="col-xs-4">
				<div class="sparkline-dashboard" id="sparkline-3"></div>
				<div class="sparkline-dashboard-info">
					<span class="txt-primary">성공</span>
					<i class="fa fa-check-circle"></i> 교육기관
				</div>
			</div>
		</div>
	</div>
</div>
<!--End Dashboard 1-->
<!--Start Dashboard 2-->

<!-- 클릭 시 홈으로 보내면서 테이블 로딩 -->
<div class="row-fluid">
	<div id="dashboard_links" class="col-xs-12 col-sm-2 pull-right">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="#" class="tab-link" id="notice">공지사항</a></li>
			<li><a href="#" class="tab-link" id="board">자유게시판</a></li>
			<li><a href="#" class="tab-link" id="market">벼룩시장</a></li>
			<li><a href="#" class="tab-link" id="guide">학교안내</a></li>
		</ul>
	</div>
	<div id="dashboard_tabs" class="col-xs-12 col-sm-10">
		<!--Start Dashboard Tab 1-->
		<div id="dashboard-notice" class="row" style="visibility: visible; position: relative;">
			<div id="ow-marketplace" class="col-xs-12">
				
				<h4 class="page-header"><i class="fa fa-bullhorn"></i> 공지사항</h4>
				<div align="right">더보기&nbsp</div>
				
				<table id="ticker-table" class="table m-table table-bordered table-hover table-heading">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach begin="1" end="10" var="content">
							<tr>
								<td class="m-ticker"><b>AWS</b><span>Awesome Inc.</span></td>
								<td class="m-price">64.14</td>
								<td class="m-change"><i class="fa fa-angle-up"></i> 12.33 (0.3&#37;)</td>
								<td class="td-graph"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!--End Dashboard Tab 1-->
		<!--Start Dashboard Tab 2-->
		<div id="dashboard-board" class="row" style="visibility: hidden; position: absolute;">
			<div id="ow-marketplace" class="col-xs-12">
				<h4 class="page-header"><i class="fa fa-comment"></i> 자유게시판</h4>
				<div align="right">더보기&nbsp</div>
				
				<table id="ticker-table" class="table m-table table-bordered table-hover table-heading">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach begin="1" end="10" var="content" items="">
							<tr>
								<td class="m-ticker"><b>AWS</b><span>Awesome Inc.</span></td>
								<td class="m-price">64.14</td>
								<td class="m-change"><i class="fa fa-angle-up"></i> 12.33 (0.3&#37;)</td>
								<td class="td-graph"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!--End Dashboard Tab 2-->
		<!--Start Dashboard Tab 3-->
		<div id="dashboard-market" class="row" style="width:100%; visibility: hidden; position: absolute;" >
			<div id="ow-marketplace" class="col-xs-12">
				<h4 class="page-header"><i class="fa fa-shopping-cart"></i> 벼룩시장</h4>
				<div align="right">더보기&nbsp</div>
				
				<table id="ticker-table" class="table m-table table-bordered table-hover table-heading">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach begin="1" end="10" var="content" items="">
							<tr>
								<td class="m-ticker"><b>AWS</b><span>Awesome Inc.</span></td>
								<td class="m-price">64.14</td>
								<td class="m-change"><i class="fa fa-angle-up"></i> 12.33 (0.3&#37;)</td>
								<td class="td-graph"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!--End Dashboard Tab 3-->
		<!--Start Dashboard Tab 4-->
		<div id="dashboard-guide" class="row" style="visibility: hidden; position: absolute;">
			<div class="col-xs-12 col-sm-12 col-md-16 ow-server">
				<h4 class="page-header text-right"><i class="fa fa-pagelines"></i> 대학교</h4>
				<div class="row ow-server-bottom">
					<div class="col-sm-4">
						<div class="knob-slider">
							<input id="knob-srv-1" class="knob" data-width="60"  data-height="60" data-angleOffset="180" data-fgColor="#6AA6D6" data-skin="tron" data-thickness=".2" value="">예담대학교
						</div>
					</div>
					<div class="col-sm-8">
						<div class="row"><i class="fa fa-windows"></i> 안녕하세요 예담대학교입니다.</div>
						<div class="row"><i class="fa fa-user"></i> 2017년 설립</div>
						<div class="row"><i class="fa fa-bolt"></i> 다양한 전공과 질 높은 교육으로 취업률 전국 1위</div>
					</div>
				</div>
			</div>
			<!--  -->
			<div class="col-xs-12 col-sm-6 col-md-6 ow-server">
				<h4 class="page-header text-right"><i class="fa fa-pagelines"></i> 대학원</h4>
				<div class="row ow-server-bottom">
					<div class="col-sm-4">
						<div class="knob-slider">
							<input id="knob-srv-5" class="knob" data-width="60"  data-height="60" data-angleOffset="180" data-fgColor="#6AA6D6" data-skin="tron" data-thickness=".2" value="">예담 대학원
						</div>
					</div>
					<div class="col-sm-8">
						<div class="row"><i class="fa fa-linux"></i> 예담 대학원입니다.</div>
						<div class="row"><i class="fa fa-phone"></i> 보통 2년동안 진행되며 심화된 교육을 받을 수 있습니다.</div>
						<div class="row"><i class="fa fa-bolt"></i>  문의사항이 있으신경우 각 연구실 교수님께 연락바랍니다.</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6 ow-server">
				<h4 class="page-header text-right"><i class="fa fa-pagelines"></i> 교육기관</h4>
				<div class="row ow-server-bottom">
					<div class="col-sm-4">
						<div class="knob-slider">
							<input id="knob-srv-6" class="knob" data-width="60"  data-height="60" data-angleOffset="180" data-fgColor="#6AA6D6" data-skin="tron" data-thickness=".2" value="">교육기관
						</div>
					</div>
					<div class="col-sm-8">
						<div class="row"><i class="fa fa-linux"></i> 그외 교육기관입니다.</div>
						<div class="row"><i class="fa fa-archive"></i> 예담고등학교, 예담직업전문학교</div>
						<div class="row"><i class="fa fa-bolt"></i> 학교 교육과정 외 과목들을 공부할 수 있습니다.</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div id="ow-server-footer">
				<div class="col-xs-12 col-sm-12 btn-default text-center"><i class="fa fa-sun-o"></i> <b>Yedam</b> <span>예담대학교</span></div>
			</div>
		</div>
		<!--End Dashboard Tab 4-->
	</div>
	<div class="clearfix"></div>
</div>
<!--End Dashboard 2 -->
<div style="height: 40px;"></div>
<script type="text/javascript">
// Array for random data for Sparkline
var sparkline_arr_1 = SparklineTestData();
var sparkline_arr_2 = SparklineTestData();
var sparkline_arr_3 = SparklineTestData();

var selectMenu="공지사항"
$(document).ready(function() {
	// Make all JS-activity for dashboard
	DashboardTabChecker();
	// Load Knob plugin and run callback for draw Knob charts for dashboard(tab-servers)
	LoadKnobScripts(DrawKnobDashboard);
	// Load Sparkline plugin and run callback for draw Sparkline charts for dashboard(top of dashboard + plot in tables)
	LoadSparkLineScript(DrawSparklineDashboard);
	// Load Morris plugin and run callback for draw Morris charts for dashboard
	LoadMorrisScripts(MorrisDashboard);
	// Make beauty hover in table
	$("#ticker-table").beautyHover();
/* 	<li class="active"><a href="#" class="tab-link" id="notice">공지사항</a></li>
	<li><a href="#" class="tab-link" id="board">자유게시판</a></li>
	<li><a href="#" class="tab-link" id="market">벼룩시장</a></li>
	<li><a href="#" class="tab-link" id="guide">학교안내</a></li> */
	$.ajax({
		url : "../tabClick.do",
		method : "post",
		data : {selectMenu:selectMenu},
		success : function(data) {
			$("tbody").html("");
			// table에 값 보여주기
			console.log(data);
			// 링크걸기.
			for(i=0;i<5;i++) {
				$("tbody").append("<tr><td>"+ data[i].boardNo+"</td> <td><a href='../main/index#../detailNotice.do?boardNo="+data[i].boardNo+"'>"+data[i].title+"</a></td> <td>"+data[i].writeDate+"</td> <td>"+data[i].writer+"</td> </tr> ");
			}
		},
		error : function(request, status, error) {
			alert(error);
		}
	});
		
	
	$(".tab-link").click(function() {
		selectMenu = (this).text;
		
		$.ajax({
			url : "../tabClick.do",
			method : "post",
			data : {selectMenu:selectMenu},
			success : function(data) {
				callback(data);
			},
			error : function(request, status, error) {
				alert(error);
			}
		});
		// tab 창에 테이블 추가..
		function callback(data) {
			$("tbody").html("");
			// table에 값 보여주기
			console.log(data);
			for(i=0;i<data.length;i++) {
				$("tbody").append("<tr><td>"+ data[i].boardNo+"</td> <td><a href='../main/index#../detailNotice.do?boardNo="+data[i].boardNo+"'>"+data[i].title+"</a></td> <td>"+data[i].writeDate+"</td> <td>"+data[i].writer+"</td> </tr> ");
			}
		}
	});
});
</script>
