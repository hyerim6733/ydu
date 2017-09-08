<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<title>fleaMarket.jsp</title>
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
<!-- 테스트 코멘트 -->                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
<h1>벼룩시장 만들꺼예용 홍홍홍</h1>

<!-- 검색기능 추가 -->
<form name="frm" action="<%=request.getContextPath()%>/fleaMarket.do" method="post">	
	<table>
		<tr>
			<td>
			<select name="searchCondition">
					<option value="TITLE">제목</option>
					<option value="WRITER">작성자</option>
					<option value="CONTENT">내용</option>
			</select> 
			<input type="text" name="searchKeyword" /> 
			<input type="submit" value="검색" />
			</td>
		</tr>
	</table>
<!-- 게시판 목록 기본 -->
<a href="">등록(글쓰기)</a>
	<table>
		<tr>
			<th>번호 <input type="button" value="▲" onclick="setOrderColumn('boardId')"></th>
			<th>제목 <input type="button" value="▲" onclick="setOrderColumn('title')"></th>
			<th>내용 <input type="button" value="▲" onclick="setOrderColumn('content')"></th>
			<th>작성자 </th>
			<th>작성일자</th>
		</tr>


	 <c:forEach var="board" items="${fleaMarket}">
			<tr>
			    <td><a href="fleaMarket.do?boardId=${board.boardId}">${board.boardId}</a></td>
				<td><a href="fleaMarket.do?boardId=${board.boardId}">${board.title}</a></td>
				<td><a href="fleaMarket.do?boardId=${board.boardId}">${board.content}</a></td>
				<td><a href="fleaMarket.do?boardId=${board.boardId}">${board.writer}</a></td>
			</tr>
		</c:forEach>
	

	</table>
	<a href="">등록(글쓰기)</a>
</form>

</body>
</html>