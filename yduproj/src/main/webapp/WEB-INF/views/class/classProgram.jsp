<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<style>
form {
text-align : center;
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
	<br>
	<br>
	<br>
	<tr>
	<form>
			교과과정 <select>
					<option value=0>-선택하세요-</option>
					<option value=1>학부</option>
					<option value=2>대학원</option>
			</select>
			교과영역<select>
					<option value=3>-선택하세요-</option>
					<option value=4>전공</option>
					<option value=5>교양</option>
					<option value=6>교직</option>
			</select>
			<th>대학<select name="faculty">
					<option>-선택하세요-</option>
					<option value="1000">과학기술대학</option>
					<option value="2000">인문대학</option>
					<option value="3000">사범대학</option>
			</select>
			학부전공
			<select name="faculty2">
				<option>-선택하세요-</option>
				<c:forEach var="flist" items="${facultyList}">
				<option></option>
				</c:forEach>
			</select>
			<!-- 수업년도<select>
			<option value=12>-선택하세요-</option>
			<option value=13>2015</option>
			<option value=14>2016</option>
			<option value=15>2017</option>
			</select> -->
			
			<button>조회하기</button>
	<br>
	<br>
	
	<table border="1" width="80%" align="center">
		
		<tr>
			<td>과목번호</td>
			<td>과목명</td>
			<td>담당교수</td>
			<td>시간</td>
			<td>강의실</td>
			<td>분류</td>
			<td>수강정원</td>
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
