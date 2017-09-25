<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<header class="w3-container" style="padding-top:22px; padding-left:30px; padding-left:30px; padding-bottom:22px ">
    <h5><b><i class="fa fa-pagelines"></i> &nbsp; &nbsp; &nbsp; 목록 </b></h5>
</header>

<table>

<tr>
	<th align="center">고유번호</th>
	<th>시 험 명</th>
	<th>전공</th>
	<th>교수</th>
	<th>제출 기한</th>
	<c:if test="${userId.separation == 'pro'}">
	<th>문제 출제</th>
	</c:if>
	<c:if test="${userId.separation == 'stu'}">
	<th>응시 상황</th>
	</c:if>
	
</tr>
<c:forEach var="list" items="${cbtList}">
<tr>
	<td>${list.cbtCode }</td>
	<td><a href="javascript:scoreCheck('${list.score}','${list.cbtCode}')">${list.cbtTitle }</a></td>
	<td>${list.classTitle } </td>
	<td>${list.name }</td>
	<td>${list.finalDate }</td>
	<c:if test="${userId.separation == 'pro'}">
	<td>
	<a href="#submitExamForm.do?cbtCode=${list.cbtCode}" onclick="page_reload()"><input type="button" value="문제 등록" ></a></td>
	</c:if>
<c:if test="${userId.separation == 'stu'}">
	<td>
	<c:if test="${list.score == 'y'}">
	<a href="#resultExam.do?cbtCode=${list.cbtCode}" onclick="page_reload()">응시불가능</a>
	</c:if>
	<c:if test="${list.score == 'n'}">응시가능</c:if>
	</td>
</c:if>
</tr>
</c:forEach>

</table>

<!-- 시험 등록 수정중 -->
<br><br>
<c:if test="${userId.separation == 'pro'}">
<a href="#submitExamListForm.do" onclick="page_reload()">[시험 등록]</a>
</c:if>
<script>
function page_reload() {
	location.reload();
}

function scoreCheck(score,cbtCode){
	if(score == 'n'){
	location.href='goTestInfo.do?cbtCode='+cbtCode;
	}else{
		alert("재응시는 불가능 합니다.");
	}
	
}
</script>