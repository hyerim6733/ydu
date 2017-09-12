<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title> Yedam Univ. Exam </title>
<style>
table {
	padding-top:20px;
	padding-left:45px;
    border-collapse: collapse;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #7F7B7F;
    color: white;
}
</style>
<script>
</script>
</head>
<body>
 
 <div align="center">
<br>
<img src="image/logo.png">
<c:forEach items="${test}" var="t">
<table>

<tr>
	<th>시험명</th><td>${t.cbtTitle }</td>
	</tr><tr>
	<th>전공</th><td>${t.classTitle }</td>
	</tr><tr>
	<th>교수</th><td> ${t.name }</td>
	</tr><tr>
	<th>제출기한</th><td>${t.finalDate }</td>
	</tr><tr>
	<th>비고</th><td>${t.note }</td>
	</tr><tr>
	<th>제한시간</th><td>${t.limitTime }분</td>
</tr>

</table>
<br/><br/>
<a href="goTestPage.do?cbtCode=${t.cbtCode }">시험시작</a>
</c:forEach>

</div>

</body>
</html>