<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<title>noticeAll.jsp</title>
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
	<h3>공지사항 전체 목록 테스트</h3>
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
	<a href="">[등록]</a>
	<table>
		<tr>
			<th>번호</th>
			<th>제목 </th>
			<th>내용 </th>
			<th>작성자 </th>
			<th>작성일자</th>
		</tr>


	 <c:forEach var="board" items="${notice1}">
			<tr>
			    <td><a href="notice.do?boardNo=${board.boardNo}">${board.boardNo}</a></td>
				<td><a href="notice.do?boardNo=${board.boardNo}">${board.title}</a></td>
				<td><a href="notice.do?boardNo=${board.boardNo}">${board.content}</a></td>
				<td><a href="notice.do?boardNo=${board.boardNo}">${board.writer}</a></td>
			</tr>
		</c:forEach>
	

	</table>
	</form>
	<a href="">등록</a>
</body>
</html>