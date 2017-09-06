<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
table {
	border:1px;
}
</style>
<script>
</script>
</head>
<body>

<table>

<tr>
	<th>고유번호</th>
	<th>강의코드</th>
	<th>교수코드</th>
	<th>시험명</th>
	<th>제출기한</th>
</tr>
<c:forEach var="list" items="${cbtList}">
<tr>
	<td>${list.cbtCode }</td>
	<td>${list.classCode }</td>
	<td>${list.professorCode }</td>
	<td>${list.cbtTitle }</td>
	<td>${list.finalDate }</td>
</tr>
</c:forEach>

</table>

</body>
</html>