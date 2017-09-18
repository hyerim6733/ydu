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
			<td width="10%">교과목명</td>
			<td width="40%">${detail.classTitle}</td>
			<td width="10%">학수번호</td>
			<td>${detail.openClass}</td>
			</tr>
			<tr>
			<td>이수구분</td>
			<td>${detail.propertyNm}</td>
			<td>학점</td>
			<td>${detail.classCredit}</td>
			</tr>
			<tr>
			<td>수업시간 / 강의실</td>
			<td>${detail.classTime}( ${detail.classRoom} )</td>
			<td>교수명</td>
			<td>${detail.name}</td>
		</tr>
	</table>
	<br><br><br>
	<table border="1" width="80%" align="center">
		<tr><td width="10%">강의 개요</td><td>${detail.classCon}</td></tr>
	</table>
	<br><br>
	<table border="1" width="80%" align="center">
	<tr>
		<td colspan="2">주차 계획</td>
	</tr>
	<tr><td width="10%">1</td><td>${detail.planWeek1}</td></tr>
	<tr><td>2</td><td>${detail.planWeek2}</td></tr>
	<tr><td>3</td><td>${detail.planWeek3}</td></tr>
	<tr><td>4</td><td>${detail.planWeek4}</td></tr>
	<tr><td>5</td><td>${detail.planWeek5}</td></tr>
	<tr><td>6</td><td>${detail.planWeek6}</td></tr>
	<tr><td>7</td><td>${detail.planWeek7}</td></tr>
	<tr><td>8</td><td>${detail.planWeek8}</td></tr>
	<tr><td>9</td><td>${detail.planWeek9}</td></tr>
	<tr><td>10</td><td>${detail.planWeek10}</td></tr>
	<tr><td>11</td><td>${detail.planWeek11}</td></tr>
	<tr><td>12</td><td>${detail.planWeek12}</td></tr>
	<tr><td>13</td><td>${detail.planWeek13}</td></tr>
	<tr><td>14</td><td>${detail.planWeek14}</td></tr>
	<tr><td>15</td><td>${detail.planWeek15}</td></tr>
	<tr><td>16</td><td>${detail.planWeek16}</td></tr>
	</table>