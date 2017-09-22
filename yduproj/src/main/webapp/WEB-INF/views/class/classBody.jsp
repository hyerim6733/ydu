<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <header class="w3-container" style="padding-top:22px; padding-left:30px; padding-left:30px; padding-bottom:22px">
 <script>
 	$(function() {
 	 	var cnt=0;
 	 	var classList = new Array();
 		$.ajax({
            type:"POST",
            url:"./currClass.do", //link
            dataType:"json",
            success:function(data){
                console.dir(data);
                classList=data;
                
                for(i=0;i<data.length;i++) {
					$("#tbody1").append("<tr><td>"
							+ data[i].openClass+"</td> <td>"
							+data[i].classTitle+"</td> <td>"
							+data[i].name+"</td> <td>"
							+data[i].classTime+"</td> <td>"
							+data[i].classRoom+"</td> <td>"
							+data[i].smallCodename+"</td> <td>"
							+data[i].studentLimit+"</td> <td>"
							+"<input type='button' class='btn_sub' id='"+i+"' value='수강포기'/>" + " </tr> ");		
				}
            },
            error : function(request, status, error) {
				alert(error);
			}
        });
 		
 		 $(document).on("click", ".btn_sub", function(){
				var sub = new Object();
			    var idx = this.id;
			    
				// classStatusVO에 저장
				var sugang = classList[idx].statusId;
			  
				if(confirm("수강을 포기하시겠습니까?")) {
			    	$.ajax({
						url : "./deleteClass.do",
						method : "post",
						type : "text",
						data : {"statusId":sugang},
						success : function() {
							alert("성공적으로 처리되었습니다.");
							console.log("성공");
						},
						error : function(request, status, error) {
							alert("error : "+error);
						}
					});
			    } else {
			    	console.log("수강포기안함");
			    }
		});
 	});
 </script>
 
 
 <h1><b>예담 대학교 수강신청 </b></h1>
 </header>
 <br><br><br><br>
<div align="center">
<h3><i class="fa fa-pagelines"></i>&nbsp;2017 2학기 수강신청 안내&nbsp;<i class="fa fa-pagelines"></i></h3>
<br><br>
<img src="/susu.JPG" alt="사진을 불러오지 못했습니다.">
<br><br><br>
	<h3>${stuInfo.name}님 수강신청내역</h3>
				<table width="80%" align="center" class="blueone">
					<thead>
						<tr>
							<th>과목번호</th>
							<th>과목명</th>
							<th>담당교수</th>
							<th>시간</th>
							<th>강의실</th>
							<th>분류</th>
							<th>수강정원</th>
							<th>수강포기</th>
						</tr>
					</thead>
						<hr/>
					<tbody id="tbody1">
								
					</tbody>		
				</table>

<h4>왼쪽 메뉴를 눌러 수강 신청을 해보세오.</h4>
</div>