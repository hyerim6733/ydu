<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<title>fleaMarInsert.do</title>

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
	}
		
</script>
</head>
<body>
<!-- 벼룩시장 글쓰기 페이지 -->
<hr>
<h3>벼룩시장 글쓰기 (테스트용)</h3>
<hr>


	<form name="frm" 
	action="<%=request.getContextPath()%>/fleaMaket.do" method="post"
	onsubmit ="return frmCheck()">
	<input type="hidden" name="action" value="insert">
		글제목<input type="text" name="title"><br/>
		작성자<input type="text" name="writer"><br/>
		작성일<input type="text" name="writeDate" value="${todayFmt}"/><br/>  
		내용<textarea rows="10" cols="50" name="content" id="content"></textarea>
		<script>
			CKEDITOR.replace('content',{
					filebrowserUploadUrl:'<%=request.getContextPath()%>/ckeditor/fileUpload.jsp?'
						+'up_dir=/images'
						+'&temp_dir=c:/Temp'
						});
		</script>
		<input type="submit" value="저장"  />
		
		<script>
		window.alert("벼룩시장에 글이 등록되었습니다.");
		</script>
		
	</form>
</body>
</html>