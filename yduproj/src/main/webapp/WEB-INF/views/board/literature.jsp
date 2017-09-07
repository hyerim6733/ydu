<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
</style>
<script>
	function setOrderColumn(orderColumn) {
		frm.orderColumn.value = orderColumn;
		frm.submit();
	}
</script>
</head>
<body>
	<hr>
	<h3>학사안내 테스트</h3>
	<hr>
	<!-- 검색기능 추가 -->
	<form name="frm" action="<%=request.getContextPath()%>/literature.do" method="post">

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


			<c:forEach var="board" items="${literature}">
				<tr>
					<td><input type="checkbox" name="boardIdList"
						value="${board.boardId}" />
					<td>${board.boardId}</td>
					<td><a href="literature.do?boardId=${board.boardId}">${board.title}</a></td>

				</tr>
			</c:forEach>


		</table>
	</form>
	<a href="">등록</a>
</body>
</html>