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
		<link href="../resources/tiles/css/style.css"  rel="stylesheet">
		<link href="../resources/css/style.css" rel="stylesheet">
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


<script>
$(document).ready(function() {
	// Set Block Height
	SetMinBlockHeight($('#calendar'));
	// Create Calendar
	DrawFullCalendar();
	
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	var json = [{"allDay":"true",
				"editable":"false",
				"end":"2010-11-25",
				"id":"1",
				"start":"2010-11-21",
				"title":"test2"}
	];
/* 	
	$('#calendar').fullCalendar({ 
		event:function() {
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
	}
		

	
	// 상담신청 클릭 (일정추가)
	$("#Add").click(doSomething);
	function doSomething(){
		var data = {};
		
	 	var b = $(".fc-event-inner").closest("td");
		console.log(b); 
		
		var m = $.fullCalendar.moment.parseZone('2017-09-22');
	    alert("Result : " + m.hasZone());
	    
	    var moment = $('#calendar').fullCalendar('getDate');
	    alert("The current date of the calendar is " + moment.format());
	}
	
	// 일정 변경 이벤트
	$("#calendar").change(function() {
		// 달력 일정 정보 저장
		/* var param = {userid : $(this).val()}; */
		var param = [{data:"temp"}]
		console.log(param.data);
		alert("temp가 제대로 들어갔나요 ? ");
/* 		
 		$.get("/submitCal.do", param, function(data,status,xhr) {
			/* alert(data+":"+status);
			console.log(xhr); 
		}); */
	});
});


</script>
</body>
</html>
