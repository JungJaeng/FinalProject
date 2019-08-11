<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="wrap">
<div class="tablediv">
<table>
<thead>
	<tr>
		<th style="width: 10%;">구분</th>
		<th style="width: 10%;">지역</th>
		<th style="width: 35%;">제목</th>
		<th style="width: 15%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 20%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${mytripspotlist}" var="i">
		<tr class="content">
			<td>${i.board_no}</td>
			<td>${i.region } ${i.region_detail }</td>
			<td><a href="/tripspot/view?board_no=${i.board_no }">${i.title }</a></td>
			<td>${i.writer_nick }</td>
			<td>${i.hit }</td>
		 	<td><fmt:formatDate value="${i.writendate }" pattern="yyyy-MM-dd" /></td>
		</tr>
</c:forEach>
</tbody>
</table>



<script type="text/javascript">

</script>


</div>
</div>