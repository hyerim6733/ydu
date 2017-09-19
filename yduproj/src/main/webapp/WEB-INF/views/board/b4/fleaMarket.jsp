<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<script>
function setOrderColumn(orderColumn) {
	frm.orderColumn.value =  orderColumn;
	frm.submit();
}
</script>

<hr>
<h1>벼룩시장 전체 목록 테스트</h1>
<hr>

<!-- 게시판 목록 기본 -->
<div id="inner-panel">
	<form name="frm" action="<%=request.getContextPath()%>/fleaMarket.do" method="post">

		<!-- 검색기능 추가 -->
		<table>
			<tr>
				<td><select name="searchCondition">
						<option value="TITLE">제목</option>
						<option value="WRITER">작성자</option>
						<option value="CONTENT">내용</option>
				</select> <input type="text" name="searchKeyword" /> <input type="submit"
					value="검색" /></td>
			</tr>
		</table>



		<a href="../insertFleaMarketForm.do" class="ajax-link">[등록]</a> <br>
		<table>
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
			</tr>


			<c:forEach var="board" items="${fleaMarket1}">
				<tr>
					<td><a href="fleaMarket.do?boardNo=${board.boardNo}">${board.boardNo}</a></td>
					<td><a href="fleaMarket.do?boardNo=${board.boardNo}">${board.title}</a></td>
					<td><a href="fleaMarket.do?boardNo=${board.boardNo}">${board.content}</a></td>
					<td><a href="fleaMarket.do?boardNo=${board.boardNo}">${board.writer}</a></td>
					<td><a href="fleaMarket.do?boardNo=${board.boardNo}">${board.writeDate}</a></td>
				</tr>
			</c:forEach>


		</table>

	</form>
</div>
<script src="../resources/js/common.js"></script>
