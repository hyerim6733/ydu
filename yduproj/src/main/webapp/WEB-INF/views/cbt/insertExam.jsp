<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<header class="w3-container" style="padding-top:22px; padding-left:30px; padding-left:30px; padding-bottom:22px">
    <h5><b><i class="fa fa-pagelines"></i> &nbsp; &nbsp; &nbsp; 시험제출 </b></h5>
</header>

<style>
.left-box {
  background: #EFFBEF;
  float: left;
  width: 50%;
}
.right-box {
  background: #FBEFF2;
  float: right;
  width: 50%;
}
</style>

<div class="left-box" >
<div style="font-size:35px;">교수님 등록한 문제 보여주는 페이지 </div>
<form action="" >
	강의명:${cbtList.openClass}  시험코드: ${cbtList.cbtCode } <br/>
	<table width="80%" align="center" class="blueone">
	<tr>
	<th>번호:</th>
	<th>문제:</th>
	<th>보기1:</th>
	<th>보기2:</th>
	<th>보기3:</th>
	<th>보기4:</th>
	<th>정답:</th>
	<th>배점:</th>
	</tr>
	<c:forEach var="examPack" items="${examList}">
	<tr>
	<td>${examPack.examId }</td>
	<td>${examPack.question }</td>
	<td>${examPack.ex1 }</td>
	<td>${examPack.ex2 }</td>
	<td>${examPack.ex3 }</td>
	<td>${examPack.ex4 }</td>
	<td>${examPack.rightAnswer }</td>
	<td>${examPack.mark }</td>
	</tr>
</c:forEach>
	</table>
</form>
</div>

 
<div class='right-box' >
<div style="font-size:35px;">교수님 문제 출제하는 페이지</div>

<form action="submitExam.do" method="post">
	cbtCode<input type="text" name="cbtCode" value="${cBTExampackVO.cbtCode}"><br>
	 ↑이거 교수가 강의하는 거는 선택할 수 있게, 강의명으로 표시할 수 있는 select를 이용해야하는데....<br/>
	문제 <textarea rows="5" cols="60"  name="question" >${cbtExampack.question}</textarea><br/>
	정답(보기번호)<input type="radio" name="rightAnswer" value="1"> 1
 			 <input type="radio" name="rightAnswer" value="2"> 2
 			 <input type="radio" name="rightAnswer" value="3"> 3
 			 <input type="radio" name="rightAnswer" value="4"> 4 <br/>
	보기1 <input size="20" type="text" name="ex1" value="${cbtExampack.ex1}"><br/>
	보기2 <input size="20" type="text" name="ex2" value="${cbtExampack.ex2}"><br/>
	보기3 <input size="20" type="text" name="ex3" value="${cbtExampack.ex3}"><br/>
	보기4 <input size="20" type="text" name="ex4" value="${cbtExampack.ex4}"><br/>
	배점  <input size="20" type="text" name="mark" value="${cbtExampack.mark}"><br/>
	<input type="submit" value="저장">
	
</form>

</div>

