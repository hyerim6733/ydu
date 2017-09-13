<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
<form action="goTestPage.do" method="post">
	<div align="center">
		<br> <b>시험</b> <br />
		<br />
		<br />
		<br />

		<table>
			<tr>
				<th align="center">문제</th>
				<th>1</th>
				<th>2</th>
				<th>3</th>
				<th>4</th>
				<th>배점</th>
			</tr>
			
				<tr>
						<td>${list.question }</td>
						<td><input type="radio" name="rightAnswer"
							value="1"> ${list.ex1 }</td>
						<td><input type="radio" name="rightAnswer"
							value="2"> ${list.ex2 }</td>
						<td><input type="radio" name="rightAnswer"
							value="3"> ${list.ex3 }</td>
						<td><input type="radio" name="rightAnswer"
							value="4"> ${list.ex4 }</td>
						<td>${list.mark }</td>
					
				</tr>

		</table>
		<br />
			
		<br /> 
		<input type="hidden" name="cbtCode" value="${list.cbtCode }">
		<input type="hidden" name="cnt" value=${cnt }>
		<input type="hidden" name="examId" value="${list.examId }">
		<button class="btn">다음</button>
	</div>
</form>