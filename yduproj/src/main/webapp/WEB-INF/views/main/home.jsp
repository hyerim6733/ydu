<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<html>
<head>
<title>Home.jsp</title>
<style>
div.main {
	margin: 5px;
	border: 1px solid #ccc;
	float: left;
	width: 180px;
}
</style>
<!-- 
<script>
	//수정해야함 슬라이드 부분 스크립트 
	var mySlider = $('.bxslider').bxSlider({
		mode : 'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
		moveSlides : 1, // 슬라이드 이동시 개수
		minSlides : 1, // 최소 노출 개수
		maxSlides : 1, // 최대 노출 개수
		slideWidth : 358, // 슬라이드 너비
		speed : 1000, //default:500 이미지변환 속도
		auto : true, //default:false 자동 시작
		captions : false, // 이미지의 title 속성이 노출된다.
		autoControls : false, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
		pager : false,
		controls : false // 이전 다음 버튼 노출 여부
	});

	//이전 버튼을 클릭하면 이전 슬라이드로 전환
	$('#prevBtn').on('click', function() {
		mySlider.goToPrevSlide(); //이전 슬라이드 배너로 이동
		return false; //<a>에 링크 차단
	});
	//다음 버튼을 클릭하면 다음 슬라이드로 전환
	$('#nextBtn').on('click', function() {
		mySlider.goToNextSlide(); //다음 슬라이드 배너로 이동
		return false;
	});
	//정지 버튼을 클릭하면 슬라이드 정지
	$('#slideStop').on('click', function() {
		mySlider.stopAuto(); //슬라이드 정지
		$('#startTo').show();
		$('#stopTo').hide();
		return false;
	});
	//시작 버튼을 클릭하면 슬라이드 정지
	$('#slideStart').on('click', function() {
		mySlider.startAuto(); //슬라이드 시작
		$('#stopTo').show();
		$('#startTo').hide();
		return false;
	});
</script>
 -->
 
</head>
<body>
 
<!-- main_visual-->
<!-- 
	<div class="main_visual">
		
	<div id="slideshow">
		<ul id="mainSlide" class="mainSlide">
			<li style="left: 50%; margin-left: -960px; cursor: pointer;">
			<a href="#;" onclick="" style="">
				<img src="src/main/webapp/image/human.jpg" alt="존중하고 존경받는 유느님" /></a></li>
			<li style="left: 50%; margin-left: -960px; cursor: pointer;">
			<a href="#;" onclick="">
			<img src="src/main/webapp/image/kaak.jpg" alt="놀라는 유느님" /></a></li>
			<li style="left: 50%; margin-left: -960px; cursor: pointer;">
			<a href="#;" onclick="">
			<img src="src/main/webapp/image/nani.jpg" alt="뭐야하는 유느님"/></a></li>
		</ul>
	</div>	
</div> -->
<!--//main_visual--> 


	<h5>Home.jsp 파일</h5>
	<br />
	<h1>Hello world!</h1>
	<br />
	<hr>
	<P>The time on the server is ${serverTime}.</P>
	<hr>

	<hr>
	<div class="main">
		<!-- notice -->
		<div class="notice">
			<h2>공지사항 test</h2>
			<br>
			<p>미리보기용 파일 만들기</p>
			<br />
			<p>플러스모양 그림 넣기</p>

			<a href="" class="more"> <img src="" alt="더보기"></a>
		</div>
	</div>
	<!-- //notice -->
	<div class="main">
		<!-- academicBoard -->
		<div class="academicBoard">
			<h2>학사안내 test</h2>
			<br>
			<p>미리보기용 파일 만들기</p>
			<br />
			<p>플러스모양 그림 넣기</p>

			<a href="" class="more"> <img src="" alt="더보기"></a>
		</div>
	</div>
	<!-- //academicBoard -->
	<div class="main">
		<!-- calendar -->
		<div class="calendar">
			<h2>캘린더 test</h2>
			<br>
			<p>미리보기용 파일 만들기</p>
			<br>
			<p>플러스모양 그림 넣기</p>

			<a href="" class="more"> <img src="" alt="더보기"></a>
		</div>
	</div>
	<!-- //calendar -->
	<hr>
	<br>
	<br>



</body>
</html>
