<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<style>
form {
	text-align: center;
}
</style>

	<br>
	<br>
	<br>
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
		<td width="30%">　　</td>
		<td align="center"><button>조회하기</button></td></tr>
		</table>
		
	
		<form>
		<table border="1"  align="center" width="80%">
			<tr>
				<td>과목번호</td>
				<td>과목명</td>
				<td>담당교수</td>
				<td>시간</td>
				<td>강의실</td>
				<td>분류</td>
				<td>수강정원</td>
				<td>수강신청</td>
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
					<td><button>수강신청</button></td>
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