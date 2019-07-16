<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.wrap {
	width:1080px;
	vertical-align: center;
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
    border-bottom: 3px solid #000;
}
.search {
	display:block;
	text-align:center; 
	background:#d9e1e8;
	padding:0 0 0 35px;
	font-size:18px;
	color:#5e5e5e;
	font-weight:bold;
	line-height: 50px;
	cursor:pointer;
	box-sizing: content-box;
	margin: 10px 0; !important
}
.button-right{
	text-align:right;
}
table .content:hover{
	background: #D5D5D5;
}
#btnWrite {
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
/* 	margin-right:10%; */
	border: 1px solid black;
	background-color: rgba(0,0,0,0);
	color: black;
	padding: 5px;
}
#btnWrite:hover{
    color:white;
    background-color: #5e5e5e;
    border: 1px solid #5e5e5e;
}
</style>

</head>
<body>
<div class="wrap">
<div class="tablediv">
<h1>게시판</h1>
<hr>

<table>
<thead>
	<tr>
		<th style="width: 10%;">구분</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 15%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 20%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${boardlist}" var="i">
		<tr class="content">
			<td>${i.board_no}</td>
			<td><a href="/board/view?board_no=${i.board_no }">${i.title }</a></td>
			<td>${i.writer_nick }</td>
			<td>${i.hit }</td>
		 	<td>${i.write_date }</td>
		</tr>
</c:forEach>
</tbody>
</table>
<c:if test="${usernick eq '관리자'}">
<button type="button" id="btnlistDelete" class="btn btn-primary" onclick="checklist();">체크 삭제</button>
</c:if>
</div>
<div class="paging">
<div class="button-right"><button id="btnWrite" onclick="location.href='/board/write'">글 쓰기</button></div>
</div>

<div class="search">
<form action="/board/list" method="get">
		<select name="name"  style="vertical-align: middle;">
				<option value="title">제목</option>
				<option value="content">본문</option>
				<option value="writer">작성자</option>
		</select>
		<input type="text"  name="search" placeholder="검색어를 입력해주세요." >
	 	<button  style="vertical-align: middle;">검색</button>
</form>
</div>
</div>
</body>
</html>