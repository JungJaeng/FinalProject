<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<style type="text/css">

#button {
	text-align: center;
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
 </div>
 
 <div class="pensionInfo">
  <p class="pensionName"><span>펜션명 </span>${pension.pension_name}</p>
  
  <p class="pensionLocation"><span>펜션위치 </span>
  <p class="pensionLocation"><span>${pension.pension_postcode}</span><br><span>${pension.pension_address }</span><br><span>${pension.pension_detailAddress }</span></p>
  
  <p class="pensionContent"><span>펜션소개 </span><br><br>${pension.pension_content}</p>
 
 </div>
 </div>
<hr>

 <div class=room>
 <div class="roomInfo">
  <p class="room_content"><span>객실소개 </span>${pension.room_content}</p>
  
  <p class="room_name"><span>객실명 </span>${pension.room_name}</p>

  <p class="room_men"><span>객실인원 </span>${pension.room_men}</p>
  
  <p class="room_size"><span>객실크기 </span>${pension.room_size}</p>
  
  <p class="room_price"><span>객실요금 </span>${pension.room_price}원</p>
</div>
</div>
<!-- 버튼 영역 -->
<div id="button">
	<a href="/pension/list"><button class="btn btn-default">목록</button></a>
	<a href="/pension/reserve?pension_no=${pension.pension_no }"><button class="btn btn-default">바로 예약하기</button></a>
	<c:if test="${login_nick eq '관리자' }">
		<a href="/pension/delete?pension_no=${pension.pension_no }"><button class="btn btn-default">삭제</button></a>
	</c:if>
</div>	<!-- 버튼 영역 end -->
<!-- 댓글 처리 -->
<div>

<hr>
<!-- 댓글 입력 -->
<div class="form-inline text-center">
	<input type="text" size="7" class="form-control"
		id="commentWriter"
		value="${sessionScope.login_id }" readonly="readonly"/>
	<textarea rows="2" cols="60"
		class="form-control" id="commentContent"></textarea>
	<button id="btnCommInsert" class="btn">입력</button>
</div>	<!-- 댓글 입력 end -->

<!-- 댓글 리스트 -->
<table class="table table-striped table-hover table-condensed">
<thead>
<tr>
	<th>번호</th>
	<th>작성자</th>
	<th>댓글</th>
	<th>작성일</th>
	<th></th>
</tr>
</thead>
<tbody>
<c:forEach items="${commentList }" var="comment">
<tr data-commentno="${comment.commentNo }">
	<td>${comment.rnum }</td>
	<td>${comment.writer_nick }</td>
	<td>${comment.content }</td>
	<td>
		<fmt:formatDate value="${comment.writtenDate }"
			pattern="yy-MM-dd hh:mm:ss" />
	</td>
	<td>
		<c:if test="${sessionScope.login_id eq comment.writer_nick }">
		<button class="btn btn-default"
			onclick="deleteComment(${comment.commentNo });">삭제</button>
		</c:if>
	</td>
	
</tr>
</c:forEach>
</tbody>
</table>	<!-- 댓글 리스트 end -->

</div>	<!-- 댓글 처리 end -->

</div>	<!-- container end -->




