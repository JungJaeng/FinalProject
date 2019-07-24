<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="container">
<div>
<h1 class="pull-left">펜션 상세보기</h1>
</div>
<div class="clearfix"></div>
<hr>

<!-- 상세보기 영역 -->
<div>
펜션번호 : ${view.pension_no }<br>
펜션이름 : ${view.pension_name }<br>
펜션위치 : ${view.pension_location }<br>
펜션소개 : ${view.pension_content }<br>
</div>	<!-- 상세보기 영역 end -->

<!-- 버튼 영역 -->
<div class="text-center">
	<a href="/board/list"><button class="btn btn-default">목록</button></a>
	<c:if test="${id eq view.writer_id }">
		<a href="/board/update?board_no=${view.board_no }"><button class="btn btn-primary">수정</button></a>
		<a href="/board/delete?board_no=${view.board_no }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div>	<!-- 버튼 영역 end -->

<!-- 댓글 처리 -->
<div>

<hr>
<!-- 댓글 입력 -->
<div class="form-inline text-center">
	<input type="text" size="7" class="form-control"
		id="commentWriter"
		value="${sessionScope.nick }" readonly="readonly"/>
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
	<td>${comment.commentWriter }</td>
	<td>${comment.content }</td>
	<td>
		<fmt:formatDate value="${comment.writtenDate }"
			pattern="yy-MM-dd hh:mm:ss" />
	</td>
	<td>
		<c:if test="${sessionScope.id eq comment.userid }">
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



