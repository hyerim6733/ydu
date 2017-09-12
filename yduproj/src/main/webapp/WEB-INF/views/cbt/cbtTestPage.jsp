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
<form action="cbtMain.do#goResult.do" method="post">
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
						<td><input type="checkbox" name="test"
							value="1"> ${list.ex1 }</td>
						<td><input type="checkbox" name="test"
							value="2"> ${list.ex2 }</td>
						<td><input type="checkbox" name="test"
							value="3"> ${list.ex3 }</td>
						<td><input type="checkbox" name="test"
							value="4"> ${list.ex4 }</td>
						<td>${list.mark }</td>
					
				</tr>

		</table>
		<br />
			<a href="goTestPage.do?cbtCode=${list.cbtCode }&examId=${list.examId }">다음</a><br/>
		<br /> <input type="submit" value="제출">
	</div>
</form>