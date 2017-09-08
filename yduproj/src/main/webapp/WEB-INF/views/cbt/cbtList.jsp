<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}
</style>
<header class="w3-container" style="padding-top:22px; padding-left:30px">
    <h5><b><i class="fa fa-pagelines"></i> &nbsp; &nbsp; &nbsp; 목록 </b></h5>
</header>
<table style="padding-top:30px; padding-left:45px;">

<tr>
	<th align="center">고유번호</th>
	<th>시험명</th>
	<th>전공</th>
	<th>교수</th>
	<th>제출기한</th>
</tr>
<c:forEach var="list" items="${cbtList}">
<tr>
	<td>${list.cbtCode }</td>
	<td>${list.cbtTitle }</td>
	<td>${title }</td>
	<td>${name }</td>
	<td>${list.finalDate }</td>
</tr>
</c:forEach>

</table>
