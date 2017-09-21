<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<header class="w3-container" style="padding-top:22px; padding-left:30px; padding-left:30px; padding-bottom:22px">
    <h5><b><i class="fa fa-pagelines"></i> &nbsp; &nbsp; &nbsp; 시험제출 </b></h5>
</header>



<!-- 확인용  지워야 함 -->
${cbtList}


<div style="font-size:35px;">교수님 시험 목록 등록하는 페이지</div>
<br><br>
<div align="left">
<form>
<!--  코드 시퀀스로 코드 등록시 생성 -->
<!-- CBT_CODE <input type="text" name="ex1"><br/> -->

<!-- New_CLASS 테이블에서 값 받아옴 -->
OPEN_CLASS 
<select name="openClass">
<c:forEach items="${classList }" var="cbtList" >
<option value="${cbtList.openClass }">${cbtList.classTitle}</option>
</c:forEach>
</select><br/>
<!-- 교수님 입력 -->
CBT_TITLE	<input size="60" type="text" name="cbtTitle" value="${cbtList.cbtTitile}"><br/>
FINAL_DATE 	<input size="50" type="text" name="finalDate" value="${cbtList.finalDate}"><br/>
NOTE  		<input size="60" type="text" name="note" value="${cbtList.note}"><br/>
LIMIT_TIME 	<input size="20" type="text" name="limitTime" value="${cbtList.limitTime}"><br/>

<br/><br/>
<input type="button" value="등록" onclick ="frmCheck()" />

</form>



 
</div>
