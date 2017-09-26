<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
 <header class="w3-container" style="padding-top:22px; padding-left:30px; padding-left:30px; padding-bottom:22px">
 <h2><b>수강 신청</b></h2>
 </header>
<style>
form {
	text-align: center;
}

body { background: #fff; }
.blueone {
  border-collapse: collapse;
}  
.blueone th {
  padding: 10px;
  color: #168;
  border-bottom: 3px solid #168;
  text-align: center;
}
.blueone td {
  color: #669;
  padding: 10px;
  border-bottom: 1px solid #ddd;
}
.blueone tr:hover td {
  color: #004;
}
</style>

<br>
	<br>
	<br>
	<script >
		var classList = null;
		var insertList = new Array();
		var main = new Array();
		var dupChk =  Array.apply(null, new Array(100)).map(Number.prototype.valueOf,0);
		var cnt=0;
	    var cancelCnt=0;
		
		$(document).ready(function() {

			/* 	
			$("select[name='faculty']").change(function() { // 셀렉트 박스가 체인지 될때 이벤트  
				var valX = $(this).val(); // 현재 선택된 값  
				var url = "./getsmallList.do"; // 데이터를 호출할 URL  
				$.ajax({
					url : url,
					type : "POST",
					data : {code:valX},
					dataType : "json",
					success : function(data) {
						$("select[name='faculty2']").empty()
						$("select[name='faculty2']").append('<option> -선택하세요- </option>')
						$.each(data, function(i, d) {
							$("select[name='faculty2']").append('<option value="' + d.smallCode + '">' + d.smallCodename + '</option>');
						});
					}
				});
			});
			function disable(dsc) {
				var result = document.getElementById("menu_sel").value;
				
				if(result == '1'){
					document.getElementById("text_select").disabled = true;
					document.getElementById("text_select2").disabled = true;
				}else{
					document.getElementById("text_select").disabled = false;
					document.getElementById("text_select2").disabled = false;
				}
			}
			 */
			$.ajax({
				url : "./setClass.do",
				method : "post",
				type : "json",
				success : function(data) {
					classList = data;
					callback(classList);
				},
				error : function(request, status, error) {
					alert("error : " + error);
				}
			});
			
			// tab 창에 테이블 추가..
			function callback(data) {
			//	$("tbody").html("");
				
				for(i=0;i<data.length;i++) {
					//ID줘서 지정해주기.. 수정해야됨!
					$("#tbody1").append("<tr><td>"
							+ data[i].openClass+"</td> <td>"
							+data[i].classTitle+"</td> <td>"
							+data[i].name+"</td> <td>"
							+data[i].classTime+"</td> <td>"
							+data[i].classRoom+"</td> <td>"
							+data[i].PROPERTY+"("+data[i].smallCodename+")</td> <td>"
							+data[i].studentLimit+"</td> <td>"
				//			+"<button>수강신청</button>" + " </tr> ");
					// 클릭이 왜 안될까?? --------------- 수정중 -----------------------
							+"<input type='button' class='btn_sub' id='"+i+"' value='수강신청'/>" + " </tr> ");
					console.dir(data[i]);
		
		
				}
			}
			 
			
			$(document).on("click", ".btn_cancel", function(){
				var idx = this.id;
				var trID = "tr"+idx;
				console.log(idx);
				console.log(trID);
			//	dupChk[idx]=0;
				$("#"+trID).remove();
				console.log("idx-1 : "+idx-1);
				console.dir("main이다 : "+main);
				console.log("main[idx] check : "+main[idx-1].check);
				dupChk[main[idx-1].check]=0;  
				main[idx-1]="";
				console.dir(main); 
				console.log(dupChk); 
			});
			 $(document).on("click", ".btn_sub", function(){ 
					var sub = new Object();
				    var idx = this.id;

				    cancelCnt++;
				    if(dupChk[idx]==0) { 
					    dupChk[idx]=1;
					    $("#tbody2").append("<tr id='tr"+cancelCnt+"'><td>"
								+ classList[idx].openClass+"</td> <td>"
								+classList[idx].classTitle+"</td> <td>"
								+classList[idx].name+"</td> <td>"
								+classList[idx].classTime+"</td> <td>"
								+classList[idx].classRoom+"</td> <td>" 
								+classList[idx].PROPERTY+"("+classList[idx].smallCodename+")</td> <td>"
								+classList[idx].studentLimit+"</td> <td>"
								+"<input type='button' class='btn_cancel' id='"+cancelCnt+"' value='신청취소'/>"
								
								+ "</tr> ");
					    
					// classStatusVO에 저장
						sub['classCode'] = "";
						sub['stCode'] = '${sessionScope.stuInfo.studentCode}';
						sub['openClass'] = classList[idx].openClass; //openClass써서 classNo 구해서 insert 할 것..
						sub['repeat'] = "N";
						sub['classGrade'] = ""; 
						sub['classTime'] = classList[idx].classTime; 
						sub['classTitle'] = classList[idx].classTitle;
						sub['property'] = classList[idx].smallCodename;
						sub['check'] = idx;
						
						main[cnt++] = sub;
						console.dir(main);
						console.log(dupChk); 
				    } else{
				    	alert("이미 꾸러미에 추가했습니다.");
				    }
			});
			
			$("#btn_complete").click(function() { 
				for(i=0;i<cnt;i++) {  
					if(main[i]=="") {
						console.log(i); 
						main.splice(i, 1);  
						console.dir(main); 
						i=0;
					} else if(main[0]=="") {
						main.splice(0,1);
					}
				}  
				
				if(main.length==0) { alert("최소한 1개 이상의 과목을 선택해주세요."); }
				else {
					var p = JSON.stringify(main); 
					  
					$.ajax({
						url : "./insertClass.do",
						method : "post",
						type : "json",
						contentType: "application/json", 
						data : p,
						success : function(data) {
							console.log("호출 성공");
							console.dir(main);
							
							if(data=="success") {
								alert("수강신청 되었습니다.");
								main = new Array(); 
								location.reload(); 
							}
							else if(data=="duplication") {
								alert("중복되는 시간이 있습니다.\n확인 후 다시 시도해주세요");
							} 
						}, 
						error : function(request, status, error) {
							alert("error : "+error);
						}
					}); 
				}
			});
			 
			 
		});
																													
																															
		
	 </script>
	<%-- <table align="center" width="80%">
		<tr><td width="15%">교과과정
		<select>
			<option>-선택하세요-</option>
			<option>학부</option>
			<option>대학원</option>
		</select></td>
		<td width="15%">교과영역
		<select id="menu_sel" onchange="disable()">
			<option>-선택하세요-</option>
			<option value="0" <%="0".equals(request.getParameter("menu_sel")) ? "selected" : "" %>>전공</option>
			<option value="1" <%="1".equals(request.getParameter("menu_sel")) ? "selected" : "" %>>교양</option>
			<option value="2" <%="2".equals(request.getParameter("menu_sel")) ? "selected" : "" %>>교직</option>
		</select></td>
		
		<td width="13%">대학
		<select name="faculty" id="text_select" disabled="true">
			<option>-선택하세요-</option>
			<option value="1000">자연과학대학</option>
			<option value="2000">인문대학</option>
			<option value="3000">사회대학</option>
		</select></td>
		
		<td width="15%">학부전공
		<select name="faculty2" id="text_select2" disabled="true">
			<option>-선택하세요-</option>
			<c:forEach var="flist" items="${facultyList}">
				<option></option>
			</c:forEach>
		</select></td>
		<td align="right">
		<select name="searchCondition">
			<option value="openClass">과목번호</option>
			<option value="classTitle">과목명</option>
		</select>
		<input type="text" name="searchKeyword"/>
		<input type="submit" value="조회"/></td></tr>
		
		</table>
		 --%>
	<body>
		<h3>수강신청 하기</h3>
		
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
	 
	<br/><br/>
	<tr><td>수강꾸러미</td><td><input type="button" id="btn_complete" value="신청하기"/></td></tr>
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
				<th>신청취소</th>
			</tr>
		</thead>
		<tbody id="tbody2">
			
		</tbody>
	</table>

</body>