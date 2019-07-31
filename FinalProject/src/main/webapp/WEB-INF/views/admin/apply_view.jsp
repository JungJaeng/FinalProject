<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 


<script type="text/javascript">
// $(document).ready(function() {
	
// 	$("#applyBtn").click(function(){
// 		console.log("승인을 완료했습니다.");
		
// 		var form = $("#apply_post");
// 		form.attr("method","POST");
// 		form.attr("action", "/pension/pensionAction");
// 		form.submit();
		
// 		location.href = "/pension/list";
// 	})
// });



</script>


<div>
<h1 class="pull-left">펜션등록요청 상세보기</h1>
</div>
<div class="clearfix"></div>
<hr>

<form action="/admin/apply_view" method="post">
<div class="row">
	<div class=".col-lg-4 col-lg-4"></div>
	<div class=".col-lg-9 .col-lg-9">
	<div class="table table-responsive">
		<table class="table">
		<tr>
			<th class="success">요청 번호</th>
			<td>${view.apply_no }</td>
			<th class="success">작성자</th>
			<td>${view.writer_nick }</td>
		</tr>
		  
		
		<tr>
			<th class="success">펜션 이름</th>
			<td>${view.pension_name }</td>
			<th class="success">펜션 위치</th>
			<td>${view.pension_postcode } ${view.pension_address } ${view.pension_detailAddress }</td>
		</tr>
		
		<tr>
			<th class="success">펜션 소개</th>
			<td colspan="3">${view.pension_content }</td>
		</tr>
		
		<tr>
			<th class="success">객실명</th>
			<td colspan="3">${view.room_name }</td>
		</tr>
		
		<tr>
			<th class="success">객실 소개</th>
			<td colspan="3">${view.room_content }</td>
		</tr>
		
		<tr>
			<th class="success">객실 인원</th>
			<td colspan="3">${view.room_men}</td>
		</tr>
		
		<tr>
			<th class="success">객실 크기</th>
			<td colspan="3">${view.room_size}</td>
		</tr>
		
		<tr>
			<th class="success">객실 요금</th>
			<td colspan="3">${view.room_price}</td>
		</tr>
		
		<tr>
		</tr>
		</table>
		</div>
		</div>
		</div>
		

<div class="text-center">
	<a href="/admin/apply_list"><button class="btn btn-default">목록</button></a>
</div>	

	<input type="submit" class="btn btn-default" id="applyBtn">글 게시 승인
</form>


