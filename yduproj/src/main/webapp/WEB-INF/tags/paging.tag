<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.ydu.biz.board.Paging" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>



<div style="width:90%">
<table>
<tr>

<td>[이전]</td>

<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
	<c:if test="${i != paging.page}">
		<td><a href="#" onclick="goPage(${i})">[ ${i} ]</a></td>
	</c:if>
	<c:if test="${i == paging.page}">
		<td class="active">[ ${i} ]</td>
	</c:if>
</c:forEach>

<td>[다음]</td>

</tr>
</table>
</div>