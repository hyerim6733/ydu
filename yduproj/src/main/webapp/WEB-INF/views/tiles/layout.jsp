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
		<link href="../resources/plugins/bootstrap/bootstrap.css" rel="stylesheet">
		<link href="../resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet">
		<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
		<link href='http://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
		<link href="../resources/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
		<link href="../resources/plugins/fullcalendar/fullcalendar.css" rel="stylesheet">
		<link href="../resources/plugins/xcharts/xcharts.min.css" rel="stylesheet">
		<link href="../resources/plugins/select2/select2.css" rel="stylesheet">
		<link href="../resources/css/style.css" rel="stylesheet">
		<link rel='stylesheet' href='https://fullcalendar.io/js/fullcalendar-3.5.1/fullcalendar.css' />
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
				<script src="http://getbootstrap.com/docs-assets/js/html5shiv.js"></script>
				<script src="http://getbootstrap.com/docs-assets/js/respond.min.js"></script>
		<![endif]-->
	</head>
<body>
<!--Start Header-->
<div id="screensaver">
	<canvas id="canvas"></canvas>
	<i class="fa fa-lock" id="screen_unlock"></i>
</div>
<div id="modalbox">
	<div class="devoops-modal">
		<div class="devoops-modal-header">
			<div class="modal-header-name">
				<span>Basic table</span>
			</div>
			<div class="box-icons">
				<a class="close-link">
					<i class="fa fa-times"></i>
				</a>
			</div>
		</div>
		<div class="devoops-modal-inner">
		</div>
		<div class="devoops-modal-bottom">
		</div>
	</div>
</div>
<header class="navbar">
	<div class="container-fluid expanded-panel">
		<div class="row">
			<div id="logo" class="col-xs-12 col-sm-2">
				<a href="../main/index">예담대학교</a>
			</div>
			<div id="top-panel" class="col-xs-12 col-sm-10">
				<div class="row">
					<div class="col-xs-8 col-sm-4">
						<a href="#" class="show-sidebar">
						  <i class="fa fa-bars"></i>
						</a>
						<div id="search">
							<input type="text" placeholder="search"/>
							<i class="fa fa-search"></i>
						</div>
					</div>
					<div class="col-xs-4 col-sm-8 top-panel-right">
						<ul class="nav navbar-nav pull-right panel-menu">
							<li class="hidden-xs">
								<a href="index.html" class="modal-link">
									<i class="fa fa-bell"></i>
									<span class="badge">7</span>
								</a>
							</li>
							<li class="hidden-xs">
								<a class="ajax-link" href="ajax/calendar.html">
									<i class="fa fa-calendar"></i>
									<span class="badge">7</span>
								</a>
							</li>
							<li class="hidden-xs">
								<a href="ajax/page_messages.html" class="ajax-link">
									<i class="fa fa-envelope"></i>
									<span class="badge">7</span>
								</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle account" data-toggle="dropdown">
									<div class="avatar">
										<img src="#" class="img-rounded" alt="user" />
									</div>
									<i class="fa fa-angle-down pull-right"></i>
									<% if(session.getAttribute("userId") == null) { %>
										/cbtMain.do#cbtBody.do
										<div class="user-mini pull-right">
											<span class="welcome"><a class="ajax-link" href="../loginForm.do">login</a></span>
										</div>
									<% }else { %>
										<div class="user-mini pull-right">
											<span class="welcome">Welcome! <br/>${userId.separation}</span>
											<span>${userId.userid }</span>
										</div>
									<% } %>
									
								</a>
								<ul class="dropdown-menu">
									<li>
										<a href="#">
											<i class="fa fa-user"></i>
											<span class="hidden-sm text">Profile</span>
										</a>
									</li>
									<li>
										<a href="ajax/page_messages.html" class="ajax-link">
											<i class="fa fa-envelope"></i>
											<span class="hidden-sm text">Messages</span>
										</a>
									</li>
									<li>
										<a href="ajax/gallery_simple.html" class="ajax-link">
											<i class="fa fa-picture-o"></i>
											<span class="hidden-sm text">Albums</span>
										</a>
									</li>
									<li>
										<a href="ajax/calendar.html" class="ajax-link">
											<i class="fa fa-tasks"></i>
											<span class="hidden-sm text">Tasks</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-cog"></i>
											<span class="hidden-sm text">Settings</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-power-off"></i>
											<span class="hidden-sm text" class="ajax-link" OnClick="location.href='../logout.do'">Logout</span>
										</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<!--End Header-->
