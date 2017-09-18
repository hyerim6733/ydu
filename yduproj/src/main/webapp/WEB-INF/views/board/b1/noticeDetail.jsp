<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 등록일에 자동 날짜 입력되게 하기 위해서  -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>




<!DOCTYPE html>
<html>
<head>

</head>
<body>
<div id="inner-panel">
<!-- 테스트 코멘트 --> 
<hr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
<h1>  상세보기예용 홍홍홍</h1>
<hr>
<br/><br/>

번호 : ${board.boardNo} <br/>
작성자 :  ${board.writer} <br/>
작성일 :<fmt:formatDate value="${board.writeDate}" pattern="YYYY/MM/dd" /> <br/>
공지구분 : ${board.category}
<!-- 카테고리 값 받아와서 한글 구분 보여주기 -->
<br/><br/>
[제목] <br/>
${board.title} <br/>
<br/><br/>

[내용]
<br/> ${board.content} <br/>


<br/><br/>
<br/><br/>
<a href="../updateNoticeForm.do?boardNo=${board.boardNo}" class="ajax-link">[수정]</a>
<br/><br/>
<a href="../notice.do" class="ajax-link">[목록]</a>
<br/><br/>


</div>
<!-- 내부ajax링크 div classs=ajax-link -->
<script src="<c:url value="/resources/plugins/jquery/jquery-2.1.0.min.js"/>"></script>
<script src="<c:url value="/resources/js/common.js"/>"></script>	
</body>
</html>
