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
	 </script>
	 <form action="getClassesList.do">
	<table align="center" width="80%">
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
		
	
		
		<table width="80%" align="center" class="blueone">
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
			<c:forEach var="list" items="${classList}">
				<tr>
					<td>${list.openClass}</td>
					<td>${list.classTitle}</td>
					<td>${list.name }</td>
					<td>${list.classTime}</td>
					<td>${list.classRoom}</td>
					<td>${list.propertyNm} ( ${list.smallCodename} )</td>
					<td>${list.studentLimit}</td>
					<td><input type="button" class="btn_submit" value="수강신청" onclick=callback(${list})/></td>
				</tr>
			</c:forEach>
			
			<hr/>
			<h3>수강신청 하기</h3>
			<tbody id="tbody2">
				
			</tbody>
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
		function callback(para) {
			console.log(para);
			console.dir(para);
			console.dir(this);
			
		}
		
	</script>
	<%-- <%
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try{
			con = DBConnection.getCon();
			String sql="select * from class_list";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String classCode = rs.getString("class_code");
				String classTitle = rs.getString("class_title");
				String classCredit = rs.getString("class_credit");
				String major = rs.getString("major");
				Timestamp regdate = rs.getTimestamp("regdate");

%> --%>


</table>
</form>