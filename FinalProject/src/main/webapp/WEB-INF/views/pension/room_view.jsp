<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<style type="text/css">

#button {
	text-align: center;
}

.guel {
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
	width: 40px;
	size: 10cm;
}

#btnCommInsert {
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

#commentDiv {
	text-align: center;
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

.resBtn{
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

.delete_Btn{
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

.pensionInfo{
	border-top:1px solid black;
	width : 100%;
	height: 20px;
	
}

.roomInfo {
	border-top:1px solid black;
	width : 100%;
	height: 20px;
}

th, tr, td{
	padding: 30px;
}
</style>


<script type="text/javascript">
$(document).ready(function() {
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		$form = $("<form>").attr({
			action: "/pension/insertComment",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"pensionNo",
				value:"${pension.pension_no }"
			})
		).append(
			$("<input>").attr({
				type:"hidden",
				name:"writer_nick",
				value:"${sessionScope.login_id }"
			})
		).append(
			$("<input>").attr({
				type:"hidden",
				name:"commentWriter",
				value:$("#commentWriter").val()
			})
		).append(
			$("<textarea>")
				.attr("name", "content")
				.css("display", "none")
				.text($("#commentContent").val())
		);
		$(document.body).append($form);
		$form.submit();
	});
});

// 댓글 삭제
function deleteComment(commentNo) {
	$.ajax({
		type: "post"
		, url: "/pension/deleteComment"
		, dataType: "json"
		, data: {
			commentNo: commentNo
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-commentno='"+commentNo+"']").remove();
				
			} else {
				alert("댓글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}
</script>



<h2 class="pull-left">펜션 상세보기</h2>
<hr>

<div class="clearfix"></div>


<div class="pension">

 <div class="thumb">
  <img src="/resources/img/pen1.jpg">
  <img src="/resources/img/pen2.jpg">
 </div>
 
 <table class="pensionInfo">
  <tr>
  <th class="pensionName" style="width: 10%;">펜션명</th>
  <td class="pensionName" style="width: 10%;">${pension.pension_name}</td>
  
  <th class="pensionLocation" style="width: 10%;">펜션위치</th>
  <td class="pensionLocation" style="width: 15%;">${pension.pension_postcode}<br>${pension.pension_address }<br>${pension.pension_detailAddress }</td>
  
  <th class="pensionContent" style="width: 10%;">펜션소개</th>
  <td class="pensionContent" style="width: 10%;">${pension.pension_content}</td>
 </tr>
 </table>
 </div>
 


 <div class=room>
 <table class="roomInfo">
 <tr>
  <th class="room_content" style="width: 10%;">객실소개</th> 
  <td class="room_content" style="width: 30%; text-align:center;">${pension.room_content}</td>

  
  <th class="room_name" style="width: 10%;">객실명</th>
  <td class="room_name" style="width: 10%; text-align:center;">${pension.room_name}</td>

  <th class="room_men" style="width: 10%;">객실인원</th>
  <td class="room_men" style="width: 10%; text-align:center;">${pension.room_men}</td>
  
  <th class="room_size" style="width: 10%;">객실크기</th>
  <td class="room_size" style="width: 2%; text-align:center;">${pension.room_size}</td>
  
  <th class="room_price" style="width: 10%;">객실요금</th>
  <td class="room_price" style="width: 2%; text-align:center;">${pension.room_price}원</td>
</tr>
</table>
<hr>
</div>
<!-- 버튼 영역 -->
<div id="button">
	<a href="/pension/list"><button class="listBtn">목록</button></a>
	<a href="/pension/reserve?pension_no=${pension.pension_no }"><button class="resBtn">바로 예약하기</button></a>
	<c:if test="${login_nick eq '관리자' }">
		<a href="/pension/delete?pension_no=${pension.pension_no }"><button class="delete_Btn">삭제</button></a>
	</c:if>
</div>	<!-- 버튼 영역 end -->
<!-- 댓글 처리 -->
<div>
<hr>
<!-- 댓글 입력 -->
<div id="commentDiv">
	<input type="text" size="10" class="form-control"
		id="commentWriter"
		value="${sessionScope.login_id }" readonly="readonly"/>
	<textarea rows="2" cols="50"
		class="form-control" id="commentContent"></textarea>
	<button id="btnCommInsert" class="btn">입력</button>
</div>	<!-- 댓글 입력 end -->

<!-- 댓글 리스트 -->
<table class="table table-striped table-hover table-condensed">
<thead>
<tr>
	<th style="width:15%">번호</th>
	<th style="width:10%">작성자</th>
	<th style="width:40%">댓글</th>
	<th style="width:30%">작성일</th>
	<th></th>
</tr>
</thead>
<tbody>
<c:forEach items="${commentList }" var="comment">
<tr class="guel" data-commentno="${comment.commentNo }">
	<td style="width:15%">${comment.rnum }</td>
	<td style="width:10%">${comment.writer_nick }</td>
	<td style="width:40%">${comment.content }</td>
	<td style="width:40%">
		<fmt:formatDate value="${comment.writtenDate }"
			pattern="yy-MM-dd hh:mm:ss" />
	</td>
	<td>
		<c:if test="${sessionScope.login_id eq comment.writer_nick }">
		<button class="deleteBtn"
			onclick="deleteComment(${comment.commentNo });">삭제</button>
		</c:if>
	</td>
	
</tr>
</c:forEach>
</tbody>
</table>	<!-- 댓글 리스트 end -->

</div>	<!-- 댓글 처리 end -->





