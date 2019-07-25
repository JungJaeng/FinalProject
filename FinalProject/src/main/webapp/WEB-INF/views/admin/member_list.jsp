<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<script type="text/javascript">
$(document).ready(function() {
	
	// 검색하기
	$("#search").click(function() {
		location.href="/admin/member_list?search="+$("#search").val();
	});
	
	// 선택체크 삭제
	$("#btnDelete").click(function() {
		// 선택된 체크박스
		var $checkboxes
		 = $("input:checkbox[name='checkRow']:checked");
	
		// 체크된 대상들을 map으로 만들고 map을 문자열로 만들기
		var map = $checkboxes.map(function() {
			return $(this).val();
		});
		var names = map.get().join(",");
		console.log("names : " + names);
		
		// 전송 폼
		var $form = $("<form>")
			.attr("action", "/admin/member_delete")
			.attr("method", "post")
			.append(
				$("<input>")
					.attr("type", "hidden")
					.attr("name", "names")
					.attr("value", names)
			);
		$(document.body).append($form);
		$form.submit();
	
	});		
	
});

//전체 체크/해제
function checkAll() {
	// checkbox들
	var $checkboxes=$("input:checkbox[name='checkRow']");

	// checkAll 체크상태 (true:전체선택, false:전체해제)
	var check_status = $("#checkAll").is(":checked");
	
	if( check_status ) {
		// 전체 체크박스를 checked로 바꾸기
		$checkboxes.each(function() {
			this.checked = true;	
		});
	} else {
		// 전체 체크박스를 checked 해제하기
		$checkboxes.each(function() {
			this.checked = false;	
		});
	}
}
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
		<th style="width: 10%; text-align: center; background-color: #D8D8D8;"><input type="checkbox" id="checkAll" onclick="checkAll();">회원 번호</th>
		<th style="width: 10%; text-align: center; background-color: #D8D8D8;">회원 아이디</th>
		<th style="width: 10%; text-align: center; background-color: #D8D8D8;">회원 비밀번호</th>
		<th style="width: 10%; text-align: center; background-color: #D8D8D8;">회원 닉네임</th>
		<th style="width: 15%; text-align: center; background-color: #D8D8D8;">회원 이메일</th>
		<th style="width: 10%; text-align: center; background-color: #D8D8D8;" >회원 등급번호</th>
	</tr>

</thead>

<tbody>
<c:forEach items="${memberlist}" var="i">
	<tr>		
		<td><input type="checkbox" name="checkRow" value="${i.user_no }"/>${i.user_no }</td>
		<td>${i.user_id }</td>
		<td>${i.user_pw }</td>
		<td>${i.user_nick }</td>
		<td>${i.user_email }</td>
		<td>${i.user_join_no }</td>
		
	</tr>
	
</c:forEach>
</tbody>
</table>
<button id="btnDelete" class="btn btn-warning pull-left">체크 삭제</button>



<div class="paging">

</div>


