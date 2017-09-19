<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
 <header class="w3-container" style="padding-top:22px; padding-left:30px; padding-left:30px; padding-bottom:22px">
 <h2><b>강의 계획서</b></h2>
 </header>
<style>
form {
text-align : center;
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
<script>
function page_reload() {
	location.reload();
}
</script>
	<br>
	<br>
	<br>
	<tr>
	<form action="getClassesList.do">
			<table width="80%" align="center">
			<td align="right">
			<select name="searchCondition">
				<option value="openClass">과목번호</option>
				<option value="classTitle">과목명</option>
			</select>
			<input type="text" name="searchKeyword"/>
			<input type="submit" value="조회"/>
			</table>

	
	<table width="80%" align="center" class="blueone">
		
		<tr>
			<th>과목번호</th>
			<th>과목명</th>
			<th>담당교수</th>
			<th>시간</th>
			<th>강의실</th>
			<th>분류</th>
			<th>수강정원</th>
		</tr>
		<c:forEach var="list" items="${classList}"> 
		<tr>
			<td>${list.openClass}</td>
			<td><a href="classMain.do#getClassDetail.do?openClass=${list.openClass}" onclick="page_reload()">${list.classTitle}</a></td>
			<td>${list.name }</td>
			<td>${list.classTime}</td>
			<td>${list.classRoom}</td>
			<td>${list.propertyNm} ( ${list.smallCodename} )</td>
			<td>${list.studentLimit}</td>
			
		</tr>
		</c:forEach>
		<script>
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
	</script>
	</table>
	</form>
