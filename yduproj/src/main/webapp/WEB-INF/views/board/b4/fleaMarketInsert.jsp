<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    


    
<!DOCTYPE html>
<html>



<head>
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
		
</script>
</head>
<body>

<hr>
<h3>벼룩시장 등록하기 (테스트용)</h3>
<hr>

<form name="frm" action="../insertFleaMarket.do" method="post" enctype="multipart/form-data" onsubmit ="return frmCheck()">
	<input type="hidden" name="action" value="insert">		


	<!-- 
	작성일<input type="text" name="writeDate" value="${todayFmt}"/>
	 -->

	<!-- 게시판코드 벼룩시장 = b4  hidden으로 값만 넘기기 -->
	<input type="hidden" name="boardCode" value="b4"><br /> 
	
	<!-- 작성자 관리자정보 받아와서 값 넘기기 -->
	<input type="hidden" name="writer" value="test"><br /> 
	
	<!-- 등록시 입력해야할 값은 제목,벼룩시장카테고리,내용 -->
	
	제목<input size="60" type="text" name="title"><br /> 
	카테고리<select id="category" name="category">
			<option value="b40">팝니다</option>
			<option value="b41">삽니다</option>
		</select>	
	<br /> 
	
	
	<br/>  
	<textarea rows="10" cols="50" name="content" id="contents"></textarea>
		
		<script>
			CKEDITOR.replace('contents',{
					filebrowserUploadUrl:'<%=request.getContextPath()%>/resources/ckeditor/fileUpload.jsp?'
						+'up_dir=/resources/img'
						+'&temp_dir=c:/Temp'
						});

			
			function form_save(form) { 
			editor.updateElement(); 
			}
			
			
		</script>
		<br>
		<input type="submit" value="저장"  />
		
	</form>
	
</body>
</html>