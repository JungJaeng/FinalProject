<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<script type="text/javascript">
$(document).ready(function() {
		
	$("#search").click(function() {
		location.href="/admin/member_list?search="+$("#search").val();
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



<h1>관리자페이지 - 회원관리</h1>
<hr>

<div class="serach">
<form action="/admin/member_list" method="get">
		<select name="name"  style="vertical-align: middle;">
				<option value="user_id">아이디</option>
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
		<th style="width: 5%; text-align: center; background-color: #D8D8D8;" ><input type="checkbox" id="chkAll">회원 번호</th>
		<th style="width: 10%; text-align: center; background-color: #D8D8D8;">회원 아이디</th>
		<th style="width: 10%; text-align: center; background-color: #D8D8D8;">회원 비밀번호</th>
		<th style="width: 10%; text-align: center; background-color: #D8D8D8;">회원 닉네임</th>
		<th style="width: 15%; text-align: center; background-color: #D8D8D8;">회원 이메일</th>
	</tr>
	
</thead>

<tbody>
<c:forEach items="${memberlist}" var="i">
	<tr>		
		<td><input id="checkbox" type="checkbox"/>&nbsp;&nbsp;${i.user_no }</td>
		<td>${i.user_id }</td>
		<td>${i.user_pw }</td>
		<td>${i.user_nick }</td>
		<td>${i.user_email }</td>
	</tr>
	
</c:forEach>
</tbody>
</table>
<button type="button" id="btnlistDelete" onclick="checkDelete();">체크 삭제</button>



<div id="pagingBox">
<c:import url="/WEB-INF/tiles/layout/paging_memberList.jsp"/>
</div>


