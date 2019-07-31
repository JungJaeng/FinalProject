<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<script type="text/javascript">
$(document).ready(function() {
	
	// 검색하기
	$("#search").click(function() {
		location.href="/admin/apply_list?search="+$("#search").val();
	});
});
</script>

<style type="text/css">

#pagingBox {
	position: relative;
}

.serach {
	display:block;
	text-align: center;
	
}
</style>



<h1>관리자페이지 - 펜션요청확인</h1>
<hr>

<div class="serach">
<form action="/admin/apply_list" method="get">
		<select name="name"  style="vertical-align: middle;">
				<option value="pension_name">펜션명</option>
				<option value="user_nick">닉네임</option>
		</select>
		<input type="text"  name="search" >
	 	<button  style="vertical-align: middle;">검색</button>
</form>
</div>
<hr>



<table class="table table-striped" border="1" style=" text-align: center;
 	width: 100%; margin-left: auto; margin-right: auto;">


<thead>
	<tr>
		<th style="width: 10%; text-align: center; background-color: #D8D8D8;">요청 번호</th>
		<th style="width: 10%; text-align: center; background-color: #D8D8D8;">요청 닉네임</th>
		<th style="width: 10%; text-align: center; background-color: #D8D8D8;">펜션명</th>
		<th style="width: 20%; text-align: center; background-color: #D8D8D8;">펜션위치</th>				
		<th style="width: 10%; text-align: center; background-color: #D8D8D8;">요청 날짜</th>
	</tr>

</thead>

<tbody>
<c:forEach items="${applylist}" var="i">
	<tr>		
		<td>${i.apply_no }</td>
		<td>${i.writer_nick }</td>
		<td><a href="/admin/apply_view?apply_no=${i.apply_no }">${i.pension_name }</a></td>
		<td>${i.pension_postcode } ${i.pension_address } ${i.pension_detailAddress }
		<td><fmt:formatDate value="${i.apply_date }" pattern="yy-MM-dd"/></td>
	</tr>
	
</c:forEach>
</tbody>
</table>








