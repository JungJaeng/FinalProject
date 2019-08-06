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


<div class="container">
<div>
<h1 class="pull-left">펜션 상세보기</h1>
</div>
<div class="clearfix"></div>
<hr>

<!-- 상세보기 영역 -->
<div id="pension_view">
펜션번호 : ${pension.pension_no }<br>
펜션이름 : ${pension.pension_name }<br>
펜션위치 : ${pension.pension_postcode } ${pension.pension_address } ${pension.pension_detailAddress }<br>
펜션소개 : ${pension.pension_content }<br>
</div>	<!-- 상세보기 영역 end -->
<hr>

<div id="room-view">
방 번호 : ${pension.room_no }<br>
방 이름 : ${pension.room_name }<br>
방 소개 : ${pension.room_content}<br>
방 인원 : ${pension.room_men}<br>
방 크기 : ${pension.room_size }<br>
방 가격 : ${pension.room_price }<br>
 

</div>


<hr>
<!-- 버튼 영역 -->
<div id="button">
	<a href="/pension/list"><button class="btn btn-default">목록</button></a>
	<a href="/pension/reserve?pension_no=${pension.pension_no }"><button class="btn btn-default">바로 예약하기</button></a>
	<c:if test="${login_nick eq '관리자' }">
		<a href="/pension/delete?pension_no=${pension.pension_no }"><button class="btn btn-danger">삭제</button></a>
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




