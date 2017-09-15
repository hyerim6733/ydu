<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>

</head>
<body>
<!-- 테스트 코멘트 --> 
<hr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
<h1>벼룩시장  상세보기예용 홍홍홍</h1>
<hr>
<br/><br/>
<div id="inner-panel">
번호 : ${board.boardNo} <br/>
작성자 :  ${board.writer} <br/>
작성일 :  ${board.writeDate} <br/>
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
<script src="../resources/js/common.js"></script>
</body>
</html>
