<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>DevOOPS</title>
		<meta name="description" content="description">
		<meta name="author" content="DevOOPS">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="resources/plugins/bootstrap/bootstrap.css" rel="stylesheet">
		<link href="resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet">
		<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
		<link href='http://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
		<link href="resources/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
		<link href="resources/plugins/fullcalendar/fullcalendar.css" rel="stylesheet">
		<link href="resources/plugins/xcharts/xcharts.min.css" rel="stylesheet">
		<link href="resources/plugins/select2/select2.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		<script src="resources/scripts/jquery-3.2.1.min.js"></script>
		<script src="resources/plugins/jquery/jquery-2.1.0.min.js"></script>
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
				<script src="http://getbootstrap.com/docs-assets/js/html5shiv.js"></script>
				<script src="http://getbootstrap.com/docs-assets/js/respond.min.js"></script>
		<![endif]-->
		<style>
			td {
				height: 70px;
			}
		</style>
	</head>
<body>

<div class="row">
	<div id="breadcrumb" class="col-xs-12">
		<ol class="breadcrumb">
			<li><a href="index.html">Dashboard</a></li>
			<li><a href="#">Tables</a></li>
			<li><a href="#">Simple Tables</a></li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<div class="box-name">
					<i class="fa fa-table"></i>
					<span>개인시간표 조회</span>
				</div>
				<div class="box-icons">
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
					<a class="expand-link">
						<i class="fa fa-expand"></i>
					</a>
					<a class="close-link">
						<i class="fa fa-times"></i>
					</a>
				</div>
				<div class="no-move"></div>
			</div>
			<div class="box-content no-padding">
				<div class="bs-callout">
					<button class="close" data-dismiss="alert">&times;</button>
					<h4><code>개인시간표</code> 조회합니다.</h4>
					<p>
						1교시 : 9:00 ~ 10:15 
						2교시 : 10:15 ~ 11:30 
						3교시 : 11:30 ~ 12:45 
						4교시 : 12:45 ~ 2:00
						<br/> 
						5교시 : 2:00 ~ 3:15 
						6교시 : 3:15 ~ 4:30
						7교시 : 4:30 ~ 10:15 
					</p>
					
				</div>
				<!-- 
					color property 
						active
						primary
						success
						info
						warning
						danger
				-->
				<table class="table table-striped table-bordered table-hover table-heading no-border-bottom" id="table1">
					<thead>
						<tr>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr> 
						<tr>
							<td class="active">과목별 Color <br/><code></code></td>
							<td class="success">Color Property<br/><code>전공선택</code></td>
							<td class="info">Color Property  <br/><code>균형교양</code></td>
							<td class="warning">Color Property  <br/><code>일반교양</code></td>
							<td class="danger">Color Property  <br/><code>전공필수</code></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<style>
	.aaa {
		color:blue;
	}
</style>
<script>
		$(document).ready(function() {
			
			
			$.ajax({
	            type:"POST",
	            url:"./getClassTimeList.do", //link
	            dataType:"json",
	            success:function(data){
	               /*  var list = data;
	                var listLen = list.length;
	                console.log("data : "+ data); */
	                var idx;
	    			var array = ["","월","화","수","목","금"];
	    			var property=null;
	    			var backColor=null;
	                console.dir(data);
	                for(var i=0; i<data.length; i++){
	                	/* $("tr:first").each(function() {
		    				idx = $("th:contains("+data[i].week+")").index();
		    			} );
	                	 */
	                	 proerty = data[i].property;

	                	 switch (proerty) {
	                	   case '전공선택'  	: backColor="success"; break;
	                	   case '균형교양' 	: backColor="info"; break;
	                	   case '일반교양'  	: backColor="warning"; break;
	                	   case '전공필수'   		: backColor="danger"; break;
	                	 }
	                	 
	                	 idx = array.indexOf(data[i].week);
	                	 var temp = (data[i].end) - (data[i].start);
	                	$("td:nth-child("+idx+")").filter(":gt("+(data[i].start-1)+"):lt("+temp+")").addClass(backColor); //eq 사용해서 첫번째 칸에 텍스트 지정
	                	$("td:nth-child("+idx+")").filter(":eq("+(data[i].start-1)+")").addClass(backColor);
	                	$("td:nth-child("+idx+")").filter(":eq("+(data[i].start-1)+")").text(data[i].title);
	                }
	            },
	            error : function(request, status, error) {
					alert(error);
				}
	        })
			
			var json = [
			    {
			    	title : '컴퓨터개론',
			        week  : '월',
			        start  : '1',
			        end  : '3'
			    },
		
			    {
			    	title : '소프트웨어공학',
			        week  : '수',
			        start  : '3',
			        end  : '4'
			    }
			];
			
			
			
		});
		</script>
<!--End Container-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
</body>
</html>
