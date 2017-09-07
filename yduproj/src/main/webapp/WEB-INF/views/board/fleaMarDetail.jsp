<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
</style>
<script>
</script>
</head>
<body>
<!-- 테스트 코멘트 -->                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
<h1>벼룩시장  상세페이지 만들꺼예용 홍홍홍</h1>

<form name="frm" action="product_control.jsp"onsubmit ="return frmCheck()">
	<input type="hidden" name="action" value="insert">
		상품명<input type="text" name="pdName"><br/>
		재고수량<input type="text" name="pdCnt">개<br/>
		가격<input type="text" name="pdPrice">원<br/>
		등록일<input type="text" name="pdDate" value="${ todayFmt}"/><br/>  
		이미지  <input type="text" name="pdImg">
			<input type="button" value="파일첨부" onclick="win_open()"/><br/>
		상세설명<textarea rows="10" cols="50" name="pdDetail" id="contents"></textarea>
		

</body>
</html>