<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<style>
td {
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
	<br>
	<br>
	<br>
	<table width="80%" align="center" class="blueone">
		<tr>
			<th width="15%">교과목명</th>
			<td width="40%">${detail.classTitle}</td>
			<th width="15%">학수번호</th>
			<td>${detail.openClass}</td>
			</tr>
			<tr>
			<th>이수구분</th>
			<td>${detail.propertyNm}</td>
			<th>학점</th>
			<td>${detail.classCredit}</td>
			</tr>
			<tr>
			<th>수업시간 / 강의실</th>
			<td>${detail.classTime}( ${detail.classRoom} )</td>
			<th>교수명</th>
			<td>${detail.name}</td>
		</tr>
	</table>
	<br><br><br>
	<table width="80%" align="center" class="blueone">
		<tr><th width="10%">강의 개요</th><td>${detail.classCon}</td></tr>
	</table>
	<br><br><br>
	<table width="80%" align="center" class="blueone"> 
	<tr>
		<th colspan="2" style="text-align:left">주차 계획</th>
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
	
	<br>
	<br>
	<br>
	<br>
	<br>