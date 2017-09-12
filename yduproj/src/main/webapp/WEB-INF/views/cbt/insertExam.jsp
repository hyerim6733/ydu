<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<header class="w3-container" style="padding-top:22px; padding-left:30px; padding-left:30px; padding-bottom:22px">
    <h5><b><i class="fa fa-pagelines"></i> &nbsp; &nbsp; &nbsp; 시험제출 </b></h5>
</header>

<div style="font-size:35px;">교수님 문제제출하는 페이지</div>

<br><br>
<div align="center">
<form action="cbtMain.do#submitExam.do" method="post">

	cbtCode<input type="text" name="cbtCode"> <br>
	↑이거 교수가 강의하는 거는 선택할 수 있게, 강의명으로 표시할 수 있는 select를 이용해야하는데....<br/>
	문제 <input type="textarea" name="question"><br/>
	답(보기번호)  <input type="radio" name="rightAnswer" value="1"> 1
 			 <input type="radio" name="rightAnswer" value="2"> 2
 			 <input type="radio" name="rightAnswer" value="3"> 3
 			 <input type="radio" name="rightAnswer" value="4"> 4 <br/>
	보기1 <input type="text" name="ex1"><br/>
	보기2 <input type="text" name="ex2"><br/>
	보기3 <input type="text" name="ex3"><br/>
	보기4 <input type="text" name="ex4"><br/>
	배점  <input type="text" name="mark"><br/>
	<input type="submit" value="저장">
</form> 
</div>
