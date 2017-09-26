<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<header class="w3-container" style="padding-top:22px; padding-left:30px; padding-left:30px; padding-bottom:22px">
    <h5><b><i class="fa fa-pagelines"></i> &nbsp; &nbsp; &nbsp; 결과목록 </b></h5>
</header>

<div style="font-size:35px;">학생이 응시한 시험 결과 출력 페이지</div>
<c:forEach var="result" items="${Result }">
<hr/>
과목명 :  ${result.classTitle} <br>
시험명 : ${result.cbtTitle} <br>
점수 :  ${result.score} <br>
시험응시시간 :  ${result.testDate} <br>
</c:forEach>
<hr/>