<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<style>
td {
	text-align: center;
}
</style>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<table border="1" width="80%" align="center">
		<tr>
			<th>교과과정 <select>
					<option value=0>-선택하세요-</option>
					<option value=1>학부</option>
					<option value=2>대학원</option>
			</select></th>
			<th>교과영역<select>
					<option value=3>-선택하세요-</option>
					<option value=4>전공</option>
					<option value=5>교양</option>
					<option value=6>교직</option>
			</select></th>
			<th>대학<select id="" name="">
					<option value="7">-선택하세요-</option>
					<option value=8>과학기술대학</option>
					<option value=9>인문대학</option>
					<option value=10>사범대학</option>
			</select></th>
			<th>학부전공<select>
					<option value=11>-선택하세요-</option>
			</select></th>
			<th></th>
			<th></th>
			<th></th>
			<th><button>조회하기</button></th>
		</tr>
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
			<td>${list.smallCodename}</td>
			<td>${list.studentLimit}</td>
			<td><button>수강신청</button></td>
		</tr>
		</c:forEach>
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