<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="container">
<div>
<h1 class="pull-left">게시글 상세보기</h1>
</div>
<div class="clearfix"></div>
<hr>

<!-- 상세보기 영역 -->
<div>
요청번호 : ${view.apply_no }<br>
<label>아이디</label> : <input type="text" name="login_id" value=${sessionScope.login_id }> <br>
펜션 이름 : ${view.pension_name }<br>
펜션위치 : ${view.pension_location }<br>
방 이름 : ${view.room_name }<br>
방 인원 : ${view.room_men }<br>
방 소개 : ${view.room_content}<br>
방 크기 : ${view.room_size }<br>
방 가격 : ${view.room_price }<br>
작성일자 : <fmt:formatDate value="${view.apply_date }"
				pattern="yy-MM-dd HH:mm:ss" /><br>
</div>	<!-- 상세보기 영역 end -->

<!-- 버튼 영역 -->
<div class="text-center">
	<a href="/admin/apply_list"><button class="btn btn-default">목록</button></a>

</div>	<!-- 버튼 영역 end -->


</div>	<!-- container end -->

