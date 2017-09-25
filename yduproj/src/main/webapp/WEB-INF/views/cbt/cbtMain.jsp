<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Yedam Univ. CBT </title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
b { 
	font-size:50px;
}
</style>
</head>
<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  <span class="w3-bar-item w3-right"><a href="<%=request.getContextPath()%>/main/index">Yedam home</a></span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s4">
      <img src="#" class="w3-circle w3-margin-right" style="width:46px">
    </div>
    <div class="w3-col s8 w3-bar">
      <span>Welcome, <strong> song ye dam</strong></span><br>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a>
    </div>
  </div>
  <hr> 
  <div class="w3-container">
    <h5>Dashboard</h5>
  </div>
 	 <div class="w3-bar-block" id="left-menu">
    <a href="#" class="ajax-link w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
    <a href="#cbtBody.do" class="w3-bar-item w3-button w3-padding w3-skyblue" onclick="page_reload()"><i class="fa fa-users fa-fw"></i> CBT 메인화면 </a>
    <a href="#getAllCBT.do" class="w3-bar-item w3-button w3-padding " onclick="page_reload()"><i class="fa fa-eye fa-fw"></i> 시험목록조회</a>
    <!-- 시험 목록 조회하고 교수라면 시험지 등록 가능 하게 할 예정 -->
    <a href="#boardQnA.do" class="w3-bar-item w3-button w3-padding" onclick="page_reload()"><i class="fa fa-users fa-fw"></i> Q&A </a>
    <a href="#getMyCBT.do" class="w3-bar-item w3-button w3-padding" onclick="page_reload()"><i class="fa fa-diamond fa-fw"></i> 학생목록조회test</a>
    <a href="#goResult.do" class="w3-bar-item w3-button w3-padding" onclick="page_reload()"><i class="fa fa-bank fa-fw"></i> 결과보기 </a>
    <% if(session.getAttribute("proInfo") != null) { %> 
 	<a href="#submitExamForm.do" class="w3-bar-item w3-button w3-padding" onclick="page_reload()"><i class="fa fa-bell fa-fw "></i> 시험문제출제(교수전용) </a>
 	<% } %>
 	<!-- 시험목록조회에서 등록되면 시험출제 가능:시험지에 문제만 넣으면 되게 할 예정 -->
  </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">


  <!-- Header -->
		<div id="content" class="col-xs-12 col-sm-10">
			<div class="preloader"></div>
			<div id="ajax-content"></div>

			<!-- 위의 코드 ajax 로 메뉴클릭시 보여주도록 함 -->

		</div>


  <!-- End page content -->
</div>
<script src="resources/plugins/jquery/jquery-2.1.0.min.js"></script>
<script src="resources/js/devoops.js"></script>

<script> 
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
    if (mySidebar.style.display === 'block') {
        mySidebar.style.display = 'none';
        overlayBg.style.display = "none";
    } else {
        mySidebar.style.display = 'block';
        overlayBg.style.display = "block";
    }
}

// Close the sidebar with the close button
function w3_close() {
    mySidebar.style.display = "none";
    overlayBg.style.display = "none";
}



function page_reload() {
	location.reload();
}
</script>

</body>
</html>
