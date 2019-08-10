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
	text-align:center; 
	background:#efe8e8;
	padding:0 0 0 35px;
	font-size:18px;
	color:#5e5e5e;
	font-weight:bold;
	line-height: 50px;
	cursor:pointer;
	box-sizing: content-box;
	margin: 10px 0; !important
	
}

table {
	width: 100%;
	border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
}

table thead {
	padding: 10px;
    font-weight: bold;
    vertical-align: top;

}

.searchBtn {
	-webkit-border-radius:10px;
	-moz-border-radius:5px;
	border-radius:5px;
	border:1px solid #ccc;
	display:inline-block;
	font-size:1px;
	padding:7px 7px;
	font-family:Arial;
	color:#585858;
	cursor:pointer;
	font-weight:bold;
	text-decoration:none;
	text-shadow:0px 0px 0px #ccc;
	line-height: 10px !important;
	width: 100px;
	size: 10cm;
	}



      
th, tr {
     padding: 10px;
     text-align: center;
      }
      
.deleteBtn {
	-webkit-border-radius:10px;
	-moz-border-radius:5px;
	border-radius:5px;
	border:1px solid #ccc;
	display:inline-block;
	font-size:1px;
	padding:7px 7px;
	font-family:Arial;
	color:#585858;
	cursor:pointer;
	font-weight:bold;
	text-decoration:none;
	text-shadow:0px 0px 0px #ccc;
	line-height: 10px !important;
	width: 100px;
	size: 10cm;
	}




</style>



<h2>관리자페이지 - 회원관리</h2>
<hr>

<div class="serach">
<form action="/admin/member_list" method="get">
		<select name="name"  style="vertical-align: middle;">
				<option value="user_id">아이디</option>
				<option value="user_nick">닉네임</option>
		</select>
		<input type="search"  name="search" >
	 	<button class="searchBtn">검색</button>
</form>
</div>
<hr>



<table class="table table-striped" border="1" style="text-align: center;
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
<button id="btnDelete" class="deleteBtn">체크 삭제</button>



<div class="clearfix"></div>

<jsp:include page="/WEB-INF/views/admin/member_paging.jsp" />


