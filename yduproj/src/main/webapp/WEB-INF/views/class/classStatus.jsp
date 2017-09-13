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
		<link href="resources/tiles/css/style.css"  rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
				<script src="http://getbootstrap.com/docs-assets/js/html5shiv.js"></script>
				<script src="http://getbootstrap.com/docs-assets/js/respond.min.js"></script>
		<![endif]-->
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
					<h4>개인 시간표조회를 조회합니다.</h4>
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
					<p><code>.table-striped</code>, <code>.table-bordered</code>, <code>.table-hover</code> and <code>.table-heading</code></p>
					<p>Also you can use contextual classes to color table rows or individual cells</p>
				</div>
				<table class="table table-striped table-bordered table-hover table-heading no-border-bottom">
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
							<td>no</td>
							<td>class</td>
							<td>to</td>
							<td>default</td>
							<td>view</td>
						</tr>
						<tr class="active">
							<td>class</td>
							<td><code>active</code></td>
							<td>to</td>
							<td>color</td>
							<td>row</td>
						</tr>
						<tr class="primary">
							<td>class</td>
							<td><code>primary</code></td>
							<td>to</td>
							<td>color</td>
							<td>row</td>
						</tr>
						<tr class="success">
							<td>class</td>
							<td><code>success</code></td>
							<td>to</td>
							<td>color</td>
							<td>row</td>
						</tr>
						<tr class="info">
							<td>class</td>
							<td><code>info</code></td>
							<td>to</td>
							<td>color</td>
							<td>row</td>
						</tr>
						<tr class="warning">
							<td>class</td>
							<td><code>warning</code></td>
							<td>to</td>
							<td>color</td>
							<td>row</td>
						</tr>
						<tr class="danger">
							<td>class</td>
							<td><code>danger</code></td>
							<td>to</td>
							<td>color</td>
							<td>row</td>
						</tr> 
						<tr>
							<td class="active"><code>active</code> class to color cell</td>
							<td class="success"><code>success</code> class to color cell</td>
							<td class="info"><code>info</code> class to color cell</td>
							<td class="warning"><code>warning</code> class to color cell</td>
							<td class="danger"><code>danger</code> class to color cell</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	// Drag-n-Drop feature
	WinMove();
});
</script>

<!--End Container-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
</body>
</html>
