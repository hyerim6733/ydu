<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>


<!-- 등록일에 자동 날짜 입력되게 하기 위해서  -->

<script>
	function setOrderColumn(orderColumn) {
		frm.orderColumn.value = orderColumn;
		frm.submit();
	}
</script>

<hr>
<h1>공지사항 전체 목록 테스트</h1>
<hr>

<!-- 게시판 목록 기본 -->
<div id="inner-panel">
	<form name="frm" action="<%=request.getContextPath()%>/notice.do" method="post">
		
		<!-- 검색기능 추가 -->
		<table>
			<tr>
				<td><select name="searchCondition">
						<option value="TITLE">제목</option>
						<option value="CONTENT">내용</option>
				</select> <input type="text" name="searchKeyword" /> <input type="submit"
					value="검색" /></td>
			</tr>
		</table>



		<a href="../insertNoticeForm.do" class="ajax-link">[등록]</a> 
		<br>
		<table>
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
			</tr>

		
			<c:forEach var="board" items="${notice1}">
				<tr>
					<td>${board.boardNo}</td>
					<td>${board.category}</td>
					<td><a href="../detailNotice.do?boardNo=${board.boardNo}" class="ajax-link">${board.title}</a></td>
					<td>${board.writer}</td>
					<td><fmt:formatDate value="${board.writeDate}" pattern="YYYY/MM/dd" /></td>
				</tr>
			</c:forEach>
	

		</table>
	</form>
</div>

<!-- 내부ajax링크 div id=inner-panel -->
<script src="../resources/js/common.js"></script>