<!--Start Container-->
<div id="main" class="container-fluid">
	<div class="row">
			<div id="sidebar-left" class="col-xs-2 col-sm-2">
				<ul class="nav main-menu">
					<li><a class="ajax-link" href="../main/home"> <i
							class="fa fa-dashboard"></i> <span class="hidden-xs"> 메인화면
						</span>
					</a></li>
					<li><a href="../cbtMain.do#cbtBody.do"> <i
							class="fa fa-bar-chart-o"></i> <span class="hidden-xs">
								CBT </span>
					</a></li>
					<li><a href="../classMain.do#classBody.do"> <i
							class="fa fa-bar-chart-o"></i> <span class="hidden-xs">
								수강신청 </span>
					</a></li>

				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-list"></i>
						 <span class="hidden-xs">게시판6</span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="ajax/page_login.html">Login</a></li>
						<li><a href="ajax/page_register.html">Register</a></li>
						<li><a id="locked-screen" class="submenu" href="ajax/page_locked.html">Locked Screen</a></li>
						<li><a class="ajax-link" href="ajax/page_contacts.html">Contacts</a></li>
						<li><a class="ajax-link" href="ajax/page_feed.html">Feed</a></li>
						<li><a class="ajax-link add-full" href="ajax/page_messages.html">Messages</a></li>
						<li><a class="ajax-link" href="ajax/page_pricing.html">Pricing</a></li>
						<li><a class="ajax-link" href="ajax/page_invoice.html">Invoice</a></li>
						<li><a class="ajax-link" href="ajax/page_search.html">Search Results</a></li>
						<li><a class="ajax-link" href="ajax/page_404.html">Error 404</a></li>
						<li><a href="ajax/page_500.html">Error 500</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-map-marker"></i>
						<span class="hidden-xs">게시판7</span>
					</a>
					<ul class="dropdown-menu">
						<li><a class="ajax-link" href="ajax/maps.html">OpenStreetMap</a></li>
						<li><a class="ajax-link" href="ajax/map_fullscreen.html">Fullscreen map</a></li>
					</ul>
				</li>
<!-- 공지&학사안내 -->				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-table"></i>
						 <span class="hidden-xs">공지&학사안내</span>
					</a>
					<ul class="dropdown-menu">
						<li><a class="ajax-link" href="../notice.do">공지사항</a></li>
						<li><a class="ajax-link" href="../literature.do">학사안내</a></li>
						<li><a class="ajax-link" href="../ajax/test3-3.jsp">미정</a></li>
					</ul>
				</li>

<!-- 대학/대학원/부속교육기관 -->				
				<li>
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-bar-chart-o"></i>
						<span class="hidden-xs">대학/대학원/부속교육기관</span>
					</a>
					<ul class="dropdown-menu">
						<li><a class="ajax-link" href="../academics1.do">대학</a></li>
						<li><a class="ajax-link" href="../academics2.do">대학원</a></li>
						<li><a class="ajax-link" href="../academics3.do">부속교육기관</a></li>
					</ul>
				</li>
				
<!-- 벼룩&자유 -->
				<li class="dropdown">
					<a href="../fleaMarket.do" class="dropdown-toggle ajax-link">
						<i class="fa fa-picture-o"></i>
						 <span class="hidden-xs">벼룩&자유</span>
					</a>
					<ul class="dropdown-menu">
						<li><a class="ajax-link" href="../fleaMarket.do">벼룩시장</a></li>
						<li><a class="ajax-link" href="../freeBoard.do">자유게시판</a></li>
					</ul>
				</li>
<!-- FAQ -->				
				<li>
					 <a class="ajax-link" href="../faq.do">
						 <i class="fa fa-font"></i>
						 <span class="hidden-xs">FAQ</span>
					</a>
				</li>
				 <li>
					<a class="ajax-link" href="../interview/calendar.do">
						 <i class="fa fa-calendar"></i>
						 <span class="hidden-xs">학교일정</span>
					</a>
				 </li>
				
			</ul>
		</div>
		<!--Start Content-->
		<div id="content" class="col-xs-12 col-sm-10">
	<div class="preloader">
			<img src="../resources/img/devoops_getdata.gif" class="devoops-getdata" alt="preloader"/>
			</div>
			<!--Start Content-->
			<div id="content" class="col-xs-12 col-sm-10">
				<div class="preloader"></div>
				<div id="ajax-content"></div>

				<!-- 위의 코드 ajax 로 메뉴클릭시 보여주도록 함 -->



			</div>
			<!--End Content-->
	</div>
</div>
<!--End Container-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--<script src="http://code.jquery.com/jquery.js"></script>-->
<script src="../resources/plugins/jquery/jquery-2.1.0.min.js"></script>
<script src="../resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="../resources/plugins/justified-gallery/jquery.justifiedgallery.min.js"></script>
<script src="../resources/plugins/tinymce/tinymce.min.js"></script>
<script src="../resources/plugins/tinymce/jquery.tinymce.min.js"></script>
<!-- All functions for this theme + document.ready processing -->
<script src="../resources/js/devoops.js"></script>



</body>
</html>
