<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <header class="w3-container" style="padding-top:22px; padding-left:30px; padding-left:30px; padding-bottom:22px">
 <script>
 	$(function() {
 		$.ajax({
            type:"POST",
            url:"./currClass.do", //link
            dataType:"json",
            success:function(data){
                var idx;
                console.dir(data);
                for(var i=0; i<data.length; i++){
                	
                }
            },
            error : function(request, status, error) {
				alert(error);
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
							<th>수강신청</th>
						</tr>
					</thead>
						<hr/>
					<tbody id="tbody1">
								
					</tbody>		
				</table>

<h4>왼쪽 메뉴를 눌러 수강 신청을 해보세오.</h4>
</div>