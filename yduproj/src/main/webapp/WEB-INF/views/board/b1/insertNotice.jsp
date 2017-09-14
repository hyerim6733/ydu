<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate var="todayFmt" value="${today}" pattern="YYYY/MM/dd" />

<!DOCTYPE html>
<html>
<head>
<title>insertNotice.jsp</title>
<!-- 공지사항 등록 페이지 -->
 
<script src="../ckeditor/ckeditor.js"></script>
<script>
	function frmCheck(){
		//내용을 입력여부 체크
		var editor_data = CKEDITOR.instances.contents.getData();
		if(document.frm.contents.value == ""){
			alter("내용을 입력하세요");
			return false;
		}
		return true;
		//document.frm.contents.value
		//document.getElementById("contents")
	}		
</script>

</head>
<body>
<hr>
<h3>공지사항 등록하기 (관리자용)</h3>
<hr>

<form action="insertNotice.do" method="post" enctype="multipart/form-data">
	<select>
		<c:forEach items="${conditionMap}" var="map" >
		<option value="${map.key}">${map.value}</option>
		</c:forEach>
	</select><br/>
	<!-- BoardController 추가 해야함 -->
	<!-- 작성일 자동 넣기 , 번호 자동 넣기  -->
	작성일<input type="text" name="writeDate" value="${todayFmt}"/><br/>  
	작성자<input type="text" name="writer"><br/>
	제목<input type="text" name="title"><br/>
	카테고리<input type="text" name="category"><br/>
	내용<textarea name="content" id="contents"></textarea><br/>
		<script>
			CKEDITOR.replace('contents',{
					filebrowserUploadUrl:'<%=request.getContextPath()%>/ckeditor/fileUpload.jsp?'
						+'up_dir=/images'
						+'&temp_dir=c:/Temp'
						});
		</script>
		
		<input type="submit" value="저장"  />
		<script>
		window.alert("새로운 공지사항이 등록되었습니다.");
		</script>
		
	</form>
</body>

</html>