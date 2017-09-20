<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<style>
#droptarget  {
    float: left;
    width: 100px;
    height: 35px;
    margin: 10px;
    padding: 10px;
    border: 1px solid black;
}
</style>
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
		var nowDate = today();	// 현재날짜
		
		var selDate = null; // 드래그 선택 날짜
		var selTitle =null; // 드래그 선택 타이틀
		var statusID = null;
		
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
						callback(schedule);
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
		    	var scheduleIdx=0;
		    	
		        if (!confirm("일정을 수정하시겠습니까?")) {
		        	revertFunc();
		        }
		        
	        	var person = prompt("상담시간은? (1~5) ", "1");
	            if (person == null) {
	                alert("상담시간 미입력");
	            }else {
	            	console.log("person : "+person);
	            }
				selAction = "update";
				
	        
	        	sub = new Object();     // 객체 값 입력후 main배열의 0번 index에 셋팅
						
				sub['title'] = event.title;
				sub['statusId'] = statusID;
				sub['interDate'] = selDate;
				sub['property'] = "";
				sub['interId'] = ""; // 추가해야되는 일정은 statusID가 없음
				sub['st_code'] = ""; //user세션 추가
				sub['seq'] = person;
				sub['newDate'] = event.start.format();
				sub['action'] = selAction;
				
				main[cnt] = sub;

				console.log("action : "+sub.action +"\n newDate : "+sub.newDate+"\n interDate : "+sub.interDate +"\n title : "+sub.title + "\n seq : "+sub.seq);
				console.log("main action : "+main[cnt].action);
				console.log("main : "+main[cnt]);
				cnt+=1;
			
		    },
		    eventDragStart:function(event, jsEvent, ui, view ) {
		    	selDate = event.start.format(); 
		    	
		    	console.log("dragTitle : " + event.title);
		    	console.log("dragStart=========="+ event.start.format());
		    	
		    	// update 내용 초기화
		    	statusID = event.statusId;
		    	selTitle = event.title;
		    	selDate = event.start.format();
		    	
		    	console.dir(this);
		    	$(this).attr({ 
		    		ondragstart: 'dragStart(event)', 
		    		ondrag: 'dragging(event)', 
		    		draggable:'true'
		    	});
		    	console.log((this).ondragstart);
		    	console.log((this).ondrag);
		    	
		    },
		    eventReceive: function (event) {
		        selTitle = event.title;
		        console.log("receive");
		        console.dir(event);
		        
				sub['title'] = selTitle;
				main[cnt] = sub;
				 
				cnt+=1;
			},
			droppable: true, // this allows things to be dropped onto the calendar
			//insert
			drop: function( date, allDay, jsEvent, ui ) {
				if (!confirm("일정을 추가하시겠습니까?")) {

		        	revertFunc();
		        	
		        }
				
	        	var person = prompt("상담시간은? (1~5) ", "1");
	            if (person == null) {
	                alert("상담시간 미입력");
	            }else {
	            	console.log("person : "+person);
	            }
				selAction = "insert";
				
				sub = new Object();     // 객체 값 입력후 main배열의 0번 index에 셋팅
				
				console.log("drop에서 출력 selTitle : "+selTitle);
				
				sub['statusId'] = "";
				sub['interDate'] = "";
				sub['property'] = "";
				sub['interId'] = ""; // 추가해야되는 일정은 statusID가 없음
				sub['st_code'] = ""; //user세션 추가
				sub['seq'] = person;
				sub['newDate'] = date.format();
				sub['action'] = selAction;

			}
		});

		// 수정 버튼
		$("#btn_modify").click(function() {
			var selectAction = $(":input:radio:checked").val();
			jsonObject = {list:main};
			var p = JSON.stringify(main);
			
			 $.ajax({
					url : "../modifiedCalendar.do",
					method : "post",
					type : "json",
					contentType: "application/json",
					data : p,
					success : function() {
						console.log("성공");
						main = new Array();
					},
					error : function(request, status, error) {
						alert("error : "+error);
					}
				});
			// ajax 한번 더 실행
			
			
		});
		
		// 확인 버튼
		$("#btn_submit").click(function() {
			var selectAction = $(":input:radio:checked").val();
			
			console.log($(":input:radio:checked").val());	
		});
		
		function today(){
			   
	        var date = new Date();
	   
	        var year  = date.getFullYear();
	        var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
	        var day   = date.getDate();
	    
	        if (("" + month).length == 1) { month = "0" + month; }
	        if (("" + day).length   == 1) { day   = "0" + day;   }
	       
			return (year + month + day);  
	           
	    }
		// 이벤트 드래그 기능
		function dragStart(event) {
		    event.dataTransfer.setData("Text", event.target.id);
		}

		function dragging(event) {
		    document.getElementById("demo").innerHTML = "The p element is being dragged";
		}

		function allowDrop(event) {
		    event.preventDefault();
		}

		function drop(event) {
		    event.preventDefault();
		    var data = event.dataTransfer.getData("Text");
		    event.target.appendChild(document.getElementById(data));
		    document.getElementById("demo").innerHTML = "The p element was dropped";
		    console.log("drag실행");
		}
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
			<div class='fc-event'>상담신청</div>
			<div class='fc-event'>면접클리닉</div>
			<div class='fc-event'>취업상담</div>
			<div class='fc-event'>진로상담</div>
				<input type="radio" name="gender" value="insert" checked> 추가<br/>
	  			<input type="radio" name="gender" value="delete"> 삭제<br/>
	 			<input type="radio" name="gender" value="modify"> 변경 <br/>
	 			<input type="button" name="submit" id="btn_modify" value="수정">
	 			<input type="button" name="submit" id="btn_submit" value="확인">
	 			<div id="droptarget" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
	 			<br/><p id="demo">d</p>
		</div>

		<div id='calendar'></div>

		<div style='clear:both'></div>

	</div>
</body>
</html>
