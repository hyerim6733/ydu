<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>



<!DOCTYPE html>
<html>


<head>

<c:set var="registerFlag" value="${empty board.boardNo ? '등록' : '수정'}"/>

<script src="../resources/ckeditor/ckeditor.js"></script>
<script>
	function frmCheck(){
		//내용을 입력여부 체크
		var editor_data = CKEDITOR.instances.contents.getData();
		if(document.frm.contents.value == ""){
			alter("내용을 입력하세요");
			return false;
		}
		return true;
	}	
	
	/* 글 등록 function */
	function fn_save() {	
		frm = document.getElementById("detailForm");	
	  	frm.action = "<c:url value="${registerFlag == '등록' ? '/insertNotice.do' : '/updateNotice.do'}"/>";
	    frm.submit();
	}
	
</script>

</head>
<body>



<hr>
<h3>공지사항 등록하기 (관리자용)</h3>
<hr>
<div id="inner-panel">
<form name="frm" action="../noticeInsert.do" method="post" onsubmit ="return frmCheck()">
	<%-- 
	<input type="hidden" name="boardNo" value="${board.boardNo }">
	 --%>	

	 
	<!-- 게시판코드 공지사항 = b1  hidden으로 값만 넘기기 -->
	<input type="hidden" name="boardCode" value="b1"><br /> 
	
	<!-- 작성자 관리자정보 받아와서 값 넘기기 -->
	<input type="hidden" name="writer" value="test"><br /> 
	
	<!-- 등록시 입력해야할 값은 제목,공지카테고리,필독체크,내용 -->
	제목<input size="60" type="text" name="title" value="${board.title }"><br /> 
	카테고리<select id="category" name="category">
			<option value="b10">일반</option>
			<option value="b11">학사</option>
			<option value="b12">취업</option>
			<option value="b13">장학</option>
			<option value="b14">봉사</option>
			<option value="b15">학술/행사</option>
		</select>
		<script>
		$("#category").val("${board.category}");
		</script>
	<!-- 공지사항 중 필독 공지 맨위에 보여줄  --> 
	필독<input type="checkbox" name="mandatory" value="y" <c:if test="${board.mandatory=='y'}"> checked="checked" </c:if>><br/>
	<textarea rows="10" cols="50" name="content" id="contents">${board.content }</textarea>
		<script>
		CKEDITOR.replace('contents',{
				filebrowserUploadUrl:'<%=request.getContextPath()%>/resources/ckeditor/fileUpload.jsp?'
					+'&up_dir=/resources/img'
					+'&temp_dir=c:/Temp'
					});
		
		// 전송을 위한 체크 함수 
		function form_save(form) { 
		editor.updateElement(); 
		}

		</script>
	<br>
	

	
	<input type="submit" value="저장"  />
		
</form>
</div>
<script src="../resources/js/common.js"></script>
</body>
</html>
