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

<style type="text/css">
.pensionTable{
	border-top:1px solid black;
	background-color: #b08e9954;
	width : 100%;
	border-bottom: 1px solid black;
}

.roomTable{
	border-top:1px solid black;
	background-color: #b08e9954;
	width : 100%;
	border-bottom: 1px solid black;
}

.listBtn{
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
	width: 40px;
	size: 10cm;
}

</style>

<div>
<h2 class="pull-left">펜션등록요청 상세보기</h2>
</div>
<div class="clearfix"></div>
<hr>


		<table class="pensionTable">
		<tr>
			<th style="width: 10%; ">요청 번호</th>
			<td>${view.apply_no }</td>
			<th style="width: 10%">작성자</th>
			<td>${view.writer_id }</td>
		</tr>
		  
		
		<tr>
			<th style="width: 20%;">펜션 이름</th>
			<td>${view.pension_name }</td>
			<th style="width: 20%;">펜션 위치</th>
			<td>${view.pension_postcode } ${view.pension_address } ${view.pension_detailAddress }</td>
		</tr>
		
		<tr>
			<th style="width: 30%;">펜션 소개</th>
			<td colspan="3">${view.pension_content }</td>
		</tr>
		</table>
		
		<br><br><br>
		
		<table class="roomTable">
		
		<tr>
			<th style="width: 15%; border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid black;">객실명</th>
			<td style="width: 20%; border-top: 1px solid black; border-bottom: 1px solid black;">${view.room_name }</td>
		</tr>
		
		<tr>
			<th style="width: 15%; border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid black;">객실 소개</th>
			<td style="width: 20%; border-top: 1px solid black; border-bottom: 1px solid black; ">${view.room_men}</td>
		</tr>
		
		<tr>
			<th style="width: 15%; border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid black;">객실 크기</th>
			<td style="width: 20%; border-top: 1px solid black; border-bottom: 1px solid black; ">${view.room_size}</td>
		</tr>
		
		<tr>
			<th style="width: 15%; border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid black;">객실 인원</th>
			<td style="width: 15%; border-top: 1px solid black; border-bottom: 1px solid black;">${view.room_content} 2명</td>
		</tr>
		
		<tr>
			<th style="width: 15%; border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid black;">객실 요금</th>
			<td style="width: 20%; border-top: 1px solid black; border-bottom: 1px solid black; ">${view.room_price}</td>
		</tr>
		
		<tr>
		</tr>
		</table>
	

<br><br>
<div class="text-center">
	<a href="/admin/apply_list"><button class="listBtn">목록</button></a>
</div>	

