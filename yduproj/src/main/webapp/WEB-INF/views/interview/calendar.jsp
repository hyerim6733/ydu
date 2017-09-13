<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
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
		<!-- <link href="../resources/tiles/css/style.css"  rel="stylesheet"> -->
		<link href="../resources/css/style.css" rel="stylesheet">
		<link rel='stylesheet' href="../resources/plugins/fullcalendar/fullcalendar.css" />
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="http://getbootstrap.com/docs-assets/js/html5shiv.js"></script>
		<script src="http://getbootstrap.com/docs-assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
<div class="row full-calendar">
	<div class="col-sm-3">
		<div id="add-new-event">
			<h4 class="page-header">Add new event</h4>
			<div class="form-group">
				<label>Event title</label>
				<input type="text" id="new-event-title" class="form-control">
			</div>
			<div class="form-group">
				<label>Event description</label>
				<textarea class="form-control" id="new-event-desc" rows="3"></textarea>
			</div>
			<a href="#" id="new-event-add" class="btn btn-primary pull-right">Add event</a>
			<div class="clearfix"></div>
		</div>
		<div id="external-events">
			<h4 class="page-header" id="events-templates-header">Draggable Events</h4>
			<div class="external-event">진로상담</div>
			<div class="external-event">취업상담</div>
			<div class="external-event">자소서 클리닉</div>
			<div class="external-event">면접 클리닉</div>
			<div class="external-event">Launch</div>
			<div class="checkbox">
				<label>
					<input type="checkbox" id="drop-remove"> remove after drop
					<i class="fa fa-square-o small"></i>
				</label>
			</div>
		</div>
		<div>
			<input type="button" id="Add" value="상담신청" onclick=""/>
		</div>
	</div>
	
	<div class="col-sm-9" id="cal">
		<div id="calendar"></div>
	</div>
</div>

<!-- All functions for this theme + document.ready processing -->

<script src="../resources/plugins/jquery/jquery-2.1.0.min.js"></script>
<script src="../resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="../resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="../resources/plugins/justified-gallery/jquery.justifiedgallery.min.js"></script>
<script src="../resources/plugins/tinymce/tinymce.min.js"></script>
<script src="../resources/plugins/tinymce/jquery.tinymce.min.js"></script>

<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src="../resources/plugins/fullcalendar/fullcalendar.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script>
$(document).ready(function() {
	// Set Block Height
	SetMinBlockHeight($('#calendar'));
	// Create Calendar
	/*
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	*///링크 걸기..
	
	/* interDate -> start
		property ->title
		*/
	

		/*
		Calendar <check list>
		 1. dupCheck
		 2. insert (to session_user)
		 3. delete (to adim / session_user)
		 4. session apply
		 */
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		defaultDate: '2017-09-12',
		defaultView: 'month',
		editable: true,
		events: function(start, end, timezone, callback) {
			$.ajax({
				url : "../setCalendar.do",
				method : "post",
				type : "json",
				success : function(data) {
					 callback(data);
				},
				error : function(request, status, error) {
					alert(error);
				}
			});
		}
	});
	
/*
	$('#calendar').fullCalendar({
		events: [
		    {
		        title  : 'event1',
		        start  : '2017-09-01'
		    },
		    {
		        title  : 'event2',
		        start  : '2017-09-05',
		        end    : '2017-09-07'
		    },
		    {
		        title  : 'event3',
		        start  : '2017-09-09T12:30:00',
		        allDay : false // will make the time show
		    }
		]
	});*/
/* 	
	$('#calendar').fullCalendar({ 
		events:function() {
			$.ajax({
				url:json,
				dataType: 'json',
				success : function(data, text, request) {
					var event = eval(data.jsonTxt);
					createCalendarDateResult(event);
				}
			});
		}
	});
 */
 /*
	function createCalendarDateResult(resp){  //제이슨으로 캘린더 이벤트 등록형식에 맞게 뿌리기
		  var result = $.parseJSON(resp)  , eventData = [];
		  if(result.success){
		    var date = $.parseJSON(result.extra);
		    alert(result.extra);
		    for(var i = 0; i < date.length; i++)
		    {
		      eventData.push({
		        title : date[i].title,
		        start : date[i].start,
		        end : date[i].end
		      });
		    }
		  }
		  calendarEvent( eventData );        //캘린더 메소드 호출
	}*/
		

	
	// 상담신청 클릭 (일정추가)
	/*$("#Add").click(doSomething);
	function doSomething(){
		var data = {};
		
	 	var b = $(".fc-event-inner").closest("td");
		console.log(b); 
		
		var m = $.fullCalendar.moment.parseZone('2017-09-22');
	    alert("Result : " + m.hasZone());
	    
	    var moment = $('#calendar').fullCalendar('getDate');
	    alert("The current date of the calendar is " + moment.format());
	}*/
	/*
	// 일정 변경 이벤트
	$("#calendar").change(function() {
		// 달력 일정 정보 저장
		// var param = {userid : $(this).val()}; 
		var param = [{data:"temp"}]
		console.log(param.data);

	});*/
});


</script>
</body>
</html>
