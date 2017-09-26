<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.ydu.biz.cbt.CBTComentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

.accordion.active, button.accordion:hover {
    background-color: #ddd;
}


div.panel {
    padding: 0 18px;
    background-color: #ebebeb;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}
</style>
<header class="w3-container" style="padding-top:22px; padding-left:30px; padding-bottom:22px">
    <h5><b><i class="fa fa-pagelines"></i> &nbsp; &nbsp; &nbsp; Q & A </b></h5>
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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 
    <script>
    	var coment = new Array(); 
		var sub = new Array();
		var data1 = new Array();
		
		$(document).ready(function() {
			$.ajax({ 
	            type:"POST",
	            url:"./getCbtComent.do", //link
	            dataType:"json",
	            success:function(data){
	              	console.dir(data);
	              	data1 = '${reply}';
	              	console.dir(data1);
	              	 for(i=0;i<data.length;i++) {
	              		   
	              		$("#tbody1").append("<tr class='accordion'><td>"
								+ data[i].COMENT_ID+"</td> <td>"
								+data[i].CONTENTS+"</td> <td>"
								+data[i].NAME+"</td> <td>"
							//	+data[i].SEPARATION+"</td> <td>"
								+data[i].USER_ID+"</td> <td>"+
								+ " </tr> ");
						$("#tbody1").append("<div class='panel'><p>"+"여기에 답변 넣기"+"</p></div>");
						
				/* 		for(j=0;j<data1.length;j++) {
							if(data1[j].COMENT_ID==i) {
								$("#tbody1").append("<div class='panel'><p>"+"${data1[i].CONTENTS}"+"</p></div>");
							}
							
							if(j == (data1.length-1) ) {
								$("#tbody1").append("<div class='panel'>"+"<input type='text' class='comentInput'/>"+"<input type='button' class='btn_reply'/>"+"</div>");
							} 
						}
						 */
						/* <span class='accordion'>Section 1</span>
						<div class='panel'>
						  <p>1</p> <p>1</p> <p>1</p>
						</div> */
	              	}
	            },
	            error : function(request, status, error) {
					alert(error);
				}
	        });
			
			$(document).on("click", "tr", function(){
				var acc = document.getElementsByClassName("accordion");
				var i;

				for (i = 0; i < acc.length; i++) {
				  acc[i].onclick = function() {
				    this.classList.toggle("active");
				    var panel = this.nextElementSibling;
				    if (panel.style.maxHeight){
				      panel.style.maxHeight = null;
				    } else {
				      panel.style.maxHeight = panel.scrollHeight + "px";
				    } 
				  }
				}
			});
			// Run beauty tables plugin on every table with class .beauty-table
			$('.beauty-table').each(function(){
				// Run keyboard navigation in table
				$(this).beautyTables();
				// Nice CSS-hover row and col for current cell
				$(this).beautyHover();
			});
			// Attach to click action for create JSON data from tables.
			$('.beauty-table-to-json').on('click', function(e){
				e.preventDefault();
				var table = $(this).closest('.box').find('table');
				Table2Json(table);
			});
			// Add Drag-n-Drop feature
			WinMove();
			
			$("#btn_submit").click(function() {
				sub['comentId'] 	= "";
				sub['separation']	= '${sessionScope.userId.separation}';
				sub['userId'] 		= '${sessionScope.stuInfo.studentCode}';
				sub['contents'] 	= $(".comentInput").val();
				sub['re_id'] 		= '${sessionScope.stuInfo.name}'; 
				console.dir(sub);
				main=sub;
				$.ajax({
		            type:"POST",
		            url:"./insertCbtComentRe.do", //link
		            dataType:"json", 
		            data:main,
		            success:function(data){
		              	console.dir(data);
		              	sub = new object();
						location.reload();  
		            },
		            error : function(request, status, error) {
						location.reload(); 
					}
		        });
			});
			
			$(".btn_reply").click(function() {
			//	var aaa = this.parentNode.nodeValue;
				sub['comentId'] 	= "";
				sub['separation']	= '${sessionScope.userId.separation}';
				sub['userId'] 		= '${sessionScope.stuInfo.studentCode}';
				sub['contents'] 	= $("#contents").val();
				sub['name'] 		= '${sessionScope.stuInfo.name}'; 
				console.dir(sub);
				main=sub;
				$.ajax({
		            type:"POST",
		            url:"./insertCbtComent.do", //link
		            dataType:"json", 
		            data:main,
		            success:function(data){
		              	console.dir(data);
		              	sub = new object();
						location.reload();  
		            },
		            error : function(request, status, error) {
						location.reload(); 
					}
		        });
			});
		});
		
	</script>
</header>
<br><br><br>
<div align="center">
<table>

</table>
ex) 교수님 제출기간 초과하면 어떻게 되나요?
 <br>  답변 : 감점<br/><br/><hr color="black">
  
   코멘트남기기<input type="text" name="content" id="contents"> 
   <button type="submit" class="btn btn-warning" id="btn_submit">등록</button>
   <br/><br/>

   
   <div class="row">
	<div class="col-xs-12">
		<div class="box">
			
			
				<table class="table beauty-table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>내용</th>
							<th>이름</th> 
							<th>작성자</th>
							<th>답변상태</th>
						</tr>
					</thead>
					<tbody id="tbody1">
					
					</tbody>
				</table>
		</div>
	</div>
</div>
   
   
  <table>
  	<tr>
  		<th>글쓴이</th><td>댓글내용 안녕~</td>
  	</tr>
  </table>
</div>