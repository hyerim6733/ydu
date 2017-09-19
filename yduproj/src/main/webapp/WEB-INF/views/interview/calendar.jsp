<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset='utf-8' />
<link href="../resources/plugins/fullcalendar-3.5.1/fullcalendar.min.css" rel='stylesheet' />
<link href="../resources/plugins/fullcalendar-3.5.1/fullcalendar.print.min.css" rel='stylesheet' media='print' />
<script src="../resources/plugins/fullcalendar-3.5.1/lib/moment.min.js"></script>
<script src="../resources/plugins/fullcalendar-3.5.1/lib/jquery.min.js"></script>
<script src="../resources/plugins/fullcalendar-3.5.1/lib/jquery-ui.min.js"></script>
<script src="../resources/plugins/fullcalendar-3.5.1/fullcalendar.min.js"></script>
<script>

	$(document).ready(function() {

		var selAction = "insert";
		var cnt = 0;
		var main = new Array(); // json의 전체를 가리키는 배열
		
		var jsonObject; //jsonObject라는 변수에 json형식으로 key이름은 list, value 배열은 이전에 만들었던 main 배열을 넣는다


		/* initialize the external events
		-----------------------------------------------------------------*/

		$('#external-events .fc-event').each(function() {

			// store data so the calendar knows to render an event upon drop
			$(this).data('event', {
				title: $.trim($(this).text()), // use the element's text as the event title
				stick: true // maintain when user navigates (see docs on the renderEvent method)
			});

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});

		});


		/* initialize the calendar
		-----------------------------------------------------------------*/

		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultView: 'month',
			editable: true,
			
			events: function(start, end, timezone, callback) {
				$.ajax({
					url : "../setCalendar.do",
					method : "post",
					type : "json",
					success : function(data) {
						schedule = data;
						callback(data);
					},
					error : function(request, status, error) {
						alert(error);
					}
				});
			},
			dayClick: function(date, jsEvent, view, event) {

		        alert('선택 날짜 : ' + date.format());
		        // change the day's background color just for fun
		        $(this).css('background-color', 'red');

		    },
		    eventClick: function(calEvent, jsEvent, view) {

		        alert('Event: ' + calEvent.title);
		        
		        // change the border color just for fun
		        $(this).css('border-color', 'red');
		    },
		    // update
		    eventDrop: function(event, delta, revertFunc) {
		        if (!confirm("일정을 수정하시겠습니까?")) {

		        	revertFunc();
		        	
		        }
	        	var person = prompt("상담시간은? (1~5) ", "1");
	            if (person == null) {
	                alert("상담시간 미입력");
	            }else {
	            	
	            }
				selAction = "update";
				
				sub = new Object();     // 객체 값 입력후 main배열의 0번 index에 셋팅
				sub['action'] = selAction; 
				sub['newDate'] = event.start.format();
				sub['title'] = event.title;
				sub['userId'] = 'userId';
				sub['interId'] = 'value3';
				main[cnt] = sub;

				console.log("main action : "+main[cnt].action);
				console.log("main : "+main[cnt]);
				cnt+=1;
				
		    	//statusID select
		    	var statusID = null;
	        	for(i=0;i<schedule.length;i++) {
		    		if(schedule[i].title==event.title) {
		    			statusID = schedule[i].statusId;
		    			break;
		    		}
		    	}
	        	var AddSchedule = [{
		        	"st_code"		:"",
		        	"start"			:event.start.format(),
		        	"statusId"		:statusID,
		        	"title"			:event.title
		        }];

		        console.log(AddSchedule);
		        /* 
		         $.ajax({
					url : "../dropCalendar.do",
					method : "post",
					type : "json",
					data : {
		                 json : AddSchedule,
		                 json : schedule
		            },
					success : function(data) {
						 console.log(data);
						 alert(data);
					},
					error : function(request, status, error) {
						alert(error);
					}
				}); 
		          */
		    },
			droppable: true, // this allows things to be dropped onto the calendar
			//insert
			drop: function( date, allDay, jsEvent, ui ) {
				selAction = "insert";
				
				sub = new Object();     // 객체 값 입력후 main배열의 0번 index에 셋팅
				sub['action'] = selAction; 
				sub['newDate'] = date.format();
				sub['title'] = 'value3';
				sub['userId'] = 'value3';
				sub['interId'] = 'value3';
				main[cnt] = sub;
				 
				var tmp1 = $('.draggable:selected').title;

				console.log("temp1 : "+(this).title);
				console.log("temp2 : "+jsEvent.title);
				console.log("main : "+main[cnt].action);
				console.log(date._d);
				console.log(allDay);
				console.log(jsEvent);
				console.log(ui);
				cnt+=1;
				
				alert("drop Event");
				
				
			}
		});

		// 수정 버튼
		$("#btn_modify").click(function() {
			var selectAction = $(":input:radio:checked").val();
			jsonObject = {list:main};
			$.post ({
				 url:"../setCalendar.do",
				 data:jsonObject,
				 callback:function(data, status) {
					 alert("Data : "+ data +" status : "+ status );
				 }
			});
			// ajax 한번 더 실행
			
			
		});
		
		// 확인 버튼
		$("#btn_submit").click(function() {
			var selectAction = $(":input:radio:checked").val();
			
			console.log($(":input:radio:checked").val());	
		});
		
		
		
		
	});

</script>
<style>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	}
		
	#wrap {
		width: 1100px;
		margin: 0 auto;
	}
		
	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		border: 1px solid #ccc;
		background: #eee;
		text-align: left;
	}
		
	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
	}
		
	#external-events .fc-event {
		margin: 10px 0;
		cursor: pointer;
	}
		
	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
	}
		
	#external-events p input {
		margin: 0;
		vertical-align: middle;
	}

	#calendar {
		float: right;
		width: 900px;
	}

</style>
</head>
<body>
	<div id='wrap'>

		<div id='external-events'>
			<h4>Draggable Events</h4>
			<div class='fc-event'>My Event 1</div>
			<div class='fc-event'>My Event 2</div>
			<div class='fc-event'>My Event 3</div>
			<div class='fc-event'>My Event 4</div>
			<div class='fc-event'>My Event 5</div>
				<input type="radio" name="gender" value="insert" checked> 추가<br/>
	  			<input type="radio" name="gender" value="delete"> 삭제<br/>
	 			<input type="radio" name="gender" value="modify"> 변경 <br/>
	 			<input type="button" name="submit" id="btn_modify" value="수정">
	 			<input type="button" name="submit" id="btn_submit" value="확인">
		</div>

		<div id='calendar'></div>

		<div style='clear:both'></div>

	</div>
</body>
</html>
