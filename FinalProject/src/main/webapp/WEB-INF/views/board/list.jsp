<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


var today = new Date();
$(document).ready(function(){
	$(".title").click(function(){
		location.href = $(this).attr("href");
	});
	$(".searchBtn").click(function(){
		var form = $("#searchForm");
		form.submit();
	});
	Date.prototype.format = function (f) {
	    if (!this.valueOf()) return " ";
	    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
	    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
	    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
	    var d = this;


	    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear(); // 년 (4자리)
	            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
	            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
	            case "dd": return d.getDate().zf(2); // 일 (2자리)
	            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
	            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
	            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
	            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
	            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
	            case "mm": return d.getMinutes().zf(2); // 분 (2자리)
	            case "ss": return d.getSeconds().zf(2); // 초 (2자리)
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
	            default: return $1;
	        }
	    });
	};


	String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
	String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
	Number.prototype.zf = function (len) { return this.toString().zf(len); };

	$(".content").each(function(){
		var today = new Date();
		today = today.format('yy-MM-dd');
		var format_date = $(this).attr("data-format_date");
		var write_date = $(this).attr('data-write_date');
		
		if(today == format_date){
			$(this).append("<td>"+$(this).attr('data-time')+"</td>")
		}else{
			$(this).append("<td>"+$(this).attr('data-day')+"</td>")
		}
	});
});
</script>
<style type="text/css">

.wrap {
	width:1080px;
	vertical-align: center;
}
table {
	font-size : 15px;
	width: 100%;
	border-collapse: collapse;
    text-align: center;
    line-height: 1.8;
}
table thead {
	padding: 10px;
	margin: 5px auto;
    font-weight: bold;
    vertical-align: top;
    background:#d9e1e8;
    border-top: 3px solid #DDD;
}
table tr{
	border-bottom: 1px solid #DDD;
}
th:hover{
	background:white;
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
	border-bottom: 3px solid #000;
}
.button-right{
	text-align:right;
}
table .content:hover{
	background: ##d9e1e8;
	
}
.btn {
	-moz-box-shadow:inset 0px 0px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 0px 0px 0px #ffffff;
	box-shadow:inset 0px 0px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
	background:-moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0);
	background-color:#ffffff;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:8px 8px;
	text-decoration:none;
	text-shadow:0px 0px 0px #bfbdbf;
	line-height: 10px !important;
}
.btn:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
	background:-moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
	background-color:#f6f6f6;
}
.btn:active {
	position:relative;
	top:1px;
}

.searchText,.searchList{
	font-size: 15px;
	height: 20px;
}
</style>

</head>
<body>
<div class="wrap">
<div class="tablediv">
<table>
<thead>
	<tr>
		<th style="width: 10%;">구분</th>
		<th style="width: 60%;">제목</th>
		<th style="width: 15%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 5%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${boardlist}" var="i">
		<tr class="content" 
		data-write_date="${i.write_date }"
		data-format_date="<fmt:formatDate value="${i.write_date }" pattern="yy-MM-dd" />"
		data-time="<fmt:formatDate value="${i.write_date }" pattern="HH : mm"/>"
		data-day="<fmt:formatDate value="${i.write_date }" pattern="MM - dd"/>">
			<td>${i.board_no}</td>
			<td class="title" href="/board/view?board_no=${i.board_no }"><a>${i.title }</a></td>
			<td>${i.writer_nick }</td>
			<td>${i.hit }</td>
		</tr>
</c:forEach>
</tbody>
</table>
<c:if test="${loginnick eq '관리자'}">
<button type="button" id="btnlistDelete" class="btn btn-primary" onclick="checklist();">체크 삭제</button>
</c:if>
</div>
<div class="paging">
<c:import url="/WEB-INF/views/board/paging.jsp"></c:import>
</div>
<c:if test="${login_id ne null}">
<div class="button-right"><button id="btnWrite" class="btn" onclick="location.href='/board/write'">글 쓰기</button></div>
</c:if>
<div class="search">
<form action="/board/list" method="get" id="searchForm">
		<select class="searchList" name="name"  style="vertical-align: middle;">
				<option value="title">제목</option>
				<option value="content">본문</option>
				<option value="writer">작성자</option>
		</select>
		<input class="searchText" type="text"  name="search" placeholder="검색어를 입력해주세요." >
	 	<a id="searchBtn" class="btn">검색</a>
	 	

	 	
	 	
</form>
</div>
</div>
</body>
</html>