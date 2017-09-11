<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<title>notice.jsp</title>
<style>
</style>
<script>
function setOrderColumn(orderColumn) {
	frm.orderColumn.value =  orderColumn;
	frm.submit();
}

</script>
</head>
<body>

	<hr>
	<h3>공지사항 테스트</h3>
	<hr>
	
<!-- 검색기능 추가 -->
<form name="frm" action="<%=request.getContextPath()%>/notice.do" method="post">	
	
	<table>
		<tr>
			<td><select name="searchCondition">
					<option value="TITLE">제목</option>
					<option value="CONTENT">내용</option>
			</select> <input type="text" name="searchKeyword" /> <input type="submit"
				value="검색" /></td>
		</tr>
	</table>

<!-- 게시판 목록 기본 -->
	<input type="button" value="삭제" onclick="selDel()" />
	<table>
		<tr>
			<th>선택</th>
			<th>번호 <input type="button" value="▲"
				onclick="setOrderColumn('boardId')"></th>
			<th>제목 <input type="button" value="▲"
				onclick="setOrderColumn('title')"></th>
			<th>작성자 <input type="button" value="▲"
				onclick="setOrderColumn('writer')"></th>
			<th>작성일자</th>
			<th>조회수</th>
			<th>첨부파일</th>
		</tr>


	 <c:forEach var="board" items="${notice}">
			<tr>
			    <td><input type="checkbox" name="boardIdList" value="${board.boardNo}"/>
				<td>${board.boardNo}</td>
				<td><a href="notice.do?boardNo=${board.boardNo}">${board.title}</a></td>
				
			</tr>
		</c:forEach>
	

	</table>
	</form>
	<a href="">등록</a>
</body>
</html>