<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<title>prevNotice.jsp</title>
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
	<h3>미리보기 공지사항</h3>
	<hr>

<form name="frm" action="<%=request.getContextPath()%>/getBoardList.do" method="post">	

<!-- 검색기능 추가 -->



<!-- 	<table>
		<tr>
			<td><select name="searchCondition">
					<option value="TITLE">제목</option>
					<option value="CONTENT">내용</option>
			</select> <input type="text" name="searchKeyword" /> <input type="submit"
				value="검색" /></td>
		</tr>
	</table>
 -->
<!-- 게시판 목록 기본 -->
	<table>
		<tr>
			<th>번호</th>
			<th>구분 </th>
			<th>제목</th>
			<th>작성일자</th>
		</tr>
	 <c:forEach var="board" items="${prevnotice}">
			<tr>
			    <td><a href="prevnotice.do?boardNo=${board.boardNo}">${board.boardNo}</a></td>
				<td><a href="prevnotice.do?boardNo=${board.boardNo}">${board.title}</a></td>
				<td><a href="prevnotice.do?boardNo=${board.boardNo}">${board.content}</a></td>
				<td><a href="prevnotice.do?boardNo=${board.boardNo}">${board.writer}</a></td>
			</tr>
		</c:forEach>
	
</table>
	</form>
	
	<a href="">등록</a>
	
</body>
</html>