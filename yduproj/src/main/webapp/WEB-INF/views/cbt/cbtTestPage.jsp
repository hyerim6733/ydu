<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<style>
table {
	padding-top: 20px;
	padding-left: 45px;
	border-collapse: collapse;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #7F7B7F;
	color: white;
}
</style>
<header class="w3-container"
	style="padding-top: 22px; padding-left: 30px">
	<h5>
		<b><i class="fa fa-pagelines"></i> &nbsp; &nbsp; &nbsp; 시험치세요~ </b>
	</h5>
</header>

<table>
	<tr>
		<th align="center">번호</th>
		<th>문제</th>
		<th>1</th>
		<th>2</th>
		<th>3</th>
		<th>4</th>
	</tr>
	<c:forEach var="list" items="${examList}">
		<tr>
			<td>1123</td>
			<td>${list.question }</td>
			<td>${list.ex1 }</td>
			<td>${list.ex2 }</td>
			<td>${list.ex3 }</td>
			<td>${list.ex4 }</td>
		</tr>
	</c:forEach>

</table>
